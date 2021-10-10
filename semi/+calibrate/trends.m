function p = trends(p)

% Directly calibrated steady-state properties

p.ss_dl_gdp = 3;
p.ss_dl_cpi = 5;
p.ss_rr = 3;
p.ss_dl_rex = -1;


% Dynamic parameters

p.c0_dl_gdp_tnd = 0.95;
p.c1_dl_gdp_tnd = 0;

p.c0_rr_tnd = 0.95;

p.c0_dl_rex_tnd = 0.95;
p.c1_dl_rex_tnd = 0;

p.c0_rr_ww_tnd = 0.95;

end%
