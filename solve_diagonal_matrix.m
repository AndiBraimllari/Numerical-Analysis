function [x]= solve_diagonal_matrix(A,b) %Solve Ax=b where A is a diag. mat.
[n, m] = size(A);
if(n~=m)
    error('Matrica nuk eshte katrore'); %The matrix is not square
end
x = zeros(n,1);
for i=1:n
    dia = sum(A(i, 1:i-1).^2);
    dia = dia + sum(A(i,i+1:n).^2);
    if(dia>0)
        error('Matrice nuk eshte diagonale'); %The matrix is not diagonal
    end
    x(i) = b(i)/A(i,i);
end
end

                                           