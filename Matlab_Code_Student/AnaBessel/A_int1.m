function [Int1] = A_int1(k)
%A_INT1 Summary of this function goes here
%   Detailed explanation goes here
syms the
Int1=int(legendreP(k,cos(the))*sin(the), the,pi/2, pi)/int(legendreP(k,cos(the))^2*sin(the),the,0,pi);
end
