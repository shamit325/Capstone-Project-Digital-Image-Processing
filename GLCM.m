image1 = imread('317.jpg');
image2 = imread('final_result.png');

grayImage1 = rgb2gray(image1);
grayImage2 = rgb2gray(image2);

offsets = [0 1; -1 1; -1 0; -1 -1];
numGrayLevels = 256;

glcm1 = graycomatrix(grayImage1, 'Offset', offsets, 'NumLevels', numGrayLevels, 'Symmetric', true);
glcm2 = graycomatrix(grayImage2, 'Offset', offsets, 'NumLevels', numGrayLevels, 'Symmetric', true);
contrast1 = graycoprops(glcm1, 'Contrast');
contrast2 = graycoprops(glcm2, 'Contrast');

contrastValue1 = mean(contrast1.Contrast);
contrastValue2 = mean(contrast2.Contrast);

disp(['Contrast Value for Image 1: ', num2str(contrastValue1)]);
disp(['Contrast Value for Image 2: ', num2str(contrastValue2)]);

if contrastValue1 > contrastValue2
    disp('Image 1 has higher contrast and is better.');
elseif contrastValue1 < contrastValue2
    disp('Image 2 has higher contrast and is better.');
else
    disp('Both images have the same contrast level.');
end