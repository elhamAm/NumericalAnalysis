function dFx = dF(v,h,n)
% Cette fonction évalue dF(v) en un point donné

M=-2*eye(n)+[zeros(1,n);[eye(n-1) zeros(n-1,1)]]+[[zeros(n-1,1) eye(n-1)];zeros(1,n)];
u=exp(v);
B=eye(n);
    for j=[1:n]
        B(j,j)=u(j);
    end

dFx=M+h^2*B;

end

