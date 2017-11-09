% ===================================================
% *** FUNCTION voidAndCluster
% ***
%This function is to generate a threshold array based on Ulichney void-and-cluster model
%Input: ditherSize: the size of your dither array, used for thresholding the image
%Output: output is the threshold array/dither array, size: ditherSize x ditherSize
% ===================================================
function [output] = voidAndCluster(ditherSize)
mcare = ditherSize;

%Generate white noise(power=-5) matrix
power = -5;
ph = ditherSize; pw = ditherSize;
pattern = wgn(ph, pw, power);
%Get binary pattern, minority:1
thresh = 0.15;

for i=1:ph
    for j=1:pw
        if (pattern(i,j)<=thresh)
            pattern(i,j) = 0;
        else
            pattern(i,j) = 1;
        end
    end
end

pattern = uniformDistribute(pattern,mcare);
pattern_original = pattern;
numOnes = sum(pattern_original(:));

%vac is void-and-clustering dither matrix
%Initialize the dither matrix
vac(1:ph,1:pw) = 125;
[m, n] = size(vac);%height and width of the dither matrix
rank = numOnes - 1;

%Phase 1
while (rank>=0)
    %Find location of tightest cluster in Binary Pattern
    [i, j] = findTightest(pattern,mcare);
    %Reomove 1 from tightest cluster
    pattern(i, j) = 0;    
    %Enter rank in the dither array
    vac(i, j) = rank;    
    rank = rank - 1;
end
pattern_1 = pattern;

rank = numOnes;
pattern = pattern_original;%Load original binary pattern

%Phase 2
while (rank < m*n)%m*n/2)
    %Find lication of largetst void in Binary Pattern
    [i, j] = findVoidest(pattern,mcare);
    %Insert 1 in largest void
    pattern(i, j) = 1;    
    %Enter rank in the dither array
    vac(i, j) = rank;    
    rank = rank + 1; 
end
pattern_2 = pattern;

%Normalize our dither array
%0~m*n-1
vac_norm = fix((vac+0.5)*256/(m*n));
output = vac_norm;
end