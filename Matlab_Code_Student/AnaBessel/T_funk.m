function [T] = T_funk(n, m, k, A,theta, r, tau)
%T_FUNK Summary of this function goes here
%   Detailed explanation goes here
    T=A*BesselSphere(n,k,1,r)*legendreP(n, cos(theta))*exp(-k^2*tau);
end

