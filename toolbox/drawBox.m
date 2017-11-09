% ===================================================
% *** FUNCTION drawBox
% *** this function can draw a line-box of specific color on your image
% *** function drawBox(img, a, b, c, d, linewidth, color)
% *** area inside of the box: from range x: a to b, y: c to d
% *** Input: img is imported image that is to be changed
% *** Input: color is 1x3 array: [R G B]
% *** Output: cout is the image with box
% ===================================================
function [cout] = drawBox(img, a, b, c, d, linewidth, color)
cout = drawBlock(img, a-linewidth, b+linewidth, c-linewidth, d+linewidth, color);
for it=a:1:b
    for kt = c:1:d
        cout(kt,it,:) = img(kt,it,:); 
    end
end

end