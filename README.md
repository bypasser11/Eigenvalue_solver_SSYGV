# Eigenvalue_solver_SSYGV
Lapack Eigenvalues &amp;&amp; Eigenvector solver

This program serve as a DEMO for the function SSYGV of Lapack Library.
SSYGV is a Eigenvalue // Eigenvector solver for two symmetrical matrices of the form
A*x=(lambda)*B*x,  A*B*x=(lambda)*x,  or B*A*x=(lambda)*x.

More information: http://www.netlib.org/lapack/explore-html/d3/d88/group__real_s_yeigen_ga0523956327948aae43173b964188e5a2.html#ga0523956327948aae43173b964188e5a2

Requirement:
  GNU Fortran compiler && LAPACK Library installed at ${HOME} folder
 
To install LAPACK-Library please refer to this: https://www.netlib.org/lapack/lug/node14.html

To compile the file, please run the following command in the folder where this project is extracted: 

  make -f program.mk

run using: ./lapack.exe

