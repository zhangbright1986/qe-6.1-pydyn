!    This file is part of ELPA.
!
!    The ELPA library was originally created by the ELPA consortium,
!    consisting of the following organizations:
!
!    - Max Planck Computing and Data Facility (MPCDF), formerly known as
!      Rechenzentrum Garching der Max-Planck-Gesellschaft (RZG),
!    - Bergische Universität Wuppertal, Lehrstuhl für angewandte
!      Informatik,
!    - Technische Universität München, Lehrstuhl für Informatik mit
!      Schwerpunkt Wissenschaftliches Rechnen ,
!    - Fritz-Haber-Institut, Berlin, Abt. Theorie,
!    - Max-Plack-Institut für Mathematik in den Naturwissenschaften,
!      Leipzig, Abt. Komplexe Strukutren in Biologie und Kognition,
!      and
!    - IBM Deutschland GmbH
!
!
!    More information can be found here:
!    http://elpa.mpcdf.mpg.de/
!
!    ELPA is free software: you can redistribute it and/or modify
!    it under the terms of the version 3 of the license of the
!    GNU Lesser General Public License as published by the Free
!    Software Foundation.
!
!    ELPA is distributed in the hope that it will be useful,
!    but WITHOUT ANY WARRANTY; without even the implied warranty of
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!    GNU Lesser General Public License for more details.
!
!    You should have received a copy of the GNU Lesser General Public License
!    along with ELPA.  If not, see <http://www.gnu.org/licenses/>
!
!    ELPA reflects a substantial effort on the part of the original
!    ELPA consortium, and we ask you to respect the spirit of the
!    license that we chose: i.e., please contribute any changes you
!    may have back to the original ELPA library distribution, and keep
!    any derivatives of ELPA under the same license that we chose for
!    the original distribution, the GNU Lesser General Public License.
!
!
#include "config-f90.h"
!>

program test_transpose_multiply

   use precision
   use ELPA1
   use elpa_utilities, only : error_unit
#ifdef WITH_OPENMP
   use test_util
#endif

   use mod_read_input_parameters
   use mod_check_correctness
   use mod_setup_mpi
   use mod_blacs_infrastructure
   use mod_prepare_matrix

   use elpa_mpi
#ifdef HAVE_REDIRECT
   use redirect
#endif
#ifdef HAVE_DETAILED_TIMINGS
  use timings
#endif
  use output_types

   implicit none

   !-------------------------------------------------------------------------------
   ! Please set system size parameters below!
   ! na:   System size
   ! nev:  Number of eigenvectors to be calculated
   ! nblk: Blocking factor in block cyclic distribution
   !-------------------------------------------------------------------------------
   integer(kind=ik)           :: nblk
   integer(kind=ik)           :: na, nev

   integer(kind=ik)           :: np_rows, np_cols, na_rows, na_cols

   integer(kind=ik)           :: myid, nprocs, my_prow, my_pcol, mpi_comm_rows, mpi_comm_cols
   integer(kind=ik)           :: i, mpierr, my_blacs_ctxt, sc_desc(9), info, nprow, npcol

   integer, external          :: numroc

   real(kind=rk4), allocatable    :: ev(:), xr(:,:)
   complex(kind=ck4), allocatable :: a(:,:), b(:,:), c(:,:), z(:,:), tmp1(:,:), tmp2(:,:), as(:,:)
   complex(kind=ck4), parameter   :: CZERO = (0.0_rk4,0.0_rk4), CONE = (1.0_rk4,0.0_rk4)
   real(kind=rk4)              :: norm, normmax
#ifdef WITH_MPI
   real(kind=rk4)              :: pclange
#else
   real(kind=rk4)              :: clange
#endif

   integer(kind=ik)           :: iseed(4096) ! Random seed, size should be sufficient for every generator

   integer(kind=ik)           :: STATUS
#ifdef WITH_OPENMP
   integer(kind=ik)           :: omp_get_max_threads,  required_mpi_thread_level, &
                                 provided_mpi_thread_level
#endif
   type(output_t)             :: write_to_file
   logical                    :: success
   character(len=8)           :: task_suffix
   integer(kind=ik)           :: j
   !-------------------------------------------------------------------------------

   success = .true.

   call read_input_parameters(na, nev, nblk, write_to_file)

   !-------------------------------------------------------------------------------
   !  MPI Initialization
   call setup_mpi(myid, nprocs)

   STATUS = 0

#ifdef HAVE_DETAILED_TIMINGS

   ! initialise the timing functionality

#ifdef HAVE_LIBPAPI
   call timer%measure_flops(.true.)
#endif

   call timer%measure_allocated_memory(.true.)
   call timer%measure_virtual_memory(.true.)
   call timer%measure_max_allocated_memory(.true.)

   call timer%set_print_options(&
#ifdef HAVE_LIBPAPI
                print_flop_count=.true., &
                print_flop_rate=.true., &
#endif
                print_allocated_memory = .true. , &
                print_virtual_memory=.true., &
                print_max_allocated_memory=.true.)


  call timer%enable()

  call timer%start("program")
#endif

   do np_cols = NINT(SQRT(REAL(nprocs))),2,-1
      if(mod(nprocs,np_cols) == 0 ) exit
   enddo

   ! at the end of the above loop, nprocs is always divisible by np_cols

   np_rows = nprocs/np_cols

   if(myid==0) then
      print '(3(a,i0))','Matrix size=',na,', Block size=',nblk
      print '(3(a,i0))','Number of processor rows=',np_rows,', cols=',np_cols,', total=',nprocs
      print *
   endif

   !-------------------------------------------------------------------------------
   ! Set up BLACS context and MPI communicators
   !
   ! The BLACS context is only necessary for using Scalapack.
   !
   ! For ELPA, the MPI communicators along rows/cols are sufficient,
   ! and the grid setup may be done in an arbitrary way as long as it is
   ! consistent (i.e. 0<=my_prow<np_rows, 0<=my_pcol<np_cols and every
   ! process has a unique (my_prow,my_pcol) pair).

   call set_up_blacsgrid(mpi_comm_world, my_blacs_ctxt, np_rows, np_cols, &
                         nprow, npcol, my_prow, my_pcol)

   if (myid==0) then
     print '(a)','| Past BLACS_Gridinfo.'
   end if

   ! All ELPA routines need MPI communicators for communicating within
   ! rows or columns of processes, these are set in elpa_get_communicators.

   mpierr = elpa_get_communicators(mpi_comm_world, my_prow, my_pcol, &
                                   mpi_comm_rows, mpi_comm_cols)

   if (myid==0) then
     print '(a)','| Past split communicator setup for rows and columns.'
   end if

   call set_up_blacs_descriptor(na ,nblk, my_prow, my_pcol, np_rows, np_cols, &
                                na_rows, na_cols, sc_desc, my_blacs_ctxt, info)

   if (myid==0) then
     print '(a)','| Past scalapack descriptor setup.'
   end if

   !-------------------------------------------------------------------------------
   ! Allocate matrices and set up a test matrix for the eigenvalue problem
#ifdef HAVE_DETAILED_TIMINGS
   call timer%start("set up matrix")
#endif
   allocate(a (na_rows,na_cols))
   allocate(b (na_rows,na_cols))
   allocate(c (na_rows,na_cols))

   allocate(z (na_rows,na_cols))
   allocate(as(na_rows,na_cols))

   allocate(ev(na))
   allocate(xr(na_rows,na_cols))
   call prepare_matrix_single(na, myid, sc_desc, iseed, xr, a, z, as)
   deallocate(xr)
   b(:,:) = 2.0_ck4 * a(:,:)
   c(:,:) = 0.0_ck4

#ifdef HAVE_DETAILED_TIMINGS
   call timer%stop("set up matrix")
#endif

   !-------------------------------------------------------------------------------
   ! Calculate eigenvalues/eigenvectors

   if (myid==0) then
     print '(a)','| Compute c= a**T * b ... '
     print *
   end if
#ifdef WITH_MPI
   call mpi_barrier(mpi_comm_world, mpierr) ! for correct timings only
#endif

   success = elpa_mult_ah_b_complex_single("F","F", na, na, a, na_rows, na_cols, b, na_rows, na_cols, &
                                           nblk, mpi_comm_rows, mpi_comm_cols, c, na_rows, na_cols)

   if (.not.(success)) then
      write(error_unit,*) " elpa_mult_at_b_complex produced an error! Aborting..."
#ifdef WITH_MPI
      call MPI_ABORT(mpi_comm_world, 1, mpierr)
#endif
   endif


   if (myid==0) then
     print '(a)','| Solve c = a**T * b complete.'
     print *
   end if


   !-------------------------------------------------------------------------------
   ! Test correctness of result (using plain scalapack routines)
   allocate(tmp1(na_rows,na_cols))
   allocate(tmp2(na_rows,na_cols))

   tmp1(:,:) = 0.0_ck4

   ! tmp1 = a**T
#ifdef WITH_MPI
   call pctranc(na, na, CONE, a, 1, 1, sc_desc, CZERO, tmp1, 1, 1, sc_desc)
#else
   tmp1 = transpose(conjg(a))
#endif
   ! tmp2 = tmp1 * b
#ifdef WITH_MPI
   call pcgemm("N","N", na, na, na, CONE, tmp1, 1, 1, sc_desc, b, 1, 1, &
               sc_desc, CZERO, tmp2, 1, 1, sc_desc)
#else
   call cgemm("N","N", na, na, na, CONE, tmp1, na, b, na, CZERO, tmp2, na)
#endif

   ! compare tmp2 with c
   tmp2(:,:) = tmp2(:,:) - c(:,:)

#ifdef WITH_MPI
   norm = pclange("M",na, na, tmp2, 1, 1, sc_desc, tmp1)
#else
   norm = clange("M",na, na, tmp2, na_rows, tmp1)
#endif
#ifdef WITH_MPI
   call mpi_allreduce(norm,normmax,1,MPI_REAL4,MPI_MAX,MPI_COMM_WORLD,mpierr)
#else
   normmax = norm
#endif
   if (myid .eq. 0) then
     print *," Maximum error of result: ", normmax
   endif

   if (normmax .gt. 5e-2_rk4) then
        status = 1
   endif

   deallocate(a)
   deallocate(b)
   deallocate(c)

   deallocate(as)

   deallocate(z)
   deallocate(tmp1)
   deallocate(tmp2)
   deallocate(ev)

#ifdef HAVE_DETAILED_TIMINGS
   call timer%stop("program")
   print *," "
   print *,"Timings program:"
   print *," "
   call timer%print("program")
   print *," "
   print *,"End timings program"
   print *," "
#endif

#ifdef WITH_MPI
   call blacs_gridexit(my_blacs_ctxt)
   call mpi_finalize(mpierr)
#endif

   call EXIT(STATUS)


end

!-------------------------------------------------------------------------------
