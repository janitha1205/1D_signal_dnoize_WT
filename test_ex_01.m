% 1. Create a clean 1D test signal (length 512, power of 2)
N = 512;
t = linspace(0, 1, N);
clean_sig = sin(2 * pi * 3 * t) + (t > 0.3 & t < 0.7) * 1.5;

% 2. Add Gaussian white noise
noise_level = 0.85;
noisy_sig = clean_sig + noise_level * randn(1, N);

% 3. Denoise using 4 decomposition levels
denoised_sig = haar_denoise_1d(noisy_sig, 2);

% 4. Compute Signal-to-Noise Ratio (SNR in dB)
snr_noisy = 10 * log10(sum(clean_sig.^2) / sum((clean_sig - noisy_sig).^2));
snr_denoised = 10 * log10(sum(clean_sig.^2) / sum((clean_sig - denoised_sig).^2));

disp(['Noisy SNR:    ', num2str(snr_noisy, '%.2f'), ' dB']);
disp(['Denoised SNR: ', num2str(snr_denoised, '%.2f'), ' dB']);

% 5. Plot comparison
figure;
subplot(3, 1, 1); plot(t, clean_sig, 'k', 'LineWidth', 1.2); title('Clean Signal'); ylim([-2 3]);
subplot(3, 1, 2); plot(t, noisy_sig, 'r'); title(['Noisy Signal (SNR: ', num2str(snr_noisy, '%.2f'), ' dB)']); ylim([-2 3]);
subplot(3, 1, 3); plot(t, denoised_sig, 'b', 'LineWidth', 1.2); title(['Denoised Signal (SNR: ', num2str(snr_denoised, '%.2f'), ' dB)']); ylim([-2 3]);

