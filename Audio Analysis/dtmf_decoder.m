function dtmf_decoder(inputFile)
clc;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DTMF decoding final. Pairs of frequencies corresponding to dial tone  %
% are put through fir1 bandpass filters. These filters are of order 61. %
% Order 61 appeared to have the best yield in removing background noise.%
% Each filtered signal is then put through FFT and the absolute value   %
% of each FFT is taken. The constraints for each signal set were found  %
% using the stem plot that is commented out under each one. The newly   %
% created arrays are then passed through an if/elseif switchboard in    %
% order to ascertain what signal was input by the user.                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load(inputFile);

% band pass and fft for 0
freq01 = 941;
freq02 = 1336;
b0 = fir1(61, [(freq01)/(fs/2), (freq02)/(fs/2)], 'bandpass');
z0 = filter(b0, 1, y);
X0 = abs(fft(z0));
X0 = round(X0);
%plot(X0)
X0 = X0(X0 >= 500);
%stem(X0)
X0 = X0(X0 == 585 | X0 == 711);

% band pass and fft for 1
freq11 = 697;
freq12 = 1209;
b1 = fir1(61, [(freq11)/(fs/2), (freq12)/(fs/2)], 'bandpass');
z1 = filter(b1, 1, y);
X1 = abs(fft(z1));
X1 = round(X1);
%plot(X1)
X1 = X1(X1 >= 700);
%stem(X1)
X1 = X1(X1 == 738 | X1 == 762);

% band pass and fft for 2
freq21 = 697;
freq22 = 1336;
b2 = fir1(61, [(freq21)/(fs/2), (freq22)/(fs/2)], 'bandpass');
z2 = filter(b2, 1, y);
X2 = abs(fft(z2));
X2 = round(X2);
%plot(X2)
X2 = X2(X2 >= 500);
%stem(X2)
X2 = X2(X2 == 555 | X2 == 800);

% band pass and fft for 3
freq31 = 697;
freq32 = 1477;
b3 = fir1(61, [(freq31)/(fs/2), (freq32)/(fs/2)], 'bandpass');
z3 = filter(b3, 1, y);
X3 = abs(fft(z3));
X3 = round(X3);
%plot(X3)
X3= X3(X3 >= 600);
%stem(X3)
X3 = X3(X3 == 669 | X3 == 923);

% band pass and fft for 4
freq41 = 770;
freq42 = 1209;
b4 = fir1(61, [(freq41)/(fs/2), (freq42)/(fs/2)], 'bandpass');
z4 = filter(b4, 1, y);
X4 = abs(fft(z4));
X4 = round(X4);
%plot(X4)
X4 = X4(X4 >= 100);
%stem(X4)
X4 = X4(X4 == 161 | X4 == 1184);

% band pass and fft for 5
freq51 = 770;
freq52 = 1336;
b5 = fir1(61, [(freq51)/(fs/2), (freq52)/(fs/2)], 'bandpass');
z5 = filter(b5, 1, y);
X5 = abs(fft(z5));
X5 = round(X5);
%plot(X5)
X5 = X5(X5 >= 100);
%stem(X5)
X5 = X5(X5 == 126 | X5 == 1143);

% band pass and fft for 6
freq61 = 770;
freq62 = 1477;
b6 = fir1(61, [(freq61)/(fs/2), (freq62)/(fs/2)], 'bandpass');
z6 = filter(b6, 1, y);
X6 = abs(fft(z6));
X6 = round(X6);
%plot(X6)
X6 = X6(X6 >= 200);
%stem(X6)
X6 = X6(X6 == 219 | X6 == 1258);

% band pass and fft for 7
freq71 = 852;
freq72 = 1209;
b7 = fir1(61, [(freq71)/(fs/2), (freq72)/(fs/2)], 'bandpass');
z7 = filter(b7, 1, y);
X7 = abs(fft(z7));
X7 = round(X7);
%plot(X7)
X7 = X7(X7 >= 400);
%stem(X7)
X7 = X7(X7 == 408 | X7 == 1102);

% band pass and fft for 8
freq81 = 852;
freq82 = 1336;
b8 = fir1(61, [(freq81)/(fs/2), (freq82)/(fs/2)], 'bandpass');
z8 = filter(b8, 1, y);
X8 = abs(fft(z8));
X8 = round(X8);
%plot(X8)
X8 = X8(X8 >= 300);
%stem(X8)
X8 = X8(X8 == 391 | X8 == 957);

% band pass and fft for 9
freq91 = 852;
freq92 = 1477;
b9 = fir1(61, [(freq91)/(fs/2), (freq92)/(fs/2)], 'bandpass');
z9 = filter(b9, 1, y);
X9 = abs(fft(z9));
X9 = round(X9);
%plot(X9)
X9 = X9(X9 >= 500);
%stem(X9)
X9 = X9(X9 == 514 | X9 == 990); 

if ~isempty(X0)
    if (X0(1) == 585 && X0(2) == 711)
    fprintf('Tone is 0\n');
    subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z0)
    title('Filtered Audio');
    end
elseif ~isempty(X1)
    if (X1(1) == 762 && X1(2) == 738)
    fprintf('Tone is 1\n');
   subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z1)
    title('Filtered Audio');
    end
elseif ~isempty(X2)
    if (X2(1) == 800 && X2(2) == 555)
    fprintf('Tone is 2\n');
    subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z2)
    title('Filtered Audio');
    end
elseif ~isempty(X3)
    if(X3(1) == 669 && X3(2) == 923)
    fprintf('Tone is 3\n');
    subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z3)
    title('Filtered Audio');
    end
elseif ~isempty(X4)
    if(X4(1) == 161 && X4(2) == 1184)
    fprintf('Tone is 4\n');
    subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z4)
    title('Filtered Audio');
    end
elseif ~isempty(X5)
    if(X5(1) == 126 && X5(2) == 1143)
    fprintf('Tone is 5\n');
    subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z5)
    title('Filtered Audio');
    end
elseif ~isempty(X6)
    if(X6(1) == 219 && X6(2) == 1258)
    fprintf('Tone is 6\n');
    subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z6)
    title('Filtered Audio');
    end
elseif ~isempty(X7)
    if(X7(1) == 408 && X7(2) == 1102)
    fprintf('Tone is 7\n');
    subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z7)
    title('Filtered Audio');
    end
elseif ~isempty(X8)
    if(X8(1) == 391 && X8(2) == 957)
    fprintf('Tone is 8\n');
    subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z8)
    title('Filtered Audio');
    end
elseif ~isempty(X9)
    if(X9(1) == 514 && X9(2) == 990)
    fprintf('Tone is 9\n');
    subplot(1,2,1)
    plot(y)
    title('Raw Audio');
    subplot(1,2,2)
    plot(z9)
    title('Filtered Audio');
    end
end
   
end