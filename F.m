function F = F(v,h,n)
% Cette fonction �value F(v) en un point donn�

M=-2*eye(n)+[zeros(1,n);[eye(n-1) zeros(n-1,1)]]+[[zeros(n-1,1) eye(n-1)];zeros(1,n)];
F=M*v+h^2*exp(v);
end

