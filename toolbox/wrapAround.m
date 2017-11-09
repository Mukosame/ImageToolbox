% ===================================================
% *** FUNCTION wrapAround
% ***
%This function is to extend the original array to as far as nearest 8 neighborhoods
%Input: mat: array; N: extended size, should be no moren than the size of the array
%Output: extended array
% ===================================================

function out = wrapAround(mat, N)
    h = size(mat,1);
    d = floor(N/2);
    
    out = padarray(mat, [d   d]);
    
    % up padding
    out(1:d, d+1: d+h) = mat(h-d+1: h, 1: h);
    
    % down padding
    out(d+h+1: d+h+d, d+1: d+h) = mat(1: d, 1: h);
    
    % left padding
    out(d+1: d+h, 1: d) = mat(1: h, h-d+1: h);
    
    % right padding
    out(d+1: d+h, d+h+1: end) = mat(1: h, 1: d);
    
    % up-left corner padding
    out(1:d, 1: d) = mat(end-d+1:end, end-d+1:end);
    
    % bottom-left corner padding
    out(h+d+1: d+h+d, 1: d) = mat(1: d, end-d+1:end);
    
    % up-right corner padding
    out(1: d, h+d+1: h+d+d) = mat(end-d+1: end, 1: d);
    
    % bottom-right corner padding
    out(d+h+1: end, d+h+1: end) = mat(1:d, 1: d);

end