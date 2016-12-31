%==================training model goes here================================
data = load('trainingData.txt');
X = data(:, [1, 2, 3]); y = data(:, 4);
[m, n] = size(X);
X = [ones(m,1) X];
initial_theta = zeros(n + 1, 1);
[cost, grad] = costFunction(initial_theta, X, y);
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);
%==================read in data ===========================================
% settings
SerialPort='com3'; % serial port
N=200;
Fs=200;
 
m=zeros(1,N);
 
s = serial(SerialPort);
set(s,'BaudRate',57600);
fopen(s);
 
for i = 1:N
    datum = fscanf(s, '%s');
    fprintf('%s\n', datum);
 
    if (length(datum) > 0)
        m(i) = str2num(datum);
    else
        m(i) = 0;
    end
end
 
% Clean up the serial port
fclose(s);
delete(s);
clear s;
 
% Filter m with 60 Hz notch
Wo = 60/(Fs/2);  BW = Wo/35;
[b,a] = iirnotch(Wo,BW);
m = filter(b,a,m);
 
% Remove DC offset
mu = mean(m);
m = m - mu + 1024/2;

%==================predict using the model=================================
wave_index = waveAnalyze(m);
wave_index = [1 wave_index];
prediction = predict(sigmoid(wave_index.*theta));
%==================now lets plot the graph=================================
figure(1)
hLine = plot(m);
ylim([0 1024]);
set(hLine,'YData',m);
 
figure(2)
L=length(m);
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(m,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
 
% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|') 
                 