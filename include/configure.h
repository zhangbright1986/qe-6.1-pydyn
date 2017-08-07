!
! Copyright (C) 2006 WanT Group
!
! This file is distributed under the terms of the
! GNU General Public License. See the file `License'
! in the root directory of the present distribution,
! or http://www.gnu.org/copyleft/gpl.txt .
!

!
! contains configure infos
!

#define  __HAVE_CONFIG_INFO

#define   __CONF_HOST           "@host@"
#define   __CONF_ARCH           "x86_64"

#define   __CONF_CC             "icc"
#define   __CONF_CFLAGS         "-O3"
#define   __CONF_DFLAGS         "-D__OPENMP -D__INTEL -D__DFTI -D__MPI -D__PARA -D__SCALAPACK -D__ELPA_2016 -D__USE_MANY_FFT -D__NON_BLOCKING_SCATTER -D__EXX_ACE"
#define   __CONF_CPP            "cpp"
#define   __CONF_CPPFLAGS       "-P -traditional"

#define   __CONF_F90            "ifort"
#define   __CONF_MPIF90         "mpif90"
#define   __CONF_F90FLAGS       "$(FFLAGS) -nomodule"
#define   __CONF_F77            "ifort"
#define   __CONF_FFLAGS         "-O3 -xMIC-AVX512 -fp-model precise -assume byterecl -qopenmp"
#define   __CONF_FFLAGS_NOOPT   "-O0 -assume byterecl -g -traceback"
#define   __CONF_PRE_FDFLAGS    "-fpp "
#define   __CONF_FDFLAGS        "$(DFLAGS) $(MANUAL_DFLAGS)"

#define   __CONF_LD             "mpif90"
#define   __CONF_LDFLAGS        "-Wl,--as-needed -liomp5 -Wl,--no-as-needed"
#define   __CONF_IMOD           "-I"

#define   __CONF_BLAS_LIBS      " -L/opt/intel/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl"
#define   __CONF_LAPACK_LIBS    " -L/opt/intel/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl"
#define   __CONF_FFT_LIBS       "  -L/opt/intel/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl"
#define   __CONF_MASS_LIBS      ""

#define   __CONF_AR             "ar"
#define   __CONF_ARFLAGS        "ruv"
#define   __CONF_RANLIB         "ranlib"


