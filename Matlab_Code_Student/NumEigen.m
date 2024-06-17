clc
clear

syms k v h e p r eps;
A =[0,1,0;(k-3)/2*v^2,(3-k)*v,k-1;v*((k-1)/2*v^2-h), h-(k-1)*v^2,k*v];
    
lambda = eig(A)
simplify(lambda)
lambda2 = subs(lambda(2), h, (e+p)/r)
lambda2 = subs(lambda2, e, r*eps+0.5*r*v^2)
lambda2 = subs(lambda2, eps, p/((k-1)*r))
simplify(lambda2)