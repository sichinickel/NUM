function [Int1] = A_int1(k)
%A_INT1 Summary of this function goes here
%   Detailed explanation goes here
syms the
Int=int(legendreP(k,cos(the))*sin(the), the,pi/2, pi)/(2/(2*k+1));
Int1=round(double(Int), 5);
end

