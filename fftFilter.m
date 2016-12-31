function filtered_wave = fftFilter(wave, phase_samples, f_low, f_high)
%this filter transforms wave into fft domain, then band pass the signal
%between f_high and f_low frequency;

%create the fft scale
fft_fscale = linspace(-phase_samples/2, phase_samples/2 -1, phase_samples);

%perfrom fft on wave
F_w = fftshift(fft(wave));

%construct filter
filter = zeros(size(wave));
filter((0.5*phase_samples + f_low):(0.5*phase_samples + f_high)) = 1;
filter(0.5*phase_samples - f_high:0.5*phase_samples - f_low) = 1;

%perform the filter in fft domain
filtered_F = F_w .* filter;
sig_rec_iFFT = ifft(fftshift(filtered_F));
phase_rec = angle(sig_rec_iFFT);
amplitude_rec = abs(sig_rec_iFFT);

%reconstruct the wave from filtered thing
filtered_wave = 2*amplitude_rec.*cos(phase_rec);
end