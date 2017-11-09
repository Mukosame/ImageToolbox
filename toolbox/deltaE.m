% ===================================================
% *** FUNCTION deltaE
% *** this function can calculate the delta E of two Lab values
% *** function deltaE(Lab1, Lab2)
% *** Input: Lab1 and Lab2
% *** Each Lab should be a nx3 array: Lab = [L a b]
% *** Output: cout is calculated delta E
% ===================================================
function [cout] = deltaE(Lab1, Lab2)
cout = sqrt((Lab1(1) - Lab2(1)).^2 + (Lab1(2) - Lab2(2)).^2 + (Lab1(3) - Lab2(3)).^2);
end