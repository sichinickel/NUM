function [A_int] = A_int2(k, km)
%A_INT2 Summary of this function goes here
%   Detailed explanation goes here
syms theta
A_int= int(BesselSphere(k, km,1, theta)*theta^2, theta, 0, 1)/int(BesselSphere(k, km, 1, theta)^2*theta^2, theta, 0, 1);
A_int=round(double(A_int), 10);
end