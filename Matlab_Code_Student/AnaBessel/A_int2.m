function [A_int] = A_int2(k, km)
%A_INT2 Summary of this function goes here
%   Detailed explanation goes here
syms theta
A_int= int(besselj(k, km*theta)*theta^2, theta, 0, 1)/int(besselj(k, km*theta)^2*theta^2, theta, 0, 1);
end