 void prepare_matrix_complex_from_fortran_double_precision(int na, int myid, int na_rows, int na_cols,
                                       int sc_desc[9], int iseed[4096], double *xr,
                                       complex double *a, complex double *z, complex double *as);
 void prepare_matrix_complex_from_fortran_single_precision(int na, int myid, int na_rows, int na_cols,
                                       int sc_desc[9], int iseed[4096], float *xr,
                                       complex *a, complex *z, complex *as);
 void prepare_matrix_complex_from_fortran_double_precision(int na, int myid, int na_rows, int na_cols,
                                       int sc_desc[9], int iseed[4096], double *xr,
                                       complex double *a, complex double *z, complex double *as);
 void prepare_matrix_complex_from_fortran_single_precision(int na, int myid, int na_rows, int na_cols,
                                       int sc_desc[9], int iseed[4096], float *xr,
                                       complex *a, complex *z, complex *as);
 void prepare_matrix_real_from_fortran_double_precision(int na, int myid, int na_rows, int na_cols,
                                       int sc_desc[9], int iseed[4096],
                                       double *a, double *z, double *as);
 void prepare_matrix_real_from_fortran_single_precision(int na, int myid, int na_rows, int na_cols,
                                       int sc_desc[9], int iseed[4096],
                                       float *a, float *z, float *as);
 void prepare_matrix_real_from_fortran_double_precision(int na, int myid, int na_rows, int na_cols,
                                       int sc_desc[9], int iseed[4096],
                                       double *a, double *z, double *as);
 void prepare_matrix_real_from_fortran_single_precision(int na, int myid, int na_rows, int na_cols,
                                       int sc_desc[9], int iseed[4096],
                                       float *a, float *z, float *as);
 void set_up_blacsgrid_from_fortran(int mpi_comm_world, int* my_blacs_ctxt,
                                    int *np_rows, int *np_cols, int *nprow, int *npcol,
                                    int *my_prow, int *my_pcol);
 void set_up_blacs_descriptor_from_fortran(int na, int nblk, int my_prow, int my_pcol,
                                           int np_rows, int np_cols,
                                           int *na_rows, int *na_cols,
                                           int sc_desc[9],
                                           int my_blacs_ctxt,
                                           int *info);
 int check_correctness_complex_from_fortran_double_precision(int na, int nev, int na_rows, int na_cols,
                                         complex double *as, complex double *z, double *ev,
                                         int sc_desc[9], int myid,
                                         complex double *tmp1, complex double *tmp2);
 int check_correctness_complex_from_fortran_single_precision(int na, int nev, int na_rows, int na_cols,
                                         complex *as, complex *z, float *ev,
                                         int sc_desc[9], int myid,
                                         complex *tmp1, complex *tmp2);
 int check_correctness_complex_from_fortran_double_precision(int na, int nev, int na_rows, int na_cols,
                                         complex double *as, complex double *z, double *ev,
                                         int sc_desc[9], int myid,
                                         complex double *tmp1, complex double *tmp2);
 int check_correctness_complex_from_fortran_single_precision(int na, int nev, int na_rows, int na_cols,
                                         complex *as, complex *z, float *ev,
                                         int sc_desc[9], int myid,
                                         complex *tmp1, complex *tmp2);
 int check_correctness_real_from_fortran_double_precision(int na, int nev, int na_rows, int na_cols,
                                         double *as, double *z, double *ev,
                                         int sc_desc[9], int myid,
                                         double *tmp1, double *tmp2);
 int check_correctness_real_from_fortran_single_precision(int na, int nev, int na_rows, int na_cols,
                                         float *as, float *z, float *ev,
                                         int sc_desc[9], int myid,
                                         float *tmp1, float *tmp2);
 int check_correctness_real_from_fortran_double_precision(int na, int nev, int na_rows, int na_cols,
                                         double *as, double *z, double *ev,
                                         int sc_desc[9], int myid,
                                         double *tmp1, double *tmp2);
 int check_correctness_real_from_fortran_single_precision(int na, int nev, int na_rows, int na_cols,
                                         float *as, float *z, float *ev,
                                         int sc_desc[9], int myid,
                                         float *tmp1, float *tmp2);
