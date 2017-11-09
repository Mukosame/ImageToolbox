% ===================================================
% *** FUNCTION uniformDistribute
% ***
%This function is to make a randomly distributed binary array uniformly distributed
%Input: mat: binary array; mcare: search as far as m neighbors that you care about
%Output: out: the uniform distributed array generated from your original array, with the same number of ones and zeros
% ===================================================

function out = uniformDistribute(mat, mcare)
f = 0; 
out = mat;
[ph, pw] = size(mat);
i1 = -1; j1 = -2;
i2 = 0; j2 = 0;
while ((i1 ~= i2)||(j1 ~= j2))
    if (i2*j2 > 0)
        out(i2, j2) = 1;
    end
    [i1, j1] = findTightest(out,mcare);
    out(i1, j1) = 0;
    [i2, j2] = findVoidest(out,mcare);
end
out(i1, j1) = 1;
end