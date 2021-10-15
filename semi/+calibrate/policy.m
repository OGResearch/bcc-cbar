function p = policy(p)

% Short-term rate target
p.c0_r_tar = 0.8;
p.c1_r_tar = 2.5;
p.c2_r_tar = 0;
p.c3_r_tar = 0;


% Exchange rate targeting
p.c1_r = 0;
p.c1_int = 0;


% UIP
p.c1_l_ex = 0.5;


% Short-term exchange rate expectations
p.c1_l_ex_ste = 0.9;


% Forex market disparity
p.c1_prem = 0.5;
p.c0_prem_gap = 0.8;


% Autoregression in policy transition
p.c0_q1 = 0.9;
p.c0_q2 = 0.9;
p.c0_q3 = 0.9;
p.c0_q4 = 0.9;
p.c0_q5 = 0.9;


end%
