% Define your dataset directory
datasetDir = "C:\Users\iamsh\Desktop\Simple_DIP\Main_Project\UIQS\pic_C\JPEGImages";

% Get a list of all image files in the dataset directory
imageFiles = dir(fullfile(datasetDir, '*.jpg'));

% Initialize arrays to store GLCM features
numImages = length(imageFiles);
contrastValues = zeros(numImages, 1);
correlationValues = zeros(numImages, 1);
%energyValues = zeros(numImages, 1);
%homogeneityValues = zeros(numImages, 1);

contrastOriginal = zeros(numImages, 1);
% Loop through the images, process them, and compute GLCM features
% Loop through the images, process them, and compute GLCM features
for i = 1:numImages
    % Read the image
    imagePath = fullfile(datasetDir, imageFiles(i).name);
    originalImage = imread(imagePath);
    gray_original = rgb2gray(originalImage);
    
    % Apply your processing pipeline
    correctedImage = locally_adaptive_color_correction_optimized(originalImage);
    enhancedImage = LACE(correctedImage);
    
    % Convert the enhanced image to grayscale
    grayImage = rgb2gray(enhancedImage);
    
    % Compute GLCM features for enhanced image
    glcmFeatures = computeGLCMFeatures(grayImage);
    
    % Store the GLCM features
    contrastValues(i) = glcmFeatures.Contrast;
    correlationValues(i) = glcmFeatures.Correlation;
    energyValues(i) = glcmFeatures.Energy;
    homogeneityValues(i) = glcmFeatures.Homogeneity;
    
    fprintf('Contrast value of enhanced image %d: %.4f\n', i, contrastValues(i));
    
    % Compute GLCM features for original image
    glcm_Original = computeGLCMFeatures(gray_original);
    
    % Store the GLCM features for original image
    contrastOriginal(i) = glcm_Original.Contrast;
    correlationOriginal(i) = glcm_Original.Correlation;
    energyOriginal(i) = glcm_Original.Energy;
    homogeneityOriginal(i) = glcm_Original.Homogeneity;
    
    fprintf('Contrast value of original image %d: %.4f\n', i, contrastOriginal(i));
end

% Calculate mean and standard deviation for each GLCM feature
meanContrastOriginal = mean(contrastOriginal);
stdContrastOriginal = std(contrastOriginal);


meanContrast = mean(contrastValues);
stdContrast = std(contrastValues);
meanCorrelation = mean(correlationValues);
stdCorrelation = std(correlationValues);
meanEnergy = mean(energyValues);
stdEnergy = std(energyValues);
meanHomogeneity = mean(homogeneityValues);
stdHomogeneity = std(homogeneityValues);

% Print the results
fprintf('Mean Contrast Original: %.4f (Std: %.4f)\n', meanContrastOriginal, stdContrastOriginal);


fprintf('Mean Contrast: %.4f (Std: %.4f)\n', meanContrast, stdContrast);
%fprintf('Mean Correlation: %.4f (Std: %.4f)\n', meanCorrelation, stdCorrelation);
%fprintf('Mean Energy: %.4f (Std: %.4f)\n', meanEnergy, stdEnergy);
%fprintf('Mean Homogeneity: %.4f (Std: %.4f)\n', meanHomogeneity, stdHomogeneity);
