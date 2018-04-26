function [C] = matrix_product(A, B)
[m, n] = size(A);
[p, q] = size(B);
C = zeros(m, q);
if (p~=n)
    error('Prodhimi nuk mund te kryhet.'); %Multiplication can not be done
end
for i=1:m
    for j=1:q
        C(i,j) = A(i,:) * B(:,j);
        %for k=1:n  
         %   C(i,j) = C(i,j)+ A(i,k) * B(k,j);
        %end
        % ^ Typical multiplication method
    end
end