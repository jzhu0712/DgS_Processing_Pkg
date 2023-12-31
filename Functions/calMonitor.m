function gout = calMonitor(ginp,fl)
% double derivation
    d=convn(ginp,tay10','same');
    dd=convn(d,tay10','same');
    dd=dd(10:end-11); % eliminate the ends of the data

% filter to eliminate hightfrequency noise generated by the double derivation
% fl=180;    % filter length
tapsCorr=2*fl; % 
BM = fir1(tapsCorr,1/tapsCorr,blackman(tapsCorr+1));

% low pass filter 
fdd=filter(BM,1,dd);

% eliminate filter transients
gout=fdd(tapsCorr:end);
