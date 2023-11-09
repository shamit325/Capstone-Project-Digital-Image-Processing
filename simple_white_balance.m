function I_balanced = simple_white_balance(I)
    % Calculate the mean of each color channel
    mean_rgb = mean(reshape(I, [], 3));
    
    % Calculate the scaling factors for each channel
    scale_factors = mean(mean_rgb) ./ mean_rgb;
    
    % Scale each channel
    I_balanced = bsxfun(@times, I, reshape(scale_factors, 1, 1, 3));
    
    % Clip the values to [0, 1]
    I_balanced = max(min(I_balanced, 1), 0);
end


