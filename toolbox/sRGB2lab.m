% ===================================================
% *** FUNCTION sRGB2lab
% ***
% *** function [lab] = xyz2lab(T, RGB, obs)
% *** computes LAB from sRGB 
% *** RGB is an n by 3 matrix 
% *** e.g. set obs to 'd65_64 for D65 and 1964
% *** set obs to 'user' to use optional argument   
% *** xyzw as the white point
% ===================================================
function [lab] = sRGB2lab(T, RGB,obs, xyzw)
XYZ = RGB*T;
[lab] = xyz2lab(XYZ,obs, xyzw);
end