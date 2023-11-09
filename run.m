% Read the original image
I_original = imread('317.jpg'); 
%I_original = imread("F:\Aaaaaaaa1\Storage\00 Tulir Biye\_DSC5957.JPG");
% Apply the locally adaptive color correction
I_corrected = locally_adaptive_color_correction_optimized(I_original);

% Apply the LACE enhancement
I_enhanced = LACE(I_corrected);

% Create a new figure window
figure;

% Plot the original image
subplot(1, 2, 1); % This divides the figure into a 1x2 grid, and places the next plot in the first section
imshow(I_original);
title('Original Image');

% Plot the enhanced image
subplot(1, 2, 2); % This places the next plot in the second section of the 1x2 grid
imshow(I_enhanced);
title('Enhanced Image');
