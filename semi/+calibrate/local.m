function p = local(p)

% Output gap
p.c0_l_gdp_gap = 0.7;
p.c1_l_gdp_gap = 0.05;
p.c2_l_gdp_gap = 0.07;
p.c3_l_gdp_gap = 0.15;
p.c4_l_gdp_gap = 0.05;
p.c5_l_gdp_gap = 0.20;


% GDP deflator
p.c0_dl_pgdp = 0.5;


% Discounted future income
p.c1_l_gdp_fws = 0.90;


% CPI inflation
p.c0_dl_cpi = 0.65;
p.c1_dl_cpi = 0.07;
p.c2_dl_cpi = 0.02;
p.c3_dl_cpi = 0.02;
p.c4_dl_cpi = 0.5;


% Short-term inflation expectations
p.c1_dl_cpi_ste = 0.6;


% Short-term rate target
p.c0_r_tar = 0.7;
p.c1_r_tar = 2.5;
p.c2_r_tar = 0;
p.c3_r_tar = 0;


% Exchange rate targeting
p.c1_r = 0;
p.c1_int = 0;


% Short-term exchange rate expectations
p.c1_l_ex_ste = 0.6;


% UIP disparity
p.c1_prem = 0.5;
p.c0_prem_gap = 0.8;

end%

