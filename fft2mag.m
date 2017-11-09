% ===================================================
% *** FUNCTION fft2mag
% *** 
%This function is to give the fft2 magnitude of imgae
%Input: img: image; kappa: k parameter
%Output: fft magnitude, and display it
% ===================================================

function [out] = fft2mag(img,kappa)
img_fft = fft2(img);
img_mag = abs(fftshift(img_fft));
out = hout(img_mag, kappa);
figure
imagesc(uint8(out));
end


