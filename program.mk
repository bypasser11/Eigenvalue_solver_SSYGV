CF=gfortran
FFLAGS=  -g -Wall -fbounds-check

fn=lapack

FFLAGSPP=-g -Wall -fbounds-check 

src=${fn}.f90
obj=${fn}.o

${fn}.exe:	$(obj)
	@echo " Mk.f : Try to link the executable !"
	$(CF) -fopenmp ${FFLAGS} -o ${fn}.exe $(obj) ${HOME}/lapack-3.9.0/liblapack.a ${HOME}/lapack-3.9.0/librefblas.a
	@echo " Mk.f : the executable is linked !"

clean:
	rm $(obj) ${fn}.exe

${fn}.o : ${fn}.f90
	@echo " Compiling object data: ${fn}.f90"
	$(CF) ${FFLAGSPP} -c ${fn}.f90