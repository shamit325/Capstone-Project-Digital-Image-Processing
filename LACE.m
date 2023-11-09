function enhanced_image = LACE(input_image)
    % Convert input image to LAB color space
    lab_image = rgb2lab(input_image);

    % Extract L, a, and b channels
    L = lab_image(:,:,1);
    a = lab_image(:,:,2);
    b = lab_image(:,:,3);
    
    % Convert L to single for locallapfilt
    L_single = im2single(L);
    
    % Compute mean values of a and b channels
    mean_a = mean(a, 'all');
    mean_b = mean(b, 'all');
    
    % Local contrast enhancement of L channel using locallapfilt
    window_size = 15; % Set your desired window size for local block operation
    enhanced_L = locallapfilt(L_single, 0.4, 0.5, 'NumIntensityLevels', 256);

    % Convert enhanced_L back to double for LAB to RGB conversion
    enhanced_L = im2double(enhanced_L);
    
    % Color balance of a and b channels
    balanced_a = a + ((mean_b - mean_a) / (mean_a + mean_b)) * a;
    balanced_b = b + ((mean_a - mean_b) / (mean_a + mean_b)) * b;
    
    % Combine enhanced L channel and balanced a, b channels
    enhanced_lab_image = cat(3, enhanced_L, balanced_a, balanced_b);
    
    % Convert back to RGB color space
    enhanced_image = lab2rgb(enhanced_lab_image, 'Out', 'uint8');
end
