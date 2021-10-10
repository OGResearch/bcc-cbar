function [F ]=fun_ss_Helper(x)

 
%% DO NOT CHANGE THIS PART.
%%
%% Here we load the values of the deep parameters in a loop.
global M_ 

% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;
piTd = 1.00;
piTm = 1.00;
piTx = 1.00;
piN = 1.00;
piStar = 1.00;
de = 1;
PsiTx = 1;
PdByP = 1;
ToT = 1;
PTdByPN = x(1);

PNByPd  = 1/(((1-gammaD) + (gammaD)*(PTdByPN)^(1-muD))^(1/(1-muD))); %correct
PTdByPd = 1/(((1-gammaD)*(PTdByPN)^(muD-1) + (gammaD))^(1/(1-muD))); %correct
PTmByP  = 1/(((1-gammaM)*(ToT)^(muM-1) + gammaM)^(1/(1-muM))); %correct
PdByP   = 1/(((1-gammaM) + (gammaM)*(ToT)^(1-muM))^(1/(1-muM))); %correct
PTdByP = PTdByPd*PdByP; %correct

%PNByPd =...
%((1 - PTdByP* (gammaD)*(PTdByPd)^(-muD)*(1-gammaM)*((PdByP )^-muM)*1 - ...
%(gammaM)*((PTmByP)^-muM))/((1-gammaD)*(1-gammaM)*((PdByP )^-muM)))^(-1/muD)

PNByP = PNByPd*PdByP ;  %correct
Pid     = ((1-gammaD)*(piN*PNByPd)^(1-muD) + ...
(gammaD)*(piTd*PTdByPd)^(1-muD))^(1/(1-muD));
Pi      = ((1-gammaM)*(Pid*PdByP)^(1-muM) + ...
(gammaM)*(piTm* PTmByP)^(1-muM))^(1/(1-muM));
ePTxByP = PsiTx*PTdByP;
varepsilonP = 1;
varepsilonH = 1;
varepsilonRP = 1;
varepsilonMD = 1;
A = 1;
AT = 1;
AN = 1;
r = Pi / (pbeta * varepsilonP);
rStar = r;
hSS = 1/3;
gByGdp = tau1;
h = hSS;

jN_1ByjN_2 = ((zetaN-1)/zetaN)*((1 - (xiN)*piN ^(zetaN-1))/(1-xiN))^(1/(1-zetaN));
nuN = PNByP*(jN_1ByjN_2)*(1 - xiN*pbeta*(piN)^(zetaN))/(1-xiN*pbeta*(piN)^(zetaN-1));

jT_1ByjT_2 = ((zetaT-1)/zetaT)*((1 - (xiT)*piTd ^(zetaT-1))/(1-xiT))^(1/(1-zetaT));
nuT = PTdByP*(jT_1ByjT_2)*(1 - xiT*pbeta*(piTd)^(zetaT))/(1-xiT*pbeta*(piTd)^(zetaT-1));

jTm_1ByjTm_2 = ((zetaT-1)/zetaT)*((1 - (xiN)*piTm ^(zetaT-1))/(1-xiTm))^(1/(1-zetaT));
PsiTm = PTmByP*(jTm_1ByjTm_2)*(1 - xiN*pbeta*(piTm)^(zetaT))/(1-xiTm*pbeta*(piTm)^(zetaT-1));


varthetaTd = ((1-xiT)*(zetaT/(zetaT-1)*jT_1ByjT_2)^(-zetaT))/(1 - xiT*(piTd)^(zetaT));
varthetaTx = ((1-xiT)*(zetaT/(zetaT-1)*jT_1ByjT_2)^(-zetaT))/(1 - xiT*(piTx)^(zetaT));
varthetaTm = ((1-xiTm)*(zetaT/(zetaT-1)*jTm_1ByjTm_2)^(-zetaT))/(1 - xiTm*(piTm)^(zetaT));
varthetaN = ((1-xiN)*(zetaN/(zetaN-1)*jN_1ByjN_2)^(-zetaN))/(1 - xiN*(piN)^(zetaN));


yTxBYyD = (1/((1-gammaM)*PdByP^-muM) - PTdByP*(gammaD)*(PTdByPd)^(-muD)- ...
PNByP*(1-gammaD)*(PNByPd)^(-muD))/ePTxByP;
yTdBYyD = (gammaD)*(PTdByPd)^(-muD);
YTBYyD = yTxBYyD*varthetaTx + yTdBYyD*varthetaTd;
yNBYyD = (1-gammaD)*(PNByPd)^(-muD) ;
YT_by_YN =YTBYyD/yNBYyD;

YT_by_YN = (varthetaTx/varthetaN)*(((PTmByP*gammaM*(PTmByP)^(-muM) - tau1*tau2/(1+tau1*tau2))/(ePTxByP))...
*(1/(1-gammaM))*(PdByP)^(-muM) + gammaD*(PTdByPd)^(-muD))/((1-gammaD)*(PNByPd)^(-muD));

hTByhN = ((1-alphaT)/(1-alphaN))*(nuT/nuN) *(YT_by_YN); 
hN = h/(1+hTByhN);
hT = h - hN;
rK = 1/pbeta - 1 + delta;

kTBykN = (alphaT/alphaN)*(nuT/nuN) *(YT_by_YN);
kT = (rK / (alphaT*nuT))^(1/(alphaT - 1)) * hT;
kN = (rK / (alphaN*nuN))^(1/(alphaN - 1)) * hN;
k = kT + kN;
YT = AT*(kT)^(alphaT)*(A*hT)^(1-alphaT);
YN = AN*(kN)^(alphaN)*(A*hN)^(1-alphaN);

w1 =  nuT*(1-alphaT)*YT/hT;
w2 =  nuN*(1-alphaN)*YN/hN;
w = w1;
rk1=alphaN*nuN*YN/kN;
rk2=alphaT*nuT*YT/kT;
phi = (r/rStar) / de;
bF = - (YT * log(phi)) / phiB1;
i = delta*k;
yN1 = YN/varthetaN;
yN = YN/varthetaN;



PTByP = ((PTmByP*gammaM*(PTmByP)^(-muM) - tau1*tau2/(1+tau1*tau2))/(ePTxByP))*(ePTxByP) ....
+ (1 - ((PTmByP*gammaM*(PTmByP)^(-muM) - tau1*tau2/(1+tau1*tau2))/(ePTxByP)))*PTdByP;
gdp = PNByP*yN + (PTByP)*YT/varthetaTx;
g = gByGdp*gdp;
oT = tau2*g;
c = gdp + oT- i - g;
lambda = varepsilonP*(c - hC*c)^(-sigmaC) + hC*pbeta*varepsilonP*(c - hC*c)^(-sigmaC);
Uh = - w*lambda;
omega = - Uh/(varepsilonH*h^kappa);


z = c + i + g;
yD = (1-gammaM)*(z)*(PdByP)^(-muM);
yTd = (gammaD)*(PTdByPd)^(-muD)*yD;
yTm = gammaM*(PTmByP)^(-muM)*(z);
yTx = ((PTmByP*gammaM*(PTmByP)^(-muM) - tau1*tau2/(1+tau1*tau2))/(ePTxByP))*z;

yN2 = (1- gammaD)*(PNByPd)^(-muD)*yD;


F=[yN1- yN2...
%,gdp -( PNByP*yN + ((1-(gammaM)*((PTmByP)^-muM))*PTdByP +(gammaM)*((PTmByP)^-muM)*ePTxByP)*YT/varthetaTd)
];


 
