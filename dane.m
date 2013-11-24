
% Stacja A
% Średnica anteny (m)
D = 2;
%  sprawność anteny
n = 0.75;
% moc wyjściowa (W)
P0_a = 20;
% moc wyjściowa (dBW)
P0db_a = 13;
% Stosunek wzmocnienia do temperatury szumowej (G/T) (dB/K)
GT = 25;
% wysokosc npm (m)
h_a = 400;
% srednia wielkosc opadow w roku (mm/h)
opady_a = 42;

% szerokość geograficzna: ϕ = 41˚23’ N
lat_a = convertToDecimal([41, 23, 0]);
% długość geograficzna: φ = 2˚10’ E
lng_a = convertToDecimal([2, 10, 0]);


% Stacja B 
% moc wyjściowa (W)
P0_b = 20;
% moc wyjściowa (dBW)
P0db_b = 13;
% wysokosc npm (m)
h_b = 66;
% srednia wielkosc opadow w roku (mm/h)
opady_b = 42;

% szerokość geograficzna: ϕ = 36˚50’ N
lat_b = convertToDecimal([36, 59, 0]);
% długość geograficzna: φ = 10˚09’W
lng_b = convertToDecimal([10, 9, 0]);


%Satelita
% punkt pracy HPA (dB)
OBO = -2.5;
% (dbW)
EIRP = 46;
% G/T (dB/K)
GT_sat = 8;
% częst downlink
f_down = 12.5e9;
% częst uplink 
f_up = 14e9;

lambda_down = c/f_down;

lambda_up = c/f_up;
% długość geograficzna satelity: φ = 8 ˚  W
lng_sat = convertToDecimal([-8,0,0]);
EIRP_sat = 46;
OBO = 2.5;

%Parametry transmisji
%Przepływność 
Rb = 20e6;
%elementowa stopa błędow
BER = 1e-6;
% Częstotliwość transpondera?
B = 36e6;
% kod korekcyjny
kod_korekc = 4.5;
%Inne
%Dostępność systemu (%)
dost = 99.995;
%margines implmenetacyjny (dB)
margin = 0.5;


% to należy odczytać z wykresu
La = 0.15;

% z wykresu (dB/km)
gammaR=1.8;


% to należy odczytać z wykresu
La_b = 0.1;

% to należy odczytać z wykresu
gammaR_b = 1.9;

