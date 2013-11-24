function bilans_up=calculateBilans(lng, lat, lng_sat, P0, D, n, f_up, f_down, La, h, gammaR, dost, eirp, GT)

lng_es = abs(lng_a-lng_sat)
temp = cos(degtorad(lat_a)) * cos(degtorad(lng_es))
beta = acos(temp)

Pt = 10 * log10(P0_a)

Gt = 10 * log10((pi^2 * D^2 * n)/(lambda_up^2))

eirp_es = Pt + Gt % dB

du = R0*sqrt(1+(0.4199*(1-cos(beta))))

FSL_u = 20 * log10((4 * pi * du)/lambda_up)

%kąt elewacji
E = atan((cos(beta) - o)/sin(beta))
% to należy odczytać z wykresu
La = 0.15
% wysokosc sciany deszczu (km)
hr = 4 - (0.075 * (lat_a - 36))
% droga sygnału przez deszcz (km)
Ls = (hr-(h_a*1e-3))/sin(E)
% stała redukcji
T001 = 90/(90+4*Ls*cos(E))

Le=T001 * Ls
% z wykresu (dB/km)
gammaR=1.8

A001 = gammaR * Le

p=100-dost

Ae = A001 * 0.12 * (p^(-(0.546+(0.043*log10(p)))))

bilans_up = eirp_es - (FSL_u + La + Ae) + GT_sat - K