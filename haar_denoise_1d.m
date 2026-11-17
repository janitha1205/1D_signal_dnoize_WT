% --- 3. 1D Wavelet Denoising Function ---
function x_denoised = haar_denoise_1d(noisy_signal, levels)
    noisy_signal = noisy_signal(:)';
    N = length(noisy_signal);

    % Decompose across specified levels
    [coeffs, lengths] = haar_dwt_multilevel(noisy_signal, levels);

    % Extract finest detail coefficients (stored at the end of 'coeffs')
    finest_len = lengths(end);
    finest_cD = coeffs(end - finest_len + 1 : end);

    % Estimate noise standard deviation using Median Absolute Deviation (MAD)
    sigma = median(abs(finest_cD)) / 0.6745;

    % Universal Threshold (VisuShrink)
    T = sigma * sqrt(2 * log(N));

    % Apply soft thresholding to all detail coefficients (skip cA at the start)
    cA_len = lengths(1);
    detail_coeffs = coeffs(cA_len + 1 : end);
    detail_clean = sign(detail_coeffs) .* max(abs(detail_coeffs) - T, 0);

    % Recombine untouched cA with thresholded details and reconstruct
    coeffs_clean = [coeffs(1:cA_len), detail_clean];
    x_denoised = haar_idwt_multilevel(coeffs_clean, lengths);
endfunction
