# ImageToolbox
This is a Matlab toolbox of Digital Color Imaging Systems.

Reuired knowledges of this toolbox are covered in [ECE638, Purdue University](https://engineering.purdue.edu/~ece638/).

This toolbox includes following functions: 
## Chromaticity
- ciePlot: Plot CIE chromaticity diagram with colour representation 
- deltaE(Lab1, Lab2): Calculate the delta E of two Lab values
- sRGB2lab(T, RGB,obs, xyzw): Compute Lab from sRGB
- srgb2xyz(RGB): Compute XYZ from sRGB
- xyz2lab(xyz,obs,xyzw): Compute Lab from XYZ

## Fourier Analysis
- fft2mag(image,kappa): Give the fft2 magnitude of input imageae
- hout(inputMag, kappa): Compress output magnitude given k parameter

## Image Processing
- cCurveFit(x, y, points, method, param): given x and y coordinates and number of fitted points, it will give you points fitted in a close-form shape in given method and parameters
- drawBlock(image, a, b, c, d, color): draw a solid block with designated color on image. Size: x:[a, b], y:[c, d]
- drawBox(image, a, b, c, d, linewidth, color): draw a line box with designated color on image. Size: x:[a, b], y:[c, d] inside of the box
- findTightest(pattern,N): Find the tightest cluster in pattern
- findVoidest(pattern,N): Find the largest void in pattern
- map(num, length): If N=n*M, mod(N,M)=0, map(N,M) = M;
- ungammaI(image): Give ungamma result of input image
- uniformDistribute(biArray, N): make a randomly distributed binary array uniformly distributed
- wrapAround(mat, N): Extend the original array to as far as nearest 8 neighborhoods

## Halftone
### Simple threshold dither array
- screenMono(mask, image): Halftone image using threshold matrix
### Void and Cluster
- voidAndCluster(size): Generate a threshold array based on Ulichney void-and-cluster model

Original Image: 
![test_image](https://github.com/Mukosame/ImageToolbox/blob/master/src/test.png "Original image")

Void and Cluster halftoned Image: 
![vac_image](https://github.com/Mukosame/ImageToolbox/blob/master/src/vac_img.png "void-and-cluster image")

### Error diffusion
- sED(input): Get standard error diffusion halftone image, based on Floyd-Steinberg error diffusion model

Error Diffusion halftoned Image: 
![ed_image](https://github.com/Mukosame/ImageToolbox/blob/master/src/sed_img.png "error diffusion image")

### Fat-Dot Printer Model
- fatDot(image): A digital simulation of fat dot printer

Image displayed in Fat-Dot simulator: 
![fat_dot_image](https://github.com/Mukosame/ImageToolbox/blob/master/src/fatdot_img.png "fat-dot image")

- mED(image): Give modified error diffusion result considering Fat-Dot model

Modified Error Diffusion halftoned Image: 
![med_image](https://github.com/Mukosame/ImageToolbox/blob/master/src/med_img.png "modified error diffusion image")
