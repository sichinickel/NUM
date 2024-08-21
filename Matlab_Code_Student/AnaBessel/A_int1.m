function [Int1] = A_int1(k)
%A_INT1 Summary of this function goes here
%   Detailed explanation goes here
syms theta
Int1=int(legendreP(k,sin(theta)*cos(theta)), theta,pi/2, pi)/int(legendreP(k,theta)^2, theta,pi/2,pi);
end

