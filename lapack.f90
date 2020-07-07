program lapacktest
    implicit none

    !This program is use to calculate the eigenvalues and eigenvectors
    !with the help of LAPACK-Library function.

    character                                 :: jobz
    character                                 :: uplo, random

    integer                                   :: info, ndim
    integer                                   :: i
    integer                                   :: j
    integer                                   :: itype
    integer                                   :: lwork

    real(kind=4)                              :: eps
    real(kind=4), dimension(:,:), allocatable   :: a 
    real(kind=4), dimension(:,:), allocatable   :: m 

    real(kind=4), dimension(:), allocatable   :: x 
    real(kind=4), dimension(:), allocatable   :: work
    real(kind=4), dimension(:), allocatable   :: w

    
    open(unit= 33, file='demo.inp', status='unknown')
    read(33,*) ndim
    print*, 'Dimension of matrix: ',ndim
    allocate(a(ndim,ndim))
    allocate(m(ndim,ndim))

    do i = 1, ndim
        read(33,*)a(i,1),a(i,2),a(i,3),a(i,4),a(i,5)
    end do

    read(33, *) random

    do i = 1, ndim
        read(33,*)m(i,1),m(i,2),m(i,3),m(i,4),m(i,5)
    end do

    close(unit=33, status='keep')

    lwork = 4*ndim-1
    itype = 1
    jobz = 'V'
    uplo = 'U'


    print*,'A Matrix'
    do i = 1, ndim
        write(*,*)(a(i,j),j=1,ndim)
    end do

    print*,''
    print*,'B Matrix'
    do i = 1, ndim
        write(*,*)(m(i,j),j=1,ndim)
    end do

    allocate(x(ndim))
    allocate(work(lwork))
    allocate(w(ndim))

    eps = epsilon(0.0e+00)
    print*,'relative machine precision epsilon ',   &
            ' eps = ',eps

    !x = b
    CALL SSYGV(itype, jobz, uplo, ndim, A, ndim, m, ndim, w, work, lwork,info)
    
    print*,''
    print*, 'Info: ', info
    print*,''
    print*, 'Eigenvalues'
    do i = 1, ndim
        print*,'x=',w(i)
    end do

    print*,''
    print*,'A Matrix after Lapack-Function'
    print*,'A Matrix is re-written'
    print*,'The matrix below is the eigenvectors'
    print*,''
    do i = 1, ndim
        write(*,*)(a(i,j),j=1,ndim)
    end do
end program lapacktest