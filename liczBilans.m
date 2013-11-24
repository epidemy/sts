function bilans=liczBilans(lng, lat, lng_sat, P0, D, n, f_up, f_down, La, h, gammaR, dost, GT)


% prędkość światła
c = 299792458
% wysokosc orbity geo
R0 = 35786e3
% 
o = 0.151
% stała boltzmanna w db
K = -228.6

lambda_down = c/f_down

lambda_up = c/f_up

lng_es = abs(lng-lng_sat)
temp = cos(degtorad(lat)) * cos(degtorad(lng_es))
beta = acos(temp)

Pt = 10 * log10(P0)

Gt = 10 * log10((pi^2 * D^2 * n)/(lambda_up^2))

eirp = Pt + Gt % dB

d = R0*sqrt(1+(0.4199*(1-cos(beta))))

FSL = 20 * log10((4 * pi * d)/lambda_up)

%kąt elewacji
E = atan((cos(beta) - o)/sin(beta))

% wysokosc sciany deszczu (km)
hr = 4 - (0.075 * (lat - 36))
% droga sygnału przez deszcz (km)
Ls = (hr-(h*1e-3))/sin(E)
% stała redukcji
T001 = 90/(90+4*Ls*cos(E))

Le=T001 * Ls

A001 = gammaR * Le

p=100-dost

Ae = A001 * 0.12 * (p^(-(0.546+(0.043*log10(p)))))

bilans = eirp - (FSL + La + Ae) + GT - K