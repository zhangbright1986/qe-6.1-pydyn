  Ði  Á   k820309              17.0        åY                                                                                                           
       src/elpa1_auxiliary.F90 ELPA1_AUXILIARY                      @                              
                                                              u #ELPA_CHOLESKY_REAL_DOUBLE                                                           u #ELPA_INVERT_TRM_REAL_DOUBLE                                                           u #ELPA_CHOLESKY_REAL_DOUBLE                                                           u #ELPA_INVERT_TRM_COMPLEX_DOUBLE                                                           u #ELPA_MULT_AT_B_REAL_DOUBLE                                                           u #ELPA_MULT_AH_B_COMPLEX_DOUBLE                                                           u #ELPA_SOLVE_TRIDI_DOUBLE    %         @                                                          #A 	   #B 
             
                                 	                     
                                 
           %         @                                                          #IDX    #MY_PROC    #NUM_PROCS    #NBLK    #IFLAG                                                                                                                                                                                                                                                                                  %         @                                                          #GLOBAL_ROW    #NBLK    #NP_ROWS              
                                                      
                                                      
                                            %         @                                                          #GLOBAL_COL    #NBLK    #NP_COLS              
                                                      
                                                      
                                                                                                                                              0%         @     X                                                      #MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIFCMB5    #MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIFCMB9    #MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV1    #MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV2 "   #MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIVC %   #UPLO_A (   #UPLO_C )   #NA *   #NCB +   #A ,   #LDA -   #LDACOLS .   #B /   #LDB 0   #LDBCOLS 1   #NBLK 2   #MPI_COMM_ROWS 3   #MPI_COMM_COLS 4   #C 5   #LDC 6   #LDCCOLS 7                                                                                                                                                                                                                                                                                                                     #ELPA_MULT_AT_B_REAL_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED                                                                                                                                 #ELPA_MULT_AT_B_REAL_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY                                                                                                                                  #ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV1%MPI_BOTTOM    #ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV1%MPI_IN_PLACE     #ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE !                                                                                                                                                                 !                                p          p            p                                                                          "                          #ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE #   #ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE $                                           #                                 p          p          p            p          p                                                                          $                                p          p            p                                                                          %                          #ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL &   #ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIVC%MPI_ARGV_NULL '   -                                        &                                 p          p          p            p          p                                  -                                        '                                p          p            p                                                                             (                                                                       )                                      
@ @                              *                     D @                              +                                                     ,                    
       p        5  p        r -   p          5  p        r -     5  p        r .       5  p        r -     5  p        r .                               
                                 -                     
                                 .                    D @                              /                    
       p        5  p 	       r 0   p          5  p 	       r 0     5  p 
       r 1       5  p 	       r 0     5  p 
       r 1                               
@ @                              0                     
                                 1                     
@ @                              2                     D @                              3                      D @                              4                     D                                5                    
       p        5  p        r 6   p          5  p        r 6     5  p        r 7       5  p        r 6     5  p        r 7                               
                                 6                     
                                 7           %         @     X                                                      #MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIFCMB5 8   #MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIFCMB9 :   #MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV1 <   #MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV2 @   #MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIVC C   #UPLO_A F   #UPLO_C G   #NA H   #NCB I   #A J   #LDA K   #LDACOLS L   #B M   #LDB N   #LDBCOLS O   #NBLK P   #MPI_COMM_ROWS Q   #MPI_COMM_COLS R   #C S   #LDC T   #LDCCOLS U                                                                                                                                                                                                                                                                                                             8                          #ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED 9                                          9                                                            :                          #ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY ;                                           ;                                                            <                          #ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV1%MPI_BOTTOM =   #ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV1%MPI_IN_PLACE >   #ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE ?                                          =                                                           >                                                           ?                                p          p            p                                                                          @                          #ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE A   #ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE B                                           A                                 p          p          p            p          p                                                                          B                                p          p            p                                                                          C                          #ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL D   #ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGV_NULL E   -                                        D                                 p          p          p            p          p                                  -                                        E                                p          p            p                                                                             F                                                                       G                                      D @                              H                      D @                              I                   B                                  J                           p        5  p        r K   p          5  p        r K     1     5  p        r K     1                             
                                 K                     
                                 L                  B  D @                              M                           p        5  p 	       r N   p          5  p 	       r N     1     5  p 	       r N     1                             
@ @                              N                     
                                 O                     D @                              P                      D @                              Q                      D @                              R                   B  D                                S                            p        5  p        r T   p          5  p        r T     1     5  p        r T     1                             
                                 T                     
                                 U           %         @     X                                                      #MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIFCMB5 V   #MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIFCMB9 X   #MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV1 Z   #MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV2 ^   #MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIVC a   #NA d   #A e   #LDA f   #NBLK g   #MATRIXCOLS h   #MPI_COMM_ROWS i   #MPI_COMM_COLS j   #WANTDEBUG k                                                                                                                                                                                                                                                                                                                                             V                          #ELPA_INVERT_TRM_REAL_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED W                                          W                                                            X                          #ELPA_INVERT_TRM_REAL_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY Y                                           Y                                                            Z                          #ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV1%MPI_BOTTOM [   #ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV1%MPI_IN_PLACE \   #ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE ]                                          [                                                           \                                                           ]                                p          p            p                                                                          ^                          #ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE _   #ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE `                                           _                                 p          p          p            p          p                                                                          `                                p          p            p                                                                          a                          #ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL b   #ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIVC%MPI_ARGV_NULL c   -                                        b                                 p          p          p            p          p                                  -                                        c                                p          p            p                                            D @                              d                   B  D @                              e                    
       p        5  p        r f   p          5  p        r f     1     5  p        r f     1                             D @                              f                      D @                              g                                                      h                      D @                              i                      D @                              j                      
                                  k           %         @     X                                                      #MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIFCMB5 l   #MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIFCMB9 n   #MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV1 p   #MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV2 t   #MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIVC w   #NA z   #A {   #LDA |   #NBLK }   #MATRIXCOLS ~   #MPI_COMM_ROWS    #MPI_COMM_COLS    #WANTDEBUG                                                                                                                                                                                                                                                                                                                                                                   l                          #ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED m                                          m                                                            n                          #ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY o                                           o                                                            p                          #ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV1%MPI_BOTTOM q   #ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV1%MPI_IN_PLACE r   #ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE s                                          q                                                           r                                                           s                                p          p            p                                                                          t                          #ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE u   #ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE v                                           u                                 p          p          p            p          p                                                                          v                                p          p            p                                                                          w                          #ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL x   #ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGV_NULL y   -                                        x                                 p          p          p            p          p                                  -                                        y                                p          p            p                                            D @                              z                   B  D @                              {                           p        5  p        r |   p          5  p        r |     1     5  p        r |     1                             D @                              |                      D @                              }                                                      ~                      D @                                                    D @                                                    
                                             %         @     X                                                      #MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIFCMB5    #MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIFCMB9    #MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV1    #MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV2    #MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIVC    #NA    #A    #LDA    #NBLK    #MATRIXCOLS    #MPI_COMM_ROWS    #MPI_COMM_COLS    #WANTDEBUG                                                                                                                                                                                                                                                                                                                                                          #ELPA_CHOLESKY_REAL_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED                                                                                                                                 #ELPA_CHOLESKY_REAL_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY                                                                                                                                  #ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV1%MPI_BOTTOM    #ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV1%MPI_IN_PLACE    #ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE                                                                                                                                                                                                 p          p            p                                                                                                    #ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE    #ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE                                                                             p          p          p            p          p                                                                                                          p          p            p                                                                                                    #ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL    #ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIVC%MPI_ARGV_NULL    -                                                                         p          p          p            p          p                                  -                                                                        p          p            p                                            D @                                                 B  D @                                                  
       p        5  p        r    p          5  p        r      1     5  p        r      1                             D @                                                    D @                                                                                                          D @                                                    D @                                                    
                                             %         @                                                           #MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIFCMB5    #MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIFCMB9    #MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV1    #MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV2 ¡   #MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIVC ¤   #NA §   #A ¨   #LDA ©   #NBLK ª   #MATRIXCOLS «   #MPI_COMM_ROWS ¬   #MPI_COMM_COLS ­   #WANTDEBUG ®                                                                                                                                                                                                                                                                                                                                                                              #ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED                                                                                                                                 #ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY                                                                                                                                  #ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV1%MPI_BOTTOM    #ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV1%MPI_IN_PLACE    #ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE                                                                                                                                                                                                   p          p            p                                                                          ¡                          #ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE ¢   #ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE £                                           ¢                                 p          p          p            p          p                                                                          £                                p          p            p                                                                          ¤                          #ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL ¥   #ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGV_NULL ¦   -                                        ¥                                 p          p          p            p          p                                  -                                        ¦                                p          p            p                                            D @                              §                   B  D @                              ¨                           p        5  p        r ©   p          5  p        r ©     1     5  p        r ©     1                             D @                              ©                      D @                              ª                                                      «                      D @                              ¬                      D @                              ­                      
                                  ®           %         @     X                                                       #NA ¯   #NEV °   #D ±   #E ²   #Q ³   #LDQ ´   #NBLK µ   #MATRIXCOLS ¶   #MPI_COMM_ROWS ·   #MPI_COMM_COLS ¸   #WANTDEBUG ¹                                                                                                                @                              ¯                       @                              °                     D @                              ±                    
 '    p          5  p        r ¯       5  p        r ¯                              D @                              ²                    
 (    p          5  p        r ¯       5  p        r ¯                            B  D @                              ³                    
 )      p        5  p        r ´   p          5  p        r ´     1     5  p        r ´     1                              @                              ´                       @                              µ                       @                              ¶                       @                              ·                       @                              ¸                      
  @                               ¹                  0      fn#fn    Ð   @   J   ELPA_UTILITIES "     _       gen@CHOLESKY_REAL $   o  a       gen@INVERT_TRM_REAL %   Ð  _       gen@CHOLESKY_COMPLEX '   /  d       gen@INVERT_TRM_COMPLEX #     `       gen@MULT_AT_B_REAL &   ó  c       gen@MULT_AH_B_COMPLEX     V  ]       gen@SOLVE_TRIDI 5   ³  ^       LEAST_COMMON_MULTIPLE+ELPA_UTILITIES 7     @   a   LEAST_COMMON_MULTIPLE%A+ELPA_UTILITIES 7   Q  @   a   LEAST_COMMON_MULTIPLE%B+ELPA_UTILITIES +            LOCAL_INDEX+ELPA_UTILITIES /     @   a   LOCAL_INDEX%IDX+ELPA_UTILITIES 3   [  @   a   LOCAL_INDEX%MY_PROC+ELPA_UTILITIES 5     @   a   LOCAL_INDEX%NUM_PROCS+ELPA_UTILITIES 0   Û  @   a   LOCAL_INDEX%NBLK+ELPA_UTILITIES 1     @   a   LOCAL_INDEX%IFLAG+ELPA_UTILITIES $   [  w       PROW+ELPA_UTILITIES /   Ò  @   a   PROW%GLOBAL_ROW+ELPA_UTILITIES )     @   a   PROW%NBLK+ELPA_UTILITIES ,   R  @   a   PROW%NP_ROWS+ELPA_UTILITIES $     w       PCOL+ELPA_UTILITIES /   	  @   a   PCOL%GLOBAL_COL+ELPA_UTILITIES )   I  @   a   PCOL%NBLK+ELPA_UTILITIES ,     @   a   PCOL%NP_COLS+ELPA_UTILITIES +   É  q       ERROR_UNIT+ISO_FORTRAN_ENV +   :	        ELPA_MULT_AT_B_REAL_DOUBLE Y   =       MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIFCMB5+MPI_CONSTANTS=MPIFCMB5 Q   Å  H     ELPA_MULT_AT_B_REAL_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED+MPI_CONSTANTS Y          MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIFCMB9+MPI_CONSTANTS=MPIFCMB9 T     H     ELPA_MULT_AT_B_REAL_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY+MPI_CONSTANTS Y   à  õ     MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV1+MPI_CONSTANTS=MPIPRIV1 M   Õ  H     ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV1%MPI_BOTTOM+MPI_CONSTANTS O     H     ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV1%MPI_IN_PLACE+MPI_CONSTANTS T   e  ¤     ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE+MPI_CONSTANTS Y   	  Ê     MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV2+MPI_CONSTANTS=MPIPRIV2 V   Ó  Ä     ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE+MPI_CONSTANTS V     ¤     ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE+MPI_CONSTANTS Y   ;  ¿     MPI_CONSTANTS!ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIVC+MPI_CONSTANTS=MPIPRIVC Q   ú  Ä     ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL+MPI_CONSTANTS P   ¾  ¤     ELPA_MULT_AT_B_REAL_DOUBLE%MPIPRIVC%MPI_ARGV_NULL+MPI_CONSTANTS 2   b  P   a   ELPA_MULT_AT_B_REAL_DOUBLE%UPLO_A 2   ²  P   a   ELPA_MULT_AT_B_REAL_DOUBLE%UPLO_C .     @   a   ELPA_MULT_AT_B_REAL_DOUBLE%NA /   B  @   a   ELPA_MULT_AT_B_REAL_DOUBLE%NCB -     $  a   ELPA_MULT_AT_B_REAL_DOUBLE%A /   ¦  @   a   ELPA_MULT_AT_B_REAL_DOUBLE%LDA 3   æ  @   a   ELPA_MULT_AT_B_REAL_DOUBLE%LDACOLS -   &  $  a   ELPA_MULT_AT_B_REAL_DOUBLE%B /   J  @   a   ELPA_MULT_AT_B_REAL_DOUBLE%LDB 3     @   a   ELPA_MULT_AT_B_REAL_DOUBLE%LDBCOLS 0   Ê  @   a   ELPA_MULT_AT_B_REAL_DOUBLE%NBLK 9   
  @   a   ELPA_MULT_AT_B_REAL_DOUBLE%MPI_COMM_ROWS 9   J  @   a   ELPA_MULT_AT_B_REAL_DOUBLE%MPI_COMM_COLS -     $  a   ELPA_MULT_AT_B_REAL_DOUBLE%C /   ®  @   a   ELPA_MULT_AT_B_REAL_DOUBLE%LDC 3   î  @   a   ELPA_MULT_AT_B_REAL_DOUBLE%LDCCOLS .   .  $      ELPA_MULT_AH_B_COMPLEX_DOUBLE \   R       MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIFCMB5+MPI_CONSTANTS=MPIFCMB5 T   Ý  H     ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED+MPI_CONSTANTS \   %       MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIFCMB9+MPI_CONSTANTS=MPIFCMB9 W   ³  H     ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY+MPI_CONSTANTS \   û  þ     MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV1+MPI_CONSTANTS=MPIPRIV1 P   ù   H     ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV1%MPI_BOTTOM+MPI_CONSTANTS R   A!  H     ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV1%MPI_IN_PLACE+MPI_CONSTANTS W   !  ¤     ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE+MPI_CONSTANTS \   -"  Ð     MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV2+MPI_CONSTANTS=MPIPRIV2 Y   ý"  Ä     ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE+MPI_CONSTANTS Y   Á#  ¤     ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE+MPI_CONSTANTS \   e$  Å     MPI_CONSTANTS!ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIVC+MPI_CONSTANTS=MPIPRIVC T   *%  Ä     ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL+MPI_CONSTANTS S   î%  ¤     ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGV_NULL+MPI_CONSTANTS 5   &  P   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%UPLO_A 5   â&  P   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%UPLO_C 1   2'  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%NA 2   r'  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%NCB 0   ²'  ô   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%A 2   ¦(  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%LDA 6   æ(  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%LDACOLS 0   &)  ô   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%B 2   *  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%LDB 6   Z*  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%LDBCOLS 3   *  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%NBLK <   Ú*  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPI_COMM_ROWS <   +  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%MPI_COMM_COLS 0   Z+  ô   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%C 2   N,  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%LDC 6   ,  @   a   ELPA_MULT_AH_B_COMPLEX_DOUBLE%LDCCOLS ,   Î,  ñ      ELPA_INVERT_TRM_REAL_DOUBLE Z   ¿/       MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIFCMB5+MPI_CONSTANTS=MPIFCMB5 R   H0  H     ELPA_INVERT_TRM_REAL_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED+MPI_CONSTANTS Z   0       MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIFCMB9+MPI_CONSTANTS=MPIFCMB9 U   1  H     ELPA_INVERT_TRM_REAL_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY+MPI_CONSTANTS Z   d1  ø     MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV1+MPI_CONSTANTS=MPIPRIV1 N   \2  H     ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV1%MPI_BOTTOM+MPI_CONSTANTS P   ¤2  H     ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV1%MPI_IN_PLACE+MPI_CONSTANTS U   ì2  ¤     ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE+MPI_CONSTANTS Z   3  Ì     MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV2+MPI_CONSTANTS=MPIPRIV2 W   \4  Ä     ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE+MPI_CONSTANTS W    5  ¤     ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE+MPI_CONSTANTS Z   Ä5  Á     MPI_CONSTANTS!ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIVC+MPI_CONSTANTS=MPIPRIVC R   6  Ä     ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL+MPI_CONSTANTS Q   I7  ¤     ELPA_INVERT_TRM_REAL_DOUBLE%MPIPRIVC%MPI_ARGV_NULL+MPI_CONSTANTS /   í7  @   a   ELPA_INVERT_TRM_REAL_DOUBLE%NA .   -8  ô   a   ELPA_INVERT_TRM_REAL_DOUBLE%A 0   !9  @   a   ELPA_INVERT_TRM_REAL_DOUBLE%LDA 1   a9  @   a   ELPA_INVERT_TRM_REAL_DOUBLE%NBLK 7   ¡9  @   a   ELPA_INVERT_TRM_REAL_DOUBLE%MATRIXCOLS :   á9  @   a   ELPA_INVERT_TRM_REAL_DOUBLE%MPI_COMM_ROWS :   !:  @   a   ELPA_INVERT_TRM_REAL_DOUBLE%MPI_COMM_COLS 6   a:  @   a   ELPA_INVERT_TRM_REAL_DOUBLE%WANTDEBUG /   ¡:        ELPA_INVERT_TRM_COMPLEX_DOUBLE ]   ¶=       MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIFCMB5+MPI_CONSTANTS=MPIFCMB5 U   B>  H     ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED+MPI_CONSTANTS ]   >       MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIFCMB9+MPI_CONSTANTS=MPIFCMB9 X   ?  H     ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY+MPI_CONSTANTS ]   a?      MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV1+MPI_CONSTANTS=MPIPRIV1 Q   b@  H     ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV1%MPI_BOTTOM+MPI_CONSTANTS S   ª@  H     ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV1%MPI_IN_PLACE+MPI_CONSTANTS X   ò@  ¤     ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE+MPI_CONSTANTS ]   A  Ò     MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV2+MPI_CONSTANTS=MPIPRIV2 Z   hB  Ä     ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE+MPI_CONSTANTS Z   ,C  ¤     ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE+MPI_CONSTANTS ]   ÐC  Ç     MPI_CONSTANTS!ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIVC+MPI_CONSTANTS=MPIPRIVC U   D  Ä     ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL+MPI_CONSTANTS T   [E  ¤     ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGV_NULL+MPI_CONSTANTS 2   ÿE  @   a   ELPA_INVERT_TRM_COMPLEX_DOUBLE%NA 1   ?F  ô   a   ELPA_INVERT_TRM_COMPLEX_DOUBLE%A 3   3G  @   a   ELPA_INVERT_TRM_COMPLEX_DOUBLE%LDA 4   sG  @   a   ELPA_INVERT_TRM_COMPLEX_DOUBLE%NBLK :   ³G  @   a   ELPA_INVERT_TRM_COMPLEX_DOUBLE%MATRIXCOLS =   óG  @   a   ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPI_COMM_ROWS =   3H  @   a   ELPA_INVERT_TRM_COMPLEX_DOUBLE%MPI_COMM_COLS 9   sH  @   a   ELPA_INVERT_TRM_COMPLEX_DOUBLE%WANTDEBUG *   ³H  Ù      ELPA_CHOLESKY_REAL_DOUBLE X   K       MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIFCMB5+MPI_CONSTANTS=MPIFCMB5 P   L  H     ELPA_CHOLESKY_REAL_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED+MPI_CONSTANTS X   [L       MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIFCMB9+MPI_CONSTANTS=MPIFCMB9 S   åL  H     ELPA_CHOLESKY_REAL_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY+MPI_CONSTANTS X   -M  ò     MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV1+MPI_CONSTANTS=MPIPRIV1 L   N  H     ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV1%MPI_BOTTOM+MPI_CONSTANTS N   gN  H     ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV1%MPI_IN_PLACE+MPI_CONSTANTS S   ¯N  ¤     ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE+MPI_CONSTANTS X   SO  È     MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV2+MPI_CONSTANTS=MPIPRIV2 U   P  Ä     ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE+MPI_CONSTANTS U   ßP  ¤     ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE+MPI_CONSTANTS X   Q  ½     MPI_CONSTANTS!ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIVC+MPI_CONSTANTS=MPIPRIVC P   @R  Ä     ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL+MPI_CONSTANTS O   S  ¤     ELPA_CHOLESKY_REAL_DOUBLE%MPIPRIVC%MPI_ARGV_NULL+MPI_CONSTANTS -   ¨S  @   a   ELPA_CHOLESKY_REAL_DOUBLE%NA ,   èS  ô   a   ELPA_CHOLESKY_REAL_DOUBLE%A .   ÜT  @   a   ELPA_CHOLESKY_REAL_DOUBLE%LDA /   U  @   a   ELPA_CHOLESKY_REAL_DOUBLE%NBLK 5   \U  @   a   ELPA_CHOLESKY_REAL_DOUBLE%MATRIXCOLS 8   U  @   a   ELPA_CHOLESKY_REAL_DOUBLE%MPI_COMM_ROWS 8   ÜU  @   a   ELPA_CHOLESKY_REAL_DOUBLE%MPI_COMM_COLS 4   V  @   a   ELPA_CHOLESKY_REAL_DOUBLE%WANTDEBUG -   \V  ý      ELPA_CHOLESKY_COMPLEX_DOUBLE [   YY       MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIFCMB5+MPI_CONSTANTS=MPIFCMB5 S   ãY  H     ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIFCMB5%MPI_UNWEIGHTED+MPI_CONSTANTS [   +Z       MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIFCMB9+MPI_CONSTANTS=MPIFCMB9 V   ¸Z  H     ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIFCMB9%MPI_WEIGHTS_EMPTY+MPI_CONSTANTS [    [  û     MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV1+MPI_CONSTANTS=MPIPRIV1 O   û[  H     ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV1%MPI_BOTTOM+MPI_CONSTANTS Q   C\  H     ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV1%MPI_IN_PLACE+MPI_CONSTANTS V   \  ¤     ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV1%MPI_STATUS_IGNORE+MPI_CONSTANTS [   /]  Î     MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV2+MPI_CONSTANTS=MPIPRIV2 X   ý]  Ä     ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV2%MPI_STATUSES_IGNORE+MPI_CONSTANTS X   Á^  ¤     ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIV2%MPI_ERRCODES_IGNORE+MPI_CONSTANTS [   e_  Ã     MPI_CONSTANTS!ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIVC+MPI_CONSTANTS=MPIPRIVC S   (`  Ä     ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGVS_NULL+MPI_CONSTANTS R   ì`  ¤     ELPA_CHOLESKY_COMPLEX_DOUBLE%MPIPRIVC%MPI_ARGV_NULL+MPI_CONSTANTS 0   a  @   a   ELPA_CHOLESKY_COMPLEX_DOUBLE%NA /   Ða  ô   a   ELPA_CHOLESKY_COMPLEX_DOUBLE%A 1   Äb  @   a   ELPA_CHOLESKY_COMPLEX_DOUBLE%LDA 2   c  @   a   ELPA_CHOLESKY_COMPLEX_DOUBLE%NBLK 8   Dc  @   a   ELPA_CHOLESKY_COMPLEX_DOUBLE%MATRIXCOLS ;   c  @   a   ELPA_CHOLESKY_COMPLEX_DOUBLE%MPI_COMM_ROWS ;   Äc  @   a   ELPA_CHOLESKY_COMPLEX_DOUBLE%MPI_COMM_COLS 7   d  @   a   ELPA_CHOLESKY_COMPLEX_DOUBLE%WANTDEBUG (   Dd  0      ELPA_SOLVE_TRIDI_DOUBLE +   te  @   a   ELPA_SOLVE_TRIDI_DOUBLE%NA ,   ´e  @   a   ELPA_SOLVE_TRIDI_DOUBLE%NEV *   ôe  ´   a   ELPA_SOLVE_TRIDI_DOUBLE%D *   ¨f  ´   a   ELPA_SOLVE_TRIDI_DOUBLE%E *   \g  ô   a   ELPA_SOLVE_TRIDI_DOUBLE%Q ,   Ph  @   a   ELPA_SOLVE_TRIDI_DOUBLE%LDQ -   h  @   a   ELPA_SOLVE_TRIDI_DOUBLE%NBLK 3   Ðh  @   a   ELPA_SOLVE_TRIDI_DOUBLE%MATRIXCOLS 6   i  @   a   ELPA_SOLVE_TRIDI_DOUBLE%MPI_COMM_ROWS 6   Pi  @   a   ELPA_SOLVE_TRIDI_DOUBLE%MPI_COMM_COLS 2   i  @   a   ELPA_SOLVE_TRIDI_DOUBLE%WANTDEBUG 