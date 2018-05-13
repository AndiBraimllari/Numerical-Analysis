function [L, Lt] = Cholesky_decomposition(A)
n = length(A);
L = zeros(n);
L(1,1) = sqrt(A(1,1));
for j = 2:n
    L(j,1) = A(j,1)/L(1,1);
end
for i = 2:n-1
    L(i,i) = sqrt(A(i,i) - (L(i,1:i-1)*L(i,1:i-1)'));
    for j = i+1:n
        L(j,i) = ( A(j,i)-(L(j,1:i-1)*L(i,1:i-1)') ) / L(i,i);
    end
end
L(n,n) = sqrt( A(n,n)-(L(n,1:n-1)*L(n,1:n-1)') );
Lt = L';
end