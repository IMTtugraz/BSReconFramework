function [Dx,Dy,Dz] = get_sp_fdif(n,m,t)


	%Number of elements	
	N = n*m*t;
		
	%Dx
	one_vec = ones(N,1);
	one_vec(n:n:N,1) = 0;
	Dx = spdiags( [ -one_vec [zeros(1,1) ; one_vec(1:N-1,1) ] ], [0 1], N,N);

	%Dy
	one_vec = ones(N,1);
	for l=(m-1)*n+1:m*n:N
		one_vec(l:l+n-1,1) = 0;
	end
	Dy = spdiags( [ -one_vec [zeros(n,1) ; one_vec(1:N-n,1) ] ], [0,n], N,N);
	
	%Dz
	one_vec = ones(N,1);
	one_vec( (t-1)*m*n+1:end,1) = 0;
	Dz = spdiags( [ -one_vec [zeros(n*m,1) ; one_vec(1:N-n*m,1) ] ], [0,n*m], N,N);