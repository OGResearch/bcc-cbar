
close all
clear


load mat/createModel.mat m


m = rescaleStd(m, 0);

%m.std_shock_dl_cpi_ww = 3;
m.std_shock_dl_rex_tnd = 0.2;

d = steadydb(m(2), 1:100, shockFunc=@randn, numDraws=100);

% d.shock_l_ex(1:40) = randn(40, 1)*10;

p = Plan.forModel(m(1), 1:100);
p = exogenize(p, 1:20, "q"+string(1:5));
p = endogenize(p, 1:20, "shock_q"+string(1:5));

p = exogenize(p, 60:100, "q5");
p = endogenize(p, 60:100, "shock_q5");

d.q5(60:100,:) = 0;

s = simulate( ...
    m(1), d, 1:100 ...
    , method="stacked" ...
    , prependInput=true ...
    , plan=p ...
);

ch = databank.Chartpack();
ch.Range = 0:100;
ch.Round = 8;

ch < "q" + string(1:5);
ch < ["dl_cpi", "l_ex", "r", "r_tar", "l_gdp_gap", "int", "l_rex_tnd"];
draw(ch, s);

return

%%

figure();

subplot(2,2,1);
hold on
histogram(s.dl_cpi(4, :));
histogram(s.dl_cpi(40, :));

subplot(2,2,2);
hold on
histogram(s.dl_ex(4, :));
histogram(s.dl_ex(40, :));

visual.hlegend("bottom", "t=4", "t=40");