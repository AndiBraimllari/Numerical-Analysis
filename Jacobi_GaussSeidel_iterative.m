function [x] = Jacobi_GaussSeidel_iterative(A, b, num_iter, error)
[m, n] = size(A);
if (m~=length(b))
    error('Vektori b ka permasa te papershtatshme');
end
x = zeros(m, 1);
x_k = x;
iter = 0;
err = inf;  % Better than an arbitrary constant
for i = 1:n
    if abs(A(i,i)) < (sum(abs(A(i,1:i-1))) + sum(abs(A(i,i+1:n))));
        error('Matrica nuk eshte diagonale dominante');
    end %^ The matrix is not diagonally dominant
while err > error && iter < num_iter
    for i = 1:m
        x(i) = (b(i)-A(i,1:i-1)*x_k(1:i-1)-A(i, i+1:n)*x_k(i+1:m))/A(i,i);
    end                      %  ^ Replacing x_k with x transforms this to
                             %  the Gauss-Seidel iterative method
    err = norm(x-x_k, 2)/norm(x, 2);
    x_k = x;
    iter = iter + 1;
end
end
