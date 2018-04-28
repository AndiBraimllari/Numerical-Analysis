function [L, U, x, y] = LU_decomposition(A, b)
n = length(b);
L = eye(n);
for j=1:(n-1)
    if A(j,j) == 0
        for i=(j+1):n
            if A(i,j) ~= 0
                tmp = A(j, :);
                A(j, :) = A(i, :);
                A(i, :) = tmp;
                tmp = b(j);
                b(j) = b(i);
                b(i) = tmp;
                break;
            end
        end
    end
    
    for i =(j+1):n
        gij = A(i,j)/A(j,j);
        L(i,j) = gij;
        A(i,j:end) = A(i,j:end)-gij*A(j,j:end) ;
        
    end
end

U = A;
% A = LU, Ax = b <=> (LU)*x = b

% Ly = b
y = zeros(n,1);
y(1) = 1;
for i=2:n
    y(i) = (b(i)-(L(i,1:i-1)*y(1:i-1))) / L(i,i);
end

% Ux = y 
x = zeros(n,1);
x(n) = y(n)/U(n,n);
for i=n-1:-1:1
    x(i) = (y(i)-(U(i,i+1:n)*x(i+1:n))) / U(i,i);
end    

end