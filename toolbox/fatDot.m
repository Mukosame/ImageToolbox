% ===================================================
% *** FUNCTION fatDot
% ***
%This function is a digital simulation of fat dot printer 
%Input: img: uint8 halftoned image(value is 0 or 255 at each pixel)
%Output: fat dot image matrix(2x original size)
% ===================================================

function [output] = fatDot(img)
%input = rgb2gray(img);
input = img;
whatsize = size(input);
h = whatsize(1);
w = whatsize(2);
output = 255*ones(2*h, 2*w);
input = double(input);
goldline = 0.5*255;
for i=1:1:h
    for j=1:1:w
        if (input(i, j)<goldline)
            output(2*i-1, 2*j-1) = 0;
            output(2*i, 2*j-1) = 0;
            output(2*i-1, 2*j) = 0;
            output(2*i, 2*j) =0;
            if (j>1)
                output(2*i-1, 2*j-2) = 0;
                output(2*i, 2*j-2) = 0;
            end
            if (j<w)
                output(2*i-1, 2*j+1) = 0;
                output(2*i, 2*j+1) = 0;
            end
        end
    end
end
output = uint8(output);
end