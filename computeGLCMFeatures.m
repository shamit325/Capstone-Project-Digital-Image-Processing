function glcmFeatures = computeGLCMFeatures(grayImage)
    offsets = [0 1; -1 1; -1 0; -1 -1];
    glcm = graycomatrix(grayImage, 'Offset', offsets, 'Symmetric', true);
    stats = graycoprops(glcm, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
    glcmFeatures = struct();
    glcmFeatures.Contrast = mean(stats.Contrast);
    glcmFeatures.Correlation = mean(stats.Correlation);
    glcmFeatures.Energy = mean(stats.Energy);
    glcmFeatures.Homogeneity = mean(stats.Homogeneity);
end
