function [alpha_index, beta_index, gamma_index]=waveAnalyze(wave)
%this function takes in a wave vector and output the rms voltage of alpha(8-14Hz),
%beta(13-30Hz), and gamma(30 - 100Hz) wave;
phase_samples = length(wave);
%==============debug cosine funciton=============================
% phase_start   = pi/2;
% phase_end     = pi/2+7*2*pi - 7*2*pi/phase_samples;
% phase = linspace(phase_start, phase_end, phase_samples);
% f_x = cos(phase);
%==================retrieve alpha wave================================
alpha = fftFilter(wave, phase_samples, 8, 14);
% plot(alpha);
alpha_index = mean(abs(alpha));
%==================retrieve beta wave================================
beta = fftFilter(wave, phase_samples, 13, 30);
% plot(beta);
beta_index = mean(abs(beta));
%==================retrieve gamma wave================================
gamma = fftFilter(wave, phase_samples, 30, 100);
% plot(gamma);
gamma_index = mean(abs(gamma));
end