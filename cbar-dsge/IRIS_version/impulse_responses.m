% Copyright (C), OGResearch 2013

close all; 
clear all;
%% Read Model Peg
P = struct();
P.peg = true;

m = model('ModelTnTOil_IRIS2.mod','assign=',P, 'linear', false);

disp('Database with descriptions of all variables, shocks and parameters');
get(m,'descript')

m = sstate(m);
m = solve(m);
%chksstate(m);


ss = get(m,'sstate');


%% Range
startdate = qq(2016, 1);
enddate = qq(2021, 4);

%% Impulse Responses
shock = {};

enames    = get(m, 'enames');
%ecomments = get(mPeg, 'ecomments');

elist = {'epsA', 'epsAN', 'epsAT',  'epsP', 'epsH', 'epsRP', 'epsMD', 'epsYStar', 'epsPiStar', 'epsRStar', 'epsG', 'epsYO', 'epsPO', 'epsTO', 'epsI'};
for i = 1:length(elist)
    d0  = zerodb(m, 1:20);
    d0.(elist{i})(1) = 1;
    s = simulate(m, d0, 1:20, 'deviation', true, 'anticipate', false);
    s = dbextend(d0, s);
    shock.(elist{i}) = s;
end

for iter = 1:length(elist)
    
dpm = shock.(elist{iter});

xData = 1:20;
location    = 'East';
orientation = 'Vertical';


figure("Name",elist{iter});

subplot(4,4,1);
grid on;
hold on;
plot(xData, dpm.gdp, '-ks');
title('Non-oil GDP ')

subplot(4,4,2);
grid on;
hold on;
plot(xData, dpm.c, '-ks');
title('Consumption')

subplot(4,4,3);
grid on;
hold on;
plot(xData, dpm.i, '-ks');
title('Investment')


subplot(4,4,4);
grid on;
hold on;
plot(xData, dpm.g, '-ks');
title('Gov. consumption')


subplot(4,4,5);
grid on;
hold on;
plot(xData, dpm.nx, '-ks');
title('Net exports')

subplot(4,4,6);
grid on;
hold on;
plot(xData, dpm.yTx, '-ks');
title('Tradable export')

subplot(4,4,7);
grid on;
hold on;
plot(xData, dpm.ToT, '-ks');
title('Terms of trade')

subplot(4,4,8);
grid on;
hold on;
plot(xData, dpm.Pi, '-ks');
title('CPI Inflation')

subplot(4,4,9);
grid on;
hold on;
plot(xData, dpm.piTd, '-ks');
title('Tradable inflation')

subplot(4,4,10);
grid on;
hold on;
plot(xData, dpm.piN, '-ks');
title('Non-tradable inflation')

subplot(4,4,11);
grid on;
hold on;
plot(xData, dpm.piTx, '-ks');
title('Export inflation')

subplot(4,4,12);
grid on;
hold on;
plot(xData, dpm.piTm, '-ks');
title('Import inflation')


subplot(4,4,13);
grid on;
hold on;
plot(xData, dpm.w, '-ks');
title('Real wage')

subplot(4,4,14);
grid on;
hold on;
plot(xData, dpm.r, '-ks');
title('Nominal Interest rate')

subplot(4,4,15);
grid on;
hold on;
plot(xData, dpm.phi, '-ks');
title('Risk premium')

subplot(4,4,16);
grid on;
hold on;
plot(xData, dpm.de, '-ks');
title('Exchange rate')
end
