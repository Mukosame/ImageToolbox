% ===================================================
% *** FUNCTION mED
% ***
%This function is to calculate modified error diffusion result
%The algorithm is modified from standard Floyd-Steinberg error diffusion with a fat-dot printer model
%Input: input: uint8 image array
%Output: halftoned image(2x original size) by modified error diffusion algorithm
% ===================================================
function [output] = mED(input)
whatsize = size(input);
h = whatsize(1);
w = whatsize(2);
fp = double(input);
g = 255*ones(2*h, 2*w);
gp = 255*ones(h,w);

goldline = 0.5*255;

for i=1:1:h
    for j=1:1:w
        if (fp(i, j)<goldline)
            g(2*i-1, 2*j-1) = 0;
            g(2*i, 2*j-1) = 0;
            g(2*i-1, 2*j) = 0;
            g(2*i, 2*j) =0;
            if (j>1)
                g(2*i-1, 2*j-2) = 0;
                g(2*i, 2*j-2) = 0;
            end
            if (j<w)
                g(2*i-1, 2*j+1) = 0;
                g(2*i, 2*j+1) = 0;
            end
        end
        gp(i,j) = mean([g(2*i-1, 2*j-1),g(2*i, 2*j-1), g(2*i-1, 2*j), g(2*i, 2*j)]);
        eq = gp(i,j) - fp(i,j);
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