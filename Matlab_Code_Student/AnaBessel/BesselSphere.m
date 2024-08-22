function [j] = BesselSphere(n,k,type,r)
%BESSELSPHERE Summary of this function goes here
%   Detailed explanation goes here
if type==1
    j= (sqrt(pi/2)*besselj(n+0.5, k*r))/sqrt(k*r);
elseif type==2
    j= (sqrt(pi/2)*bessely(n+0.5, k*r))/sqrt(k*r);
end
