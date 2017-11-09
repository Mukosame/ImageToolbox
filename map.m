% ===================================================
% *** FUNCTION map
% ***
%This function is to map number N to iterate 1:M
%Different from mod: if N=n*M, mod(N,M)=0, map(N,M) = M;
%Input: num: the N that would be mapped; length: the M that serves as the iterate length
% ===================================================

function [out] = map(num, length)
res = mod(num, length);
if (res == 0)
   out = length;
   else 
   out = res;
end
end