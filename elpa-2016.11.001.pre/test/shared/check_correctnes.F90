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

module mod_check_correctness


  interface check_correctness_double
    module procedure check_correctness_complex_double
    module procedure check_correctness_real_double
  end interface

  interface check_correctness
    module procedure check_correctness_complex_double
    module procedure check_correctness_real_double
  end interface

#ifdef WANT_SINGLE_PRECISION_REAL
  interface check_correctness_single
#ifdef WANT_SINGLE_PRECISION_COMPLEX
    module procedure check_correctness_complex_single
#endif
    module procedure check_correctness_real_single
  end interface
#endif

  contains

#define DOUBLE_PRECISION_COMPLEX 1
    function check_correctness_complex_double(na, nev, as, z, ev, sc_desc, myid, tmp1, tmp2) result(status)

      use elpa_mpi
      use precision
      implicit none
      integer(kind=ik)                 :: status
      integer(kind=ik), intent(in)     :: na, nev, myid
      complex(kind=ck8), intent(in)     :: as(:,:), z(:,:)
      complex(kind=ck8), intent(inout)  :: tmp1(:,:), tmp2(:,:)
      real(kind=rk8)                    :: ev(:)
      complex(kind=ck8)                 :: xc
      integer(kind=ik)                 :: sc_desc(:), mpierr
      complex(kind=ck8), parameter      :: CZERO = (0.0_rk8,0.0_rk8), CONE = (1.0_rk8,0.0_rk8)
      integer(kind=ik)                 :: i
      real(kind=rk8)                    :: err, errmax
#ifndef WITH_MPI
      complex(kind=ck8)                 :: zdotc, cdotc
#endif

      status = 0

      ! 1. Residual (maximum of || A*Zi - Zi*EVi ||)
      ! tmp1 =  A * Z
      ! as is original stored matrix, Z are the EVs
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call pzgemm('N', 'N', na, nev, na, CONE, as, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, CZERO, tmp1, 1, 1, sc_desc)
#else
      call pcgemm('N', 'N', na, nev, na, CONE, as, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, CZERO, tmp1, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
      call zgemm('N','N',na,nev,na,CONE,as,na,z,na,CZERO,tmp1,na)
#else
      call cgemm('N','N',na,nev,na,CONE,as,na,z,na,CZERO,tmp1,na)
#endif

#endif /* WITH_MPI */
      ! tmp2 = Zi*EVi
      tmp2(:,:) = z(:,:)
      do i=1,nev
        xc = ev(i)
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
        call pzscal(na, xc, tmp2, 1, i, sc_desc, 1)
#else
        call pcscal(na, xc, tmp2, 1, i, sc_desc, 1)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
        call zscal(na,xc,tmp2(1,i),1)
#else
        call cscal(na,xc,tmp2(1,i),1)
#endif

#endif /* WITH_MPI */
      enddo

      !  tmp1 = A*Zi - Zi*EVi
      tmp1(:,:) =  tmp1(:,:) - tmp2(:,:)

      ! Get maximum norm of columns of tmp1
#ifdef DOUBLE_PRECISION_COMPLEX
      errmax = 0.0_rk8
#else
      errmax = 0.0_rk4
#endif
      do i=1,nev
        xc = 0
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
        call pzdotc(na, xc, tmp1, 1, i, sc_desc, 1, tmp1, 1, i, sc_desc, 1)
#else
        call pcdotc(na, xc, tmp1, 1, i, sc_desc, 1, tmp1, 1, i, sc_desc, 1)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
        xc = zdotc(na,tmp1,1,tmp1,1)
#else
        xc = cdotc(na,tmp1,1,tmp1,1)
#endif

#endif /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
        errmax = max(errmax, sqrt(real(xc,kind=rk8)))
#else
        errmax = max(errmax, sqrt(real(xc,kind=rk4)))
#endif
      enddo

      ! Get maximum error norm over all processors
      err = errmax
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call mpi_allreduce(err, errmax, 1, MPI_REAL8, MPI_MAX, MPI_COMM_WORLD, mpierr)
#else
      call mpi_allreduce(err, errmax, 1, MPI_REAL4, MPI_MAX, MPI_COMM_WORLD, mpierr)
#endif

#else /* WITH_MPI */
      errmax = err
#endif /* WITH_MPI */

      if (myid==0) print *
      if (myid==0) print *,'Error Residual     :',errmax
#ifdef DOUBLE_PRECISION_COMPLEX
      if (errmax .gt. 5e-12_rk8) then
#else
      if (errmax .gt. 3e-3_rk4) then
#endif
        status = 1
      endif

      ! 2. Eigenvector orthogonality

      ! tmp1 = Z**T * Z
      tmp1 = 0
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call pzgemm('C', 'N', nev, nev, na, CONE, z, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, CZERO, tmp1, 1, 1, sc_desc)
#else
      call pcgemm('C', 'N', nev, nev, na, CONE, z, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, CZERO, tmp1, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
      call zgemm('C','N',nev,nev,na,CONE,z,na,z,na,CZERO,tmp1,na)
#else
      call cgemm('C','N',nev,nev,na,CONE,z,na,z,na,CZERO,tmp1,na)
#endif

#endif /* WITH_MPI */

      ! Initialize tmp2 to unit matrix
      tmp2 = 0

#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call pzlaset('A', nev, nev, CZERO, CONE, tmp2, 1, 1, sc_desc)
#else
      call pclaset('A', nev, nev, CZERO, CONE, tmp2, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
      call zlaset('A',nev,nev,CZERO,CONE,tmp2,na)
#else
      call claset('A',nev,nev,CZERO,CONE,tmp2,na)
#endif

#endif /* WITH_MPI */

      !      ! tmp1 = Z**T * Z - Unit Matrix
      tmp1(:,:) =  tmp1(:,:) - tmp2(:,:)

      ! Get maximum error (max abs value in tmp1)
      err = maxval(abs(tmp1))
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call mpi_allreduce(err, errmax, 1, MPI_REAL8, MPI_MAX, MPI_COMM_WORLD, mpierr)
#else
      call mpi_allreduce(err, errmax, 1, MPI_REAL4, MPI_MAX, MPI_COMM_WORLD, mpierr)
#endif

#else /* WITH_MPI */
      errmax = err
#endif /* WITH_MPI */

      if (myid==0) print *,'Error Orthogonality:',errmax
#ifdef DOUBLE_PRECISION_COMPLEX
      if (errmax .gt. 5e-12_rk8) then
#else
      if (errmax .gt. 9e-4_rk4) then
#endif
        status = 1
      endif
    end function

#ifdef DOUBLE_PRECISION_COMPLEX
    !c> int check_correctness_complex_from_fortran_double_precision(int na, int nev, int na_rows, int na_cols,
    !c>                                         complex double *as, complex double *z, double *ev,
    !c>                                         int sc_desc[9], int myid,
    !c>                                         complex double *tmp1, complex double *tmp2);
#else
    !c> int check_correctness_complex_from_fortran_single_precision(int na, int nev, int na_rows, int na_cols,
    !c>                                         complex *as, complex *z, float *ev,
    !c>                                         int sc_desc[9], int myid,
    !c>                                         complex *tmp1, complex *tmp2);
#endif
    function check_correctness_complex_wrapper_double(na, nev, na_rows, na_cols, as, z, ev, sc_desc, myid, &
                                                      tmp1, tmp2) result(status) &
#ifdef DOUBLE_PRECISION_COMPLEX
      bind(C,name="check_correctness_complex_from_fortran_double_precision")
#else
      bind(C,name="check_correctness_complex_from_fortran_single_precision")
#endif
      use iso_c_binding

      implicit none

      integer(kind=c_int)         :: status
      integer(kind=c_int), value  :: na, nev, myid, na_rows, na_cols
#ifdef DOUBLE_PRECISION_COMPLEX
      complex(kind=c_double)      :: as(1:na_rows,1:na_cols), z(1:na_rows,1:na_cols)
      complex(kind=c_double)      :: tmp1(1:na_rows,1:na_cols), tmp2(1:na_rows,1:na_cols)
      real(kind=c_double)         :: ev(1:na)
#else
      complex(kind=c_float)       :: as(1:na_rows,1:na_cols), z(1:na_rows,1:na_cols)
      complex(kind=c_float)       :: tmp1(1:na_rows,1:na_cols), tmp2(1:na_rows,1:na_cols)
      real(kind=c_float)          :: ev(1:na)
#endif
      integer(kind=c_int)         :: sc_desc(1:9)

      status = check_correctness_complex_double(na, nev, as, z, ev, sc_desc, myid, tmp1, tmp2)

    end function


#ifdef WANT_SINGLE_PRECISION_COMPLEX

#undef DOUBLE_PRECISION_COMPLEX
    function check_correctness_complex_single(na, nev, as, z, ev, sc_desc, myid, tmp1, tmp2) result(status)

      use elpa_mpi
      use precision
      implicit none
      integer(kind=ik)                 :: status
      integer(kind=ik), intent(in)     :: na, nev, myid
      complex(kind=ck4), intent(in)     :: as(:,:), z(:,:)
      complex(kind=ck4), intent(inout)  :: tmp1(:,:), tmp2(:,:)
      real(kind=rk4)                    :: ev(:)
      complex(kind=ck4)                 :: xc
      integer(kind=ik)                 :: sc_desc(:), mpierr
      complex(kind=ck4), parameter      :: CZERO = (0.0_rk4,0.0_rk4), CONE = (1.0_rk4,0.0_rk4)
      integer(kind=ik)                 :: i
      real(kind=rk4)                    :: err, errmax
#ifndef WITH_MPI
      complex(kind=ck4)                 :: zdotc, cdotc
#endif

      status = 0

      ! 1. Residual (maximum of || A*Zi - Zi*EVi ||)
      ! tmp1 =  A * Z
      ! as is original stored matrix, Z are the EVs
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call pzgemm('N', 'N', na, nev, na, CONE, as, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, CZERO, tmp1, 1, 1, sc_desc)
#else
      call pcgemm('N', 'N', na, nev, na, CONE, as, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, CZERO, tmp1, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
      call zgemm('N','N',na,nev,na,CONE,as,na,z,na,CZERO,tmp1,na)
#else
      call cgemm('N','N',na,nev,na,CONE,as,na,z,na,CZERO,tmp1,na)
#endif

#endif /* WITH_MPI */
      ! tmp2 = Zi*EVi
      tmp2(:,:) = z(:,:)
      do i=1,nev
        xc = ev(i)
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
        call pzscal(na, xc, tmp2, 1, i, sc_desc, 1)
#else
        call pcscal(na, xc, tmp2, 1, i, sc_desc, 1)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
        call zscal(na,xc,tmp2(1,i),1)
#else
        call cscal(na,xc,tmp2(1,i),1)
#endif

#endif /* WITH_MPI */
      enddo

      !  tmp1 = A*Zi - Zi*EVi
      tmp1(:,:) =  tmp1(:,:) - tmp2(:,:)

      ! Get maximum norm of columns of tmp1
#ifdef DOUBLE_PRECISION_COMPLEX
      errmax = 0.0_rk8
#else
      errmax = 0.0_rk4
#endif
      do i=1,nev
        xc = 0
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
        call pzdotc(na, xc, tmp1, 1, i, sc_desc, 1, tmp1, 1, i, sc_desc, 1)
#else
        call pcdotc(na, xc, tmp1, 1, i, sc_desc, 1, tmp1, 1, i, sc_desc, 1)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
        xc = zdotc(na,tmp1,1,tmp1,1)
#else
        xc = cdotc(na,tmp1,1,tmp1,1)
#endif

#endif /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
        errmax = max(errmax, sqrt(real(xc,kind=rk8)))
#else
        errmax = max(errmax, sqrt(real(xc,kind=rk4)))
#endif
      enddo

      ! Get maximum error norm over all processors
      err = errmax
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call mpi_allreduce(err, errmax, 1, MPI_REAL8, MPI_MAX, MPI_COMM_WORLD, mpierr)
#else
      call mpi_allreduce(err, errmax, 1, MPI_REAL4, MPI_MAX, MPI_COMM_WORLD, mpierr)
#endif

#else /* WITH_MPI */
      errmax = err
#endif /* WITH_MPI */

      if (myid==0) print *
      if (myid==0) print *,'Error Residual     :',errmax
#ifdef DOUBLE_PRECISION_COMPLEX
      if (errmax .gt. 5e-12_rk8) then
#else
!      if (errmax .gt. 8e-4_rk4) then
      if (errmax .gt. 8e-2_rk4) then
#endif
        status = 1
      endif

      ! 2. Eigenvector orthogonality

      ! tmp1 = Z**T * Z
      tmp1 = 0
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call pzgemm('C', 'N', nev, nev, na, CONE, z, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, CZERO, tmp1, 1, 1, sc_desc)
#else
      call pcgemm('C', 'N', nev, nev, na, CONE, z, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, CZERO, tmp1, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
      call zgemm('C','N',nev,nev,na,CONE,z,na,z,na,CZERO,tmp1,na)
#else
      call cgemm('C','N',nev,nev,na,CONE,z,na,z,na,CZERO,tmp1,na)
#endif

#endif /* WITH_MPI */

      ! Initialize tmp2 to unit matrix
      tmp2 = 0

#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call pzlaset('A', nev, nev, CZERO, CONE, tmp2, 1, 1, sc_desc)
#else
      call pclaset('A', nev, nev, CZERO, CONE, tmp2, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_COMPLEX
      call zlaset('A',nev,nev,CZERO,CONE,tmp2,na)
#else
      call claset('A',nev,nev,CZERO,CONE,tmp2,na)
#endif

#endif /* WITH_MPI */

      !      ! tmp1 = Z**T * Z - Unit Matrix
      tmp1(:,:) =  tmp1(:,:) - tmp2(:,:)

      ! Get maximum error (max abs value in tmp1)
      err = maxval(abs(tmp1))
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_COMPLEX
      call mpi_allreduce(err, errmax, 1, MPI_REAL8, MPI_MAX, MPI_COMM_WORLD, mpierr)
#else
      call mpi_allreduce(err, errmax, 1, MPI_REAL4, MPI_MAX, MPI_COMM_WORLD, mpierr)
#endif

#else /* WITH_MPI */
      errmax = err
#endif /* WITH_MPI */

      if (myid==0) print *,'Error Orthogonality:',errmax
#ifdef DOUBLE_PRECISION_COMPLEX
      if (errmax .gt. 5e-12_rk8) then
#else
!      if (errmax .gt. 6e-5_rk4) then
      if (errmax .gt. 8e-2_rk4) then
#endif
        status = 1
      endif
    end function



#ifdef DOUBLE_PRECISION_COMPLEX
    !c> int check_correctness_complex_from_fortran_double_precision(int na, int nev, int na_rows, int na_cols,
    !c>                                         complex double *as, complex double *z, double *ev,
    !c>                                         int sc_desc[9], int myid,
    !c>                                         complex double *tmp1, complex double *tmp2);
#else
    !c> int check_correctness_complex_from_fortran_single_precision(int na, int nev, int na_rows, int na_cols,
    !c>                                         complex *as, complex *z, float *ev,
    !c>                                         int sc_desc[9], int myid,
    !c>                                         complex *tmp1, complex *tmp2);
#endif
    function check_correctness_complex_wrapper_single(na, nev, na_rows, na_cols, as, z, ev, sc_desc, &
                                                      myid, tmp1, tmp2) result(status) &
#ifdef DOUBLE_PRECISION_COMPLEX
      bind(C,name="check_correctness_complex_from_fortran_double_precision")
#else
      bind(C,name="check_correctness_complex_from_fortran_single_precision")
#endif
      use iso_c_binding

      implicit none

      integer(kind=c_int)         :: status
      integer(kind=c_int), value  :: na, nev, myid, na_rows, na_cols
#ifdef DOUBLE_PRECISION_COMPLEX
      complex(kind=c_double)      :: as(1:na_rows,1:na_cols), z(1:na_rows,1:na_cols)
      complex(kind=c_double)      :: tmp1(1:na_rows,1:na_cols), tmp2(1:na_rows,1:na_cols)
      real(kind=c_double)         :: ev(1:na)
#else
      complex(kind=c_float)       :: as(1:na_rows,1:na_cols), z(1:na_rows,1:na_cols)
      complex(kind=c_float)       :: tmp1(1:na_rows,1:na_cols), tmp2(1:na_rows,1:na_cols)
      real(kind=c_float)          :: ev(1:na)
#endif
      integer(kind=c_int)         :: sc_desc(1:9)

      status = check_correctness_complex_single(na, nev, as, z, ev, sc_desc, myid, tmp1, tmp2)

    end function

#endif /* WANT_SINGLE_PRECISION_COMPLEX */

#define DOUBLE_PRECISION_REAL 1
    function check_correctness_real_double(na, nev, as, z, ev, sc_desc, myid, tmp1, tmp2) result(status)

      use elpa_mpi
      use precision
      implicit none
      integer(kind=ik)               :: status
      integer(kind=ik), intent(in)   :: na, nev, myid
      real(kind=rk8), intent(in)      :: as(:,:), z(:,:)
      real(kind=rk8), intent(inout)   :: tmp1(:,:), tmp2(:,:)
      real(kind=rk8)                  :: ev(:)
      integer(kind=ik)               :: sc_desc(:), mpierr

      integer(kind=ik)               :: i
      real(kind=rk8)                  :: err, errmax
#ifndef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      real(kind=rk8)                  :: dnrm2
#else
      real(kind=rk8)                  :: snrm2
#endif

#endif

      status = 0

      ! 1. Residual (maximum of || A*Zi - Zi*EVi ||)
      ! tmp1 =  A * Z
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call pdgemm('N', 'N', na, nev, na, 1.0_rk8, as, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, 0.0_rk8, tmp1, 1, 1, sc_desc)
#else
      call psgemm('N', 'N', na, nev, na, 1.0_rk4, as, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, 0.0_rk4, tmp1, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_REAL
     call dgemm('N','N',na,nev,na,1.0_rk8,as,na,z,na,0.0_rk8,tmp1,na)
#else
     call zgemm('N','N',na,nev,na,1.0_rk4,as,na,z,na,0.0_rk4,tmp1,na)
#endif

#endif /* WITH_MPI */
      ! tmp2 = Zi*EVi
      tmp2(:,:) = z(:,:)
      do i=1,nev
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
        call pdscal(na, ev(i), tmp2, 1, i, sc_desc, 1)
#else
        call psscal(na, ev(i), tmp2, 1, i, sc_desc, 1)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_REAL
        call dscal(na,ev(i),tmp2(:,i),1)
#else
        call sscal(na,ev(i),tmp2(:,i),1)
#endif

#endif /* WITH_MPI */
      enddo

      !  tmp1 = A*Zi - Zi*EVi
      tmp1(:,:) =  tmp1(:,:) - tmp2(:,:)

      ! Get maximum norm of columns of tmp1
#ifdef DOUBLE_PRECISION_REAL
      errmax = 0.0_rk8
#else
      errmax = 0.0_rk4
#endif
      do i=1,nev
#ifdef DOUBLE_PRECISION_REAL
        err = 0.0_rk8
#else
        err = 0.0_rk4
#endif

#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
        call pdnrm2(na, err, tmp1, 1, i, sc_desc, 1)
#else
        call psnrm2(na, err, tmp1, 1, i, sc_desc, 1)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_REAL
!        call dnrm2(na,err,tmp1,1,i,sc_desc,1)
        err = dnrm2(na,tmp1(1,i),1)
#else
        err = snrm2(na,tmp1(1,i),1)
#endif

#endif /* WITH_MPI */
        errmax = max(errmax, err)
      enddo

      ! Get maximum error norm over all processors
      err = errmax
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call mpi_allreduce(err, errmax, 1, MPI_REAL8, MPI_MAX, MPI_COMM_WORLD, mpierr)
#else
      call mpi_allreduce(err, errmax, 1, MPI_REAL4, MPI_MAX, MPI_COMM_WORLD, mpierr)
#endif

#else /* WITH_MPI */
      errmax = err
#endif /* WITH_MPI */

      if (myid==0) print *
      if (myid==0) print *,'Error Residual     :',errmax
#ifdef DOUBLE_PRECISION_REAL
      if (errmax .gt. 9e-12_rk8) then
#else
      if (errmax .gt. 3e-3_rk4) then
#endif
        status = 1
      endif

      ! 2. Eigenvector orthogonality

      ! tmp1 = Z**T * Z
#ifdef DOUBLE_PRECISION_REAL
      tmp1 = 0._rk8
#else
      tmp1 = 0._rk4
#endif

#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call pdgemm('T', 'N', nev, nev, na, 1.0_rk8, z, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, 0.0_rk8, tmp1, 1, 1, sc_desc)
#else
      call psgemm('T', 'N', nev, nev, na, 1.0_rk4, z, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, 0.0_rk4, tmp1, 1, 1, sc_desc)
#endif

#else  /* WITH_MPI */

#ifdef DOUBLE_PRECISION_REAL
      call dgemm('T','N',nev,nev,na,1.0_rk8,z,na, &
                  z,na,0.0_rk8,tmp1,na)
#else
      call sgemm('T','N',nev,nev,na,1.0_rk4,z,na, &
                  z,na,0.0_rk4,tmp1,na)
#endif

#endif /* WITH_MPI */

      ! Initialize tmp2 to unit matrix
#ifdef DOUBLE_PRECISION_REAL
      tmp2 = 0._rk8
#else
      tmp2 = 0._rk4
#endif

#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call pdlaset('A', nev, nev, 0.0_rk8, 1.0_rk8, tmp2, 1, 1, sc_desc)
#else
      call pslaset('A', nev, nev, 0.0_rk4, 1.0_rk4, tmp2, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_REAL
      call dlaset('A',nev,nev,0.0_rk8,1.0_rk8,tmp2,na)
#else
      call slaset('A',nev,nev,0.0_rk4,1.0_rk4,tmp2,na)
#endif

#endif /* WITH_MPI */
      ! tmp1 = Z**T * Z - Unit Matrix
      tmp1(:,:) =  tmp1(:,:) - tmp2(:,:)

      ! Get maximum error (max abs value in tmp1)
      err = maxval(abs(tmp1))
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call mpi_allreduce(err, errmax, 1, MPI_REAL8, MPI_MAX, MPI_COMM_WORLD, mpierr)
#else
      call mpi_allreduce(err, errmax, 1, MPI_REAL4, MPI_MAX, MPI_COMM_WORLD, mpierr)
#endif

#else  /* WITH_MPI */
      errmax = err
#endif /* WITH_MPI */
      if (myid==0) print *,'Error Orthogonality:',errmax
#ifdef DOUBLE_PRECISION_REAL
      if (errmax .gt. 9e-12_rk8) then
#else
      if (errmax .gt. 9e-4_rk4) then
#endif
        status = 1
      endif
    end function

#ifdef DOUBLE_PRECISION_REAL
    !c> int check_correctness_real_from_fortran_double_precision(int na, int nev, int na_rows, int na_cols,
    !c>                                         double *as, double *z, double *ev,
    !c>                                         int sc_desc[9], int myid,
    !c>                                         double *tmp1, double *tmp2);
#else
    !c> int check_correctness_real_from_fortran_single_precision(int na, int nev, int na_rows, int na_cols,
    !c>                                         float *as, float *z, float *ev,
    !c>                                         int sc_desc[9], int myid,
    !c>                                         float *tmp1, float *tmp2);
#endif
    function check_correctness_real_wrapper_double(na, nev, na_rows, na_cols, as, z, ev, sc_desc, &
                                                   myid, tmp1, tmp2) result(status) &
#ifdef DOUBLE_PRECISION_REAL
      bind(C,name="check_correctness_real_from_fortran_double_precision")
#else
      bind(C,name="check_correctness_real_from_fortran_single_precision")
#endif
      use iso_c_binding

      implicit none

      integer(kind=c_int)         :: status
      integer(kind=c_int), value  :: na, nev, myid, na_rows, na_cols
#ifdef DOUBLE_PRECISION_REAL
      real(kind=c_double)         :: as(1:na_rows,1:na_cols), z(1:na_rows,1:na_cols)
      real(kind=c_double)         :: tmp1(1:na_rows,1:na_cols), tmp2(1:na_rows,1:na_cols)
      real(kind=c_double)         :: ev(1:na)
#else
      real(kind=c_float)          :: as(1:na_rows,1:na_cols), z(1:na_rows,1:na_cols)
      real(kind=c_float)          :: tmp1(1:na_rows,1:na_cols), tmp2(1:na_rows,1:na_cols)
      real(kind=c_float)          :: ev(1:na)
#endif
      integer(kind=c_int)         :: sc_desc(1:9)

      status = check_correctness_real_double(na, nev, as, z, ev, sc_desc, myid, tmp1, tmp2)

    end function

#ifdef WANT_SINGLE_PRECISION_REAL

#undef DOUBLE_PRECISION_REAL
    function check_correctness_real_single(na, nev, as, z, ev, sc_desc, myid, tmp1, tmp2) result(status)

      use elpa_mpi
      use precision
      implicit none
      integer(kind=ik)               :: status
      integer(kind=ik), intent(in)   :: na, nev, myid
      real(kind=rk4), intent(in)      :: as(:,:), z(:,:)
      real(kind=rk4), intent(inout)   :: tmp1(:,:), tmp2(:,:)
      real(kind=rk4)                  :: ev(:)
      integer(kind=ik)               :: sc_desc(:), mpierr

      integer(kind=ik)               :: i
      real(kind=rk4)                  :: err, errmax
#ifndef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      real(kind=rk8)                  :: dnrm2
#else
      real(kind=rk4)                  :: snrm2
#endif

#endif

      status = 0
      ! 1. Residual (maximum of || A*Zi - Zi*EVi ||)
      ! tmp1 =  A * Z
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call pdgemm('N', 'N', na, nev, na, 1.0_rk8, as, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, 0.0_rk8, tmp1, 1, 1, sc_desc)
#else
      call psgemm('N', 'N', na, nev, na, 1.0_rk4, as, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, 0.0_rk4, tmp1, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */
#ifdef DOUBLE_PRECISION_REAL
     call dgemm('N','N',na,nev,na,1.0_rk8,as,na,z,na,0.0_rk8,tmp1,na)
#else
     call sgemm('N','N',na,nev,na,1.0_rk4,as,na,z,na,0.0_rk4,tmp1,na)
#endif

#endif /* WITH_MPI */
      ! tmp2 = Zi*EVi
      tmp2(:,:) = z(:,:)
      do i=1,nev
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
        call pdscal(na, ev(i), tmp2, 1, i, sc_desc, 1)
#else
        call psscal(na, ev(i), tmp2, 1, i, sc_desc, 1)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_REAL
        call dscal(na,ev(i),tmp2(:,i),1)
#else
        call sscal(na,ev(i),tmp2(:,i),1)
#endif

#endif /* WITH_MPI */
      enddo

      !  tmp1 = A*Zi - Zi*EVi
      tmp1(:,:) =  tmp1(:,:) - tmp2(:,:)

      ! Get maximum norm of columns of tmp1
#ifdef DOUBLE_PRECISION_REAL
      errmax = 0.0_rk8
#else
      errmax = 0.0_rk4
#endif
      do i=1,nev
#ifdef DOUBLE_PRECISION_REAL
        err = 0.0_rk8
#else
        err = 0.0_rk4
#endif

#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
        call pdnrm2(na, err, tmp1, 1, i, sc_desc, 1)
#else
        call psnrm2(na, err, tmp1, 1, i, sc_desc, 1)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_REAL
!        call dnrm2(na,err,tmp1,1,i,sc_desc,1)
        err = dnrm2(na,tmp1(1,i),1)
#else
        err = snrm2(na,tmp1(1,i),1)
#endif

#endif /* WITH_MPI */
        errmax = max(errmax, err)
      enddo

      ! Get maximum error norm over all processors
      err = errmax
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call mpi_allreduce(err, errmax, 1, MPI_REAL8, MPI_MAX, MPI_COMM_WORLD, mpierr)
#else
      call mpi_allreduce(err, errmax, 1, MPI_REAL4, MPI_MAX, MPI_COMM_WORLD, mpierr)
#endif

#else /* WITH_MPI */
      errmax = err
#endif /* WITH_MPI */

      if (myid==0) print *
      if (myid==0) print *,'Error Residual     :',errmax
#ifdef DOUBLE_PRECISION_REAL
      if (errmax .gt. 9e-12_rk8) then
#else
!      if (errmax .gt. 8e-4_rk4) then
      if (errmax .gt. 8e-2_rk4) then
#endif
        status = 1
      endif

      ! 2. Eigenvector orthogonality

      ! tmp1 = Z**T * Z
#ifdef DOUBLE_PRECISION_REAL
      tmp1 = 0._rk8
#else
      tmp1 = 0._rk4
#endif

#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call pdgemm('T', 'N', nev, nev, na, 1.0_rk8, z, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, 0.0_rk8, tmp1, 1, 1, sc_desc)
#else
      call psgemm('T', 'N', nev, nev, na, 1.0_rk4, z, 1, 1, sc_desc, &
                  z, 1, 1, sc_desc, 0.0_rk4, tmp1, 1, 1, sc_desc)
#endif

#else  /* WITH_MPI */

#ifdef DOUBLE_PRECISION_REAL
      call dgemm('T','N',nev,nev,na,1.0_rk8,z,na, &
                  z,na,0.0_rk8,tmp1,na)
#else
      call sgemm('T','N',nev,nev,na,1.0_rk4,z,na, &
                  z,na,0.0_rk4,tmp1,na)
#endif

#endif /* WITH_MPI */

      ! Initialize tmp2 to unit matrix
#ifdef DOUBLE_PRECISION_REAL
      tmp2 = 0._rk8
#else
      tmp2 = 0._rk4
#endif

#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call pdlaset('A', nev, nev, 0.0_rk8, 1.0_rk8, tmp2, 1, 1, sc_desc)
#else
      call pslaset('A', nev, nev, 0.0_rk4, 1.0_rk4, tmp2, 1, 1, sc_desc)
#endif

#else /* WITH_MPI */

#ifdef DOUBLE_PRECISION_REAL
      call dlaset('A',nev,nev,0.0_rk8,1.0_rk8,tmp2,na)
#else
      call slaset('A',nev,nev,0.0_rk4,1.0_rk4,tmp2,na)
#endif

#endif /* WITH_MPI */
      ! tmp1 = Z**T * Z - Unit Matrix
      tmp1(:,:) =  tmp1(:,:) - tmp2(:,:)

      ! Get maximum error (max abs value in tmp1)
      err = maxval(abs(tmp1))
#ifdef WITH_MPI

#ifdef DOUBLE_PRECISION_REAL
      call mpi_allreduce(err, errmax, 1, MPI_REAL8, MPI_MAX, MPI_COMM_WORLD, mpierr)
#else
      call mpi_allreduce(err, errmax, 1, MPI_REAL4, MPI_MAX, MPI_COMM_WORLD, mpierr)
#endif

#else  /* WITH_MPI */
      errmax = err
#endif /* WITH_MPI */
      if (myid==0) print *,'Error Orthogonality:',errmax

#ifdef DOUBLE_PRECISION_REAL
      if (errmax .gt. 9e-12_rk8) then
#else
!     if (errmax .gt. 6e-5_rk4) then
    if (errmax .gt. 8e-2_rk4) then
#endif
        status = 1
      endif

    end function

#ifdef DOUBLE_PRECISION_REAL
    !c> int check_correctness_real_from_fortran_double_precision(int na, int nev, int na_rows, int na_cols,
    !c>                                         double *as, double *z, double *ev,
    !c>                                         int sc_desc[9], int myid,
    !c>                                         double *tmp1, double *tmp2);
#else
    !c> int check_correctness_real_from_fortran_single_precision(int na, int nev, int na_rows, int na_cols,
    !c>                                         float *as, float *z, float *ev,
    !c>                                         int sc_desc[9], int myid,
    !c>                                         float *tmp1, float *tmp2);
#endif
    function check_correctness_real_wrapper_single(na, nev, na_rows, na_cols, as, z, ev, sc_desc, &
                                                   myid, tmp1, tmp2) result(status) &
#ifdef DOUBLE_PRECISION_REAL
      bind(C,name="check_correctness_real_from_fortran_double_precision")
#else
      bind(C,name="check_correctness_real_from_fortran_single_precision")
#endif
      use iso_c_binding

      implicit none

      integer(kind=c_int)         :: status
      integer(kind=c_int), value  :: na, nev, myid, na_rows, na_cols
#ifdef DOUBLE_PRECISION_REAL
      real(kind=c_double)         :: as(1:na_rows,1:na_cols), z(1:na_rows,1:na_cols)
      real(kind=c_double)         :: tmp1(1:na_rows,1:na_cols), tmp2(1:na_rows,1:na_cols)
      real(kind=c_double)         :: ev(1:na)
#else
      real(kind=c_float)          :: as(1:na_rows,1:na_cols), z(1:na_rows,1:na_cols)
      real(kind=c_float)          :: tmp1(1:na_rows,1:na_cols), tmp2(1:na_rows,1:na_cols)
      real(kind=c_float)          :: ev(1:na)
#endif
      integer(kind=c_int)         :: sc_desc(1:9)

      status = check_correctness_real_single(na, nev, as, z, ev, sc_desc, myid, tmp1, tmp2)

    end function

#endif /* WANT_SINGLE_PRECISION_REAL */


end module mod_check_correctness
