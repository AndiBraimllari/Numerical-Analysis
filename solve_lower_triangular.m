function [x] = solve_lower_triangular(A, b) 
[n, m] = size(A); %Zgjidhja e nje sistemi trekendesh te poshtem
if (n~=m)
    error('Permasat nuk perputhen'); %Dimensions don't match
end
a = length(b);
if (a~=n)
    error('Vektori i termave te lire ka permasa te papershtatshme');
end % Vector b has inappropriate dimensions
x = zeros(n,1);
x(1) = b(1)/A(1,1);

trek = sum(A(1,2:n).^2);
if(trek>0)
    error('Matrica nuk eshte trekendeshe e poshtme');%A is not lower trian.
end
for i=2:n
    x(i) = (b(i)-sum(A(i,1:i-1)*x(1:i-1))) / A(i,i);
    
    trek = sum(A(i, i+1:n).^2);  
    if(trek > 0)
        error('Matrica nuk eshte trekendeshe e poshtme');
    end % A is not a lower triangular matrix
end
end
                                               