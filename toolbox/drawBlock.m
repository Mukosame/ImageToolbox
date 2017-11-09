% ===================================================
% *** FUNCTION drawBlock
% *** this function can draw a rectangle of specific color on your image
% *** function drawBlock(img, a, b, c, d, color)
% *** change a block area of img from range x: a to b, y: c to d into one single color
% *** Input: img is imported image that is to be changed
% *** Input: color is 1x3 array: [R G B]
% *** Output: cout is the image with changed color
% ===================================================
function [cout] = drawBlock(img, a, b, c, d, color)
cout = img;
for i=a:1:b
    for k = c:1:d
        cout(k, i, :) = color;
    end
end
end