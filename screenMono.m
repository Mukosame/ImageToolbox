% ===================================================
% *** FUNCTION screenMono
% *** 
%This function is to halftone image using threshold matrix
%Input: mask: threshold matrix, img: original image
%Output: the half-toned image using the threshold matrix
% ===================================================
function [out] = screenMono(mask, img)
[hw,ww] = size(img);
out = zeros(hw,ww);
[h,w] = size(mask);
%Deal with target image
for i = 1:1:hw
    for j = 1:1:ww
        mapi = map(i,h);
        mapj = map(j,w);
        if (img(i,j)>mask(mapi, mapj))
           out(i,j) = 255;
        end
       
    end
end
out = uint8(out);
end