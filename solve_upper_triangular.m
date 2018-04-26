function [x] = solve_upper_triangular(A, b) 
[n, m] = size(A); %Zgjidhja e nje sistemi trekendesh te siperm
if (n~=m)
    error('Permasat nuk perputhen'); % Dimensions don't match
end
a = length(b);
if (a~=n)
    error('Vektori i termave te lire ka permasa te papershtatshme');
end % Vector b has inappropriate dimensions
x = zeros(n,1);
x(n) = b(n)/A(n,n);

trek = sum(A(n,1:n-1).^2);
if(trek>0)
    error('Matrica nuk eshte trekendeshe e siperme'); %A is not upper tri.
end
for i=n-1:-1:1
    x(i) = (b(i)-sum(A(i,i+1:n)*x(i+1:n))) / A(i,i);
    
    trek = sum(A(i, 1:i-1).^2);
    if(trek > 0)
        error('Matrica nuk eshte trekendeshe e siperme');
    end %A is not an upper triangular matrix
end
end
                    
                                             