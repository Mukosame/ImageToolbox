% ===================================================
% *** FUNCTION sED
% ***
%This function is to calculate standard error diffusion result, based on Floyd-Steinberg error diffusion model
%Input: uint8 image array
%Output: halftoned image
% ===================================================

function [output] = sED(input)
whatsize = size(input);
h = whatsize(1);
w = whatsize(2);
fp = double(input);
g = zeros(size(input));
eq = g;
goldline = 0.5*255;

for i = 1:1:h
    for j = 1:1:w
    if (fp(i, j)>=goldline)
        g(i, j) = 255;
    end
    eq = g(i,j) - fp(i,j);
 % add the error diffusion   
 if (j<w)
    fp(i, j+1) = fp(i, j+1)- eq*7/16;
 end
 if (i<h)
     if (j>1)
    fp(i+1, j-1) = fp(i+1, j-1)- eq*3/16;
     end
    fp(i+1, j) = fp(i+1, j)- eq*5/16;
    if (j<w)
    fp(i+1, j+1) = fp(i+1, j+1)-eq/16;
    end
 end
    end 
end

output = uint8(g);
end