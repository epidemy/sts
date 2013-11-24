
% Liczymy bilans w górę od stacji A
CN0_a_up = liczBilans(lng_a,lat_a, lng_sat, P0_a, D, n, f_up, La, h_a, gammaR, dost, GT_sat, 0, 0)

% Liczymy bilans w dół do stacji B
% tu brakuje jeszcze GTes
bilans_down = liczBilans(lng_b, lat_b, lng_sat, P0_a, D, n, f_down, La_b, h_b, gammaR_b, dost, 0, EIRP_sat, OBO)

kod_ilosc_stanow = 2^(ceil(Rb/B))

EbN0 = 10*log10(erfcinv(2*BER)^2)

CN0_total_a = EbN0 + 10 * log10(Rb) - kod_korekc + margin

CN0_total_a_lin = 10^(CN0_total_a/10)

CN0_a_up_lin = 10^(CN0_a_up/10)


CN0_down = 10*log10(1/(CN0_total_a_lin^-1 - CN0_a_up_lin^-1))

GTes = CN0_down - bilans_down

c = 299792458;

GT_a = 10 * log10((pi^2 * D^2 * n)/((c/f_up)^2))

T = GT_a - GT

GT_b = GTes + T

D_b = sqrt(((10^(GT_b/10)) * (c/f_down)^2)/(n*pi^2))

% Liczymy bilans w drugą stronę, od B do A

CN0_b_up = liczBilans(lng_b,lat_b, lng_sat, P0_b, D_b, n, f_down, La_b, h_b, gammaR_b, dost, GT_sat, 0, 0)

CN0_a_down = liczBilans(lng_a,lat_a, lng_sat, P0_a, D, n, f_up, La, h_a, gammaR, dost, 0, EIRP_sat, OBO) + GT

CN0_b_up_lin = 10^(CN0_b_up/10)

CN0_a_down_lin = 10^(CN0_a_down/10)

CN0_total_b = 10*log10(1/(CN0_b_up_lin^-1 + CN0_a_down_lin^-1))

EbN0_b = CN0_total_b - 10*log10(Rb) + kod_korekc - margin

BER_b = 0.5 * erfc(sqrt(EbN0_b))