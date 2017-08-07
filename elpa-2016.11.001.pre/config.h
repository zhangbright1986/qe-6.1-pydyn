/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */

/* AVX is supported on this CPU */
#define HAVE_AVX 1

/* AVX2 is supported on this CPU */
#define HAVE_AVX2 1

/* Enable more timing */
/* #undef HAVE_DETAILED_TIMINGS */

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Fortran can query environment variables */
#define HAVE_ENVIRONMENT_CHECKING 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* can use module iso_fortran_env */
#define HAVE_ISO_FORTRAN_ENV 1

/* Use the PAPI library */
/* #undef HAVE_LIBPAPI */

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* can use the Fortran mpi module */
#define HAVE_MPI_MODULE 1

/* Redirect stdout and stderr of test programs per MPI tasks to a file */
/* #undef HAVE_REDIRECT */

/* assembly SSE is supported on this CPU */
#define HAVE_SSE_ASSEMBLY 1

/* gcc intrinsics SSE is supported on this CPU */
#define HAVE_SSE_INTRINSICS 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to the sub-directory where libtool stores uninstalled libraries. */
#define LT_OBJDIR ".libs/"

/* Name of package */
#define PACKAGE "elpa"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "elpa-library@mpcdf.mpg.de"

/* Define to the full name of this package. */
#define PACKAGE_NAME "elpa"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "elpa 2016.11.001.pre"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "elpa"

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION "2016.11.001.pre"

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* for performance reasons use assumed size Fortran arrays, even if not
   debuggable */
#define USE_ASSUMED_SIZE 1

/* Version number of package */
#define VERSION "2016.11.001.pre"

/* build also single-precision for complex calculation */
/* #undef WANT_SINGLE_PRECISION_COMPLEX */

/* build also single-precision for real calculation */
/* #undef WANT_SINGLE_PRECISION_REAL */

/* can use complex_avx2_block1 kernel */
#define WITH_COMPLEX_AVX2_BLOCK1_KERNEL 1

/* can use complex_avx2_block2 kernel */
#define WITH_COMPLEX_AVX2_BLOCK2_KERNEL 1

/* can use complex_avx_block1 kernel */
#define WITH_COMPLEX_AVX_BLOCK1_KERNEL 1

/* can use complex_avx_block2 kernel */
#define WITH_COMPLEX_AVX_BLOCK2_KERNEL 1

/* can use complex generic kernel */
#define WITH_COMPLEX_GENERIC_KERNEL 1

/* can use complex generic-simple kernel */
#define WITH_COMPLEX_GENERIC_SIMPLE_KERNEL 1

/* can use complex SSE assembly kernel */
#define WITH_COMPLEX_SSE_ASSEMBLY_KERNEL 1

/* can use complex_sse_block1 kernel */
#define WITH_COMPLEX_SSE_BLOCK1_KERNEL 1

/* can use complex_sse_block2 kernel */
#define WITH_COMPLEX_SSE_BLOCK2_KERNEL 1

/* enable GPU support */
/* #undef WITH_GPU_VERSION */

/* use MPI */
#define WITH_MPI 1

/* do not use only one specific complex kernel (set at compile time) */
#define WITH_NO_SPECIFIC_COMPLEX_KERNEL 1

/* do not use only one specific real kernel (set at compile time) */
#define WITH_NO_SPECIFIC_REAL_KERNEL 1

/* use only one specific complex kernel (set at compile time) */
/* #undef WITH_ONE_SPECIFIC_COMPLEX_KERNEL */

/* use only one specific real kernel (set at compile time) */
/* #undef WITH_ONE_SPECIFIC_REAL_KERNEL */

/* use OpenMP threading */
#define WITH_OPENMP 1

/* can use real_avx2_block2 kernel */
#define WITH_REAL_AVX2_BLOCK2_KERNEL 1

/* can use real_avx2_block4 kernel */
#define WITH_REAL_AVX2_BLOCK4_KERNEL 1

/* can use real_avx2_block6 kernel */
#define WITH_REAL_AVX2_BLOCK6_KERNEL 1

/* can use real_avx_block2 kernel */
#define WITH_REAL_AVX_BLOCK2_KERNEL 1

/* can use real_avx_block4 kernel */
#define WITH_REAL_AVX_BLOCK4_KERNEL 1

/* can use real_avx_block6 kernel */
#define WITH_REAL_AVX_BLOCK6_KERNEL 1

/* can use real BGP kernel */
/* #undef WITH_REAL_BGP_KERNEL */

/* can use real BGQ kernel */
/* #undef WITH_REAL_BGQ_KERNEL */

/* can use real generic kernel */
#define WITH_REAL_GENERIC_KERNEL 1

/* can use real generic-simple kernel */
#define WITH_REAL_GENERIC_SIMPLE_KERNEL 1

/* can use real SSE assembly kernel */
#define WITH_REAL_SSE_ASSEMBLY_KERNEL 1

/* can use real_sse_block2 kernel */
#define WITH_REAL_SSE_BLOCK2_KERNEL 1

/* can use real_sse_block4 kernel */
#define WITH_REAL_SSE_BLOCK4_KERNEL 1

/* can use real_sse_block6 kernel */
#define WITH_REAL_SSE_BLOCK6_KERNEL 1
