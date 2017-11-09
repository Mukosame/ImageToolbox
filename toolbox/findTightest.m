% ===================================================
% *** FUNCTION findTightest
% ***Consider the neighborhood around every minority pixel, with gaussian weight: sigma
%This function is to find the tightest cluster in pattern
%Input: Pattern array: pattern; mcare: search as far as m neighbors that you care about
%Output: the location [i, j] of the tightest point
% ===================================================
function [i,j] = findTightest(pattern,mcare)
[ph, pw] = size(pattern);
sigma = 1.5;
pattern = wrapAround(pattern, mcare);
h = fspecial('gaussian', [mcare mcare], sigma);
temp = floor(mcare/2);
mainpart = pattern(temp+1:ph+temp,temp+1:pw+temp);
white = mainpart==0;
da = imfilter(pattern, h);
part = da(temp+1:ph+temp,temp+1:pw+temp);
part(white) = -10;
[value,index] = max(part(:));
[i, j] = ind2sub(size(part),index);
end