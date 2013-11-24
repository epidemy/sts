
% Stacja A
% Średnica anteny (m)
D = 2
%  sprawność anteny
n = 0.75
% moc wyjściowa (W)
P0_a = 20
% moc wyjściowa (dBW)
P0db_a = 13
% Stosunek wzmocnienia do temperatury szumowej (G/T) (dB/K)
GT = 25
% wysokosc npm (m)
h_a = 400
% srednia wielkosc opadow w roku (mm/h)
opady_a = 42

% szerokość geograficzna: ϕ = 41˚23’ N
lat_a = convertToDecimal([41, 23, 0])
% długość geograficzna: φ = 2˚10’ E
lng_a = convertToDecimal([2, 10, 0])


% Stacja B 
% moc wyjściowa (W)
P0_b = 20
% moc wyjściowa (dBW)
P0db_b = 13
% wysokosc npm (m)
h_b = 66
% srednia wielkosc opadow w roku (mm/h)
opady_b = 42

% szerokość geograficzna: ϕ = 36˚50’ N
lat_b = convertToDecimal([36, 59, 0])
% długość geograficzna: φ = 10˚09’W
lng_b = convertToDecimal([10, 9, 0])


%Satelita
% punkt pracy HPA (dB)
OBO = -2.5
% (dbW)
EIRP = 46
% G/T (dB/K)
GT_sat = 8
% częst downlink
f_down = 12.5e9
% częst uplink 
f_up = 14e9

lambda_down = c/f_down

lambda_up = c/f_up
% długość geograficzna: φ = 8 ˚  W
lng_sat = convertToDecimal([-8,0,0])

%Parametry transmisji
%Przepływność 
Rb = 20e6
%elementowa stopa błędow
BER = 1e-6
% Częstotliwość transpondera?
B = 36e6
% kod korekcyjny
kod_korekc = 4.5
%Inne
%Dostępność systemu (%)
dost = 99.995
%margines implmenetacyjny (dB)
margin = 0.5

% Liczymy bilans w górę

% to należy odczytać z wykresu
La = 0.15

% z wykresu (dB/km)
gammaR=1.8

CN0_up = liczBilans(lng_a,lat_a, lng_sat, P0_a, D, n, f_up, La, h_a, gammaR, dost, GT_sat, 0, 0)

% to należy odczytać z wykresu
La_b = 0.1

% to należy odczytać z wykresu
gammaR_b = 1.9

EIRP_sat = 46
OBO = 2.5

% tu brakuje jeszcze GTes
bilans_down = liczBilans(lng_b, lat_b, lng_sat, P0_a, D, n, f_down, La_b, h_b, gammaR_b, dost, 0, EIRP_sat, OBO)

kod_ilosc_stanow = 2^(ceil(Rb/B))

EbN0 = 10*log10(erfcinv(2*BER)^2)

CN0_total = EbN0 + 10 * log10(Rb) - kod_korekc + margin

CN0_total_lin = 10^(CN0_total/10)

CN0_up_lin = 10^(CN0_up/10)

CN0_down = 10*log10(1/(CN0_total_lin^-1 - CN0_up_lin^-1))

GTes = CN0_down - bilans_down

c = 299792458

GT_a = 10 * log10((pi^2 * D^2 * n)/((c/f_up)^2))

T = GT_a - GT

GT_b = GTes + T

D_b = sqrt(((10^(GT_b/10)) * (c/f_down)^2)/(n*pi^2))


CN0_b_up = liczBilans(lng_b,lat_b, lng_sat, P0_b, D_b, n, f_down, La_b, h_b, gammaR_b, dost, GT_sat, 0, 0)

CN0_a_down = liczBilans(lng_a,lat_a, lng_sat, P0_a, D, n, f_up, La, h_a, gammaR, dost, 0, EIRP_sat, OBO) + GT

CN0_b_up_lin = 10^(CN0_b_up/10)

CN0_a_down_lin = 10^(CN0_a_down/10)

CN0_total_a = 10*log10(1/(CN0_b_up_lin^-1 + CN0_a_down_lin^-1))