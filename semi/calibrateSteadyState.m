
close all
clear

load mat/createModel.mat m
load mat/readData.mat dq

chartRange = qq(2005,1) : qq(2021,4);

h = struct();

h.l_gdp = 100*log(dq.rgdp_sa);
h.l_cpi = 100*log(dq.cpi_sa);
h.r = dq.ref_r;
h.l_ex = -100*log(dq.neer_sa);
h.l_ex_usd = 100*log(dq.fx_rate_sa);

h.r_ww = dq.r_us;
h.l_cpi_ww = 100*log(dq.tp_cpi_sa);

h.l_rex = h.l_ex + h.l_cpi_ww - h.l_cpi;

list = ["l_cpi", "l_gdp", "l_cpi_ww", "l_ex", "l_rex"];

h = databank.apply( ...
    h, @(x) 4*diff(x) ...
    , sourceNames=list ...
    , targetNames=@(n) "d"+n ...
);

h = databank.apply( ...
    h, @(x) diff(x, -4) ...
    , sourceNames=list ...
    , targetNames=@(n) "d4"+n ...
);

h.rr = h.r - h.d4l_cpi;


%% UV filter

hp = struct();

hp.r_ww1 = hpf(h.r_ww{-Inf:qq(2014,4)}, lambda=36000);
hp.r_ww2 = hpf(h.r_ww{-Inf:qq(2014,4)}, change=Series(qq(2014,4), 0));



%% Steady state databank

ss = steadydb(m, chartRange);


%% Basic charts


ch = databank.Chartpack();
ch.Range = chartRange;

ch < "CPI Q/Q: dl_cpi";
ch < "Interest rate: r";
ch < "Real GDP Q/Q: dl_gdp";
ch < "Nominal exchange rate Q/Q: dl_ex";
ch < "Real exchange rate Q/Q: dl_rex";
ch < "Real interest rate: rr";

ch < "World CPI Q/Q: dl_cpi_ww";
ch < "World interest rate: r_ww";

draw(ch, databank.merge("horzcat", h, ss, MissingField=NaN));

