% ===================================================
% *** FUNCTION ungammaI
% *** function ungammaI(img)
% *** give the ungamma result of input image
% *** Input: img is imported image that is to be ungamma/degamma
% *** Output: img_ug: ungamma image
% ===================================================
function [ img_ug ] = ungammaI( img )
img_ug = (double(img)./255.0).^2.2;
end

