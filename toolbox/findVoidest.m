% ===================================================
% *** FUNCTION findVoidest
% ***Consider the neighborhood around every minority pixel, with gaussian weight: sigma
%This function is to find the largest void in pattern
%Input: Pattern array: pattern; mcare: search as far as m neighbors that you care about
%Output: the location [i, j] of the largest void point
% ===================================================
function [i,j] = findVoidest(pattern,mcare)
[ph, pw] = size(pattern);
sigma = 1.5;
pattern = wrapAround(pattern, mcare);
h = fspecial('gaussian', [mcare mcare], sigma);
temp = floor(mcare/2);
mainpart = pattern(temp+1:ph+temp,temp+1:pw+temp);
black = mainpart==1;
da = imfilter(pattern, h);
part = da(temp+1:ph+temp,temp+1:pw+temp);
part(black) = 1000000;
[value,index] = min(part(:));
[i, j] = ind2sub(size(part),index);
end