function uvans = fpred(t,uv)

u = uv(1,1);
v = uv(2,1);
alpha = 1;
beta = 1;
gamma = 1.1;
sigma = 0.7;
x = alpha * u - sigma * u * v;
y = -1 * beta * v + gamma * u * v;
uvans = [x;y];
end

