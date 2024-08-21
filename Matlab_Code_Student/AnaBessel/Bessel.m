function [J,Y] = Bessel(mu,kr)
%BESSEL Summary of this function goes here
%   Detailed explanation goes here
J=besselj(mu, kr);
Y=bessely(mu, kr);
end

