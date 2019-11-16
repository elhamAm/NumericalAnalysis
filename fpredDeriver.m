function jacob = fpredDeriver(t,uv)
    u = uv(1,1);
    v = uv(2,1);
    alpha = 1;
    beta = 1;
    gamma = 1.1;
    sigma = 0.7;
    jacob = [alpha - sigma * v, gamma * v; -sigma*u , -beta + gamma * u];
end

