#=======================================
# WANNIER90 	
#=======================================

TOPDIR = /admin/build/rpms/BUILD/qe-6.1-TACC

F90=mpif90
FCOPTS=$(FFLAGS) -nomodule 
LDOPTS=-Wl,--as-needed -liomp5 -Wl,--no-as-needed

LIBS =  -L/opt/intel/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl  -L/opt/intel/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl 
