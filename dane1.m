clear all
clc
% Stacja A - GDAŃSK
% Średnica anteny (m)
D = 1;
%  sprawność anteny
n = 0.75;
% moc wyjściowa (W)
P0_a = 10;
% moc wyjściowa (dBW)
P0db_a = 10;
% Stosunek wzmocnienia do temperatury szumowej (G/T) (dB/K)
GT = 20;
% wysokosc npm (m)
h_a = 14;
% srednia wielkosc opadow w roku (mm/h)
opady_a = 22;

% szerokość geograficzna: ϕ = 54° 22′ N 
lat_a = convertToDecimal([54, 22, 0]);
% długość geograficzna: φ = 18° 38′ E 
lng_a = convertToDecimal([18, 38, 0]);


% Stacja B 
% moc wyjściowa (W)
P0_b = 10;
% moc wyjściowa (dBW)
P0db_b = 10;
% wysokosc npm (m)
h_b = 156;
% srednia wielkosc opadow w roku (mm/h)
opady_b = 22;

% szerokość geograficzna: ϕ = 55° 45′ N
lat_b = convertToDecimal([55, 45, 0]);
% długość geograficzna: φ = 37° 37′ E 
lng_b = convertToDecimal([37, 37, 0]);


%Satelita
% punkt pracy HPA (dB)
OBO = -2;
% (dbW)
EIRP = 52;
% G/T (dB/K)
GT_sat = 4;
% częst downlink
f_down = 12.5e9;
% częst uplink 
f_up = 14e9;

% długość geograficzna satelity: φ = 36° E
lng_sat = convertToDecimal([36,0,0]);
EIRP_sat = 52;
OBO = 2;

%Parametry transmisji
%Przepływność 
Rb = 10e6;
%elementowa stopa błędow
BER = 1e-5;
% Częstotliwość transpondera?
B = 36e6;
% kod korekcyjny
kod_korekc = 8;
%Inne
%Dostępność systemu (%)
dost = 99.993;
%margines implmenetacyjny (dB)
margin = 0.5;

% dla stacji A:
% to należy odczytać z wykresu
La = 0.16;

% z wykresu (dB/km)
gammaR=0.95;

% dla stacji B:
% to należy odczytać z wykresu
La_b = 0.14;

% to należy odczytać z wykresu
gammaR_b = 0.75;

