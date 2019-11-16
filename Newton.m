function [x,X] = Newton(fonc,dfonc,x0,tol,maxiter)
% NEWTON solves the equation f(x)=0 using
% Newton's method with initial guess x0.
% The function terminates when the Newton step length is less than tol
% or when the maximum number of iterations maxiter is reached.
% The output argument X, when requested, is a matrix,
% the kth column of which is the kth iterate.
    iterator = 1;
    x = x0;
    X = [x0];
    while 1
        if iterator > maxiter
            break;
        end
        %cette formule de recursion marche aussi si fonc est un vecteur et
        %dfonc une matrice(c'est à dire la matrice jacobienne)
        xnew = x - dfonc(x)\fonc(x);
        if abs(xnew - x) < tol
            break;
        end
        x =xnew;
        X = [X x];
        iterator = iterator + 1;
        
    end
end

