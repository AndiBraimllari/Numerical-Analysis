function [VLV, VV]=power_method(A) % Finds the greatest eigenvalue in 
n=length(A);                       % absolute value and its eigenvector
u=ones(n,1); % We have u(0) here
uGabimi=u; % Initial error
v=A*u;      % We have v(1) here
u=v/normInf(v); %ketu kemi u1
while norm2(u-uGabimi)>0.0000001
    v=A*u;
    uGabimi=u;
    u=v/normInf(v);
end
VLV = normInf(v) % round(normInf(v)) may be appropriate in some occasions 
VV = round(u)
end
