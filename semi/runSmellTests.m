
close all
clear

load mat/createModel.mat m


%% Prepare chartpack

ch = databank.Chartpack();
ch.Range = 0 : 40;
ch.Round = 8;

ch < ["dl_cpi", "l_gdp_gap", "cumsum(l_gdp_gap)/4", "r", "dl_ex", "l_rex_gap"];
ch < ["l_gdp_fws-l_gdp", "l_ex-l_ex_tar", "int"];


%% Disinflation 

m1 = m;
m1.ss_dl_cpi = m1.ss_dl_cpi - 1;
m1 = solve(m1);
m1 = steady(m1);

d = steadydb(m, 0:40);
s = simulate( ...
    m1, d, 1:40 ...
    , prependInput=true ...
);
draw(ch, s);


%% Delayed policy reaction 

d = zerodb(m, 0:40);
d.shock_l_gdp_gap(1) = 1;
s1 = simulate( ...
    m, d, 1:40 ...
   , deviation=true ...
   , prependInput=true ...
);

p2 = Plan.forModel(m, 1:40);
p2 = exogenize(p2, 1:4, "r");
p2 = endogenize(p2, 1:4, "shock_r");
d.r(1:4) = 0;
s2 = simulate( ...
    m, d, 1:40 ...
   , deviation=true ...
   , plan=p2 ...
   , prependInput=true ...
);

draw(ch, databank.merge("horzcat", s1, s2));


%% Foreign short-term rate shock 

d = zerodb(m, 0:40);
d.shock_r_ww(1) = 1;
s = simulate( ...
    m, d, 1:40 ...
    , deviation=true ...
    , prependInput=true ...
);
draw(ch, s);
