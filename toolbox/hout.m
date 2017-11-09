% ===================================================
% *** FUNCTION hout
% ***
%This function is to calculate H_out^mag
%Input: input_mag: fft2 magnitude; kappa: k parameter
% ===================================================

function [out_mag] = hout(input_mag, kappa)
mm = max(input_mag(:));
temp = log(1+kappa*input_mag/mm);
out_mag = 255*log(1+kappa*input_mag/mm)/max(temp(:));
end