function [ys,params,check] = PegModelTnTOil_steadystate(ys,exo,M_,options_)
% computes the steady state for the BGG_stickyWages_NonRicardian_steadystate and uses a numerical
% solver to do so
% Inputs: 
%   - ys        [vector] vector of initial values for the steady state of
%                   the endogenous variables
%   - exo       [vector] vector of values for the exogenous variables
%   - M_        [structure] Dynare model structure
%   - options   [structure] Dynare options structure
%
% Output: 
%   - ys        [vector] vector of steady state values for the the endogenous variables
%   - params    [vector] vector of parameter values
%   - check     [scalar] set to 0 if steady state computation worked and to
%                    1 of not (allows to impose restrictions on parameters)

% Copyright (C) 2013-2020 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;
%--------------------------------------------------------------------------
piTd = 1.00;
piTm = 1.00;
piTx = 1.00;
piN = 1.00;
piStar = 1.00;
de = 1;
PsiTx = 1;
PdByP = 1;
ToT = 1;
u = 1;
x0 = [1];
options = optimset('TolFun',1e-15,'TolX',1e-15,'MaxIter', 100000, 'MaxFunEvals', 100000, 'Display','off' );
[x] = fsolve(@fun_ss_Helper, x0, options);

PTdByPN = x(1)
%PTdByPN = 1;

%PTdByPN = PTdByP/PNByP;
PNByPd  = 1/(((1-gammaD) + (gammaD)*(PTdByPN)^(1-muD))^(1/(1-muD))); %correct
PTdByPd = 1/(((1-gammaD)*(PTdByPN)^(muD-1) + (gammaD))^(1/(1-muD))); %correct
PTmByP  = 1/(((1-gammaM)*(ToT)^(muM-1) + gammaM)^(1/(1-muM))); %correct
PdByP   = 1/(((1-gammaM) + (gammaM)*(ToT)^(1-muM))^(1/(1-muM))); %correct
PTdByP = PTdByPd*PdByP; %correct
%PNByPd =...
%((1 - PTdByP* (gammaD)*(PTdByPd)^(-muD)*(1-gammaM)*((PdByP )^-muM)*1 - ...
%(gammaM)*((PTmByP)^-muM))/((1-gammaD)*(1-gammaM)*((PdByP )^-muM)))^(-1/muD)

PNByP   = PNByPd*PdByP ;  %correct
Pid     = ((1-gammaD)*(piN*PNByPd)^(1-muD) + ...
(gammaD)*(piTd*PTdByPd)^(1-muD))^(1/(1-muD));
Pi      = ((1-gammaM)*(Pid*PdByP)^(1-muM) + ...
(gammaM)*(piTm* PTmByP)^(1-muM))^(1/(1-muM));
ePTxByP = PsiTx*PTdByP;
%--------------------------------------------------------------------------
varepsilonP  = 1;
varepsilonH  = 1;
varepsilonRP = 1;
varepsilonMD  = 1;
%--------------------------------------------------------------------------
A  = 1;
AT = 1;
AN = 1;
r  = Pi / (pbeta * varepsilonP);
rStar = r;
hSS = 1/3;
gByGdp = tau1;
h = hSS;
%1 = xiW*(Pi(-1)^gammaW/Pi)^(1-eta)*((w(-1))/w)^(1-eta)+(1-xiW)*wStarByw^(1-eta);
% varthetaW = xiW*(w(-1)/w*Pi(-1)^gammaW/Pi)^(-eta)*varthetaW(-1)+(1-xiW)*(wStarByw)^(-eta);
wStarByw= ((1-xiW*Pi^((gammaW-1)*(1-eta))*(1/1)^(1-eta))/(1-xiW))^(1/(1-eta));
%varthetaW  =  (1-xiW)*wStarByw^(-eta)/(1-xiW*Pi^((wStarByw-1)*(-eta))*(1)^eta);
varthetaW = (1-xiW)*(wStarByw)^(-eta)/((1 - xiW*(1/1*Pi^gammaW/Pi)^(-eta)));

hd = h/varthetaW;
%hd = h;

%: In the ss we have :
%: jTd_1*(1 - pbeta*(piTd)^(zeta)) = lambda*nuT*yTd   ;
%: jTd_2*(1 - pbeta*(piTd)^(zeta-1)) = lambda*yTd*(PTdByP);
%: Dividing gives jTd_1 by jTd_2:
%: nuT = PTdByP*(jTd_1/jTd_2)*((1-pbeta*(piTd)^(zeta))/(1 - pbeta*(piTd)^(zeta))); 
%: From eqn: 12 we have:
%: jTd_1/jTd_2 = ((zeta-1)/zeta)*((1 - xi*piTd^(zeta-1))/(1-xi))^(1/(1-zeta))
%: Therefore, the marginal cost of Tradable Producers becomes:

% jN_1 = lambda*nuN*yN + xi*pbeta*jN_1*(piN)^(zeta);
% jN_2 = lambda*yN*(PNByP) + xi*pbeta*jN_2*(piN)^(zeta-1);
% jN_1*(1 - xi*pbeta(piN)^(zeta)) =lambda*nuN*yN 
% jN_1 = lambda*nuN*yN/(1 - xi*pbeta(piN)^(zeta))
% jN_2*(1- xi*pbeta*(piN)^(zeta-1))= lambda*yN*(PNByP) ;
% jN_2= lambda*yN*(PNByP)/(1- xi*pbeta*(piN)^(zeta-1)) ;
% jN_1/jN_2 = lambda*nuN    *yN/(1 - xi*pbeta(piN)^(zeta)) /
%             lambda*(PNByP)*yN/(1- xi*pbeta*(piN)^(zeta-1))
% jN_1/jN_2 = (nuN/PNByP)*(1- xi*pbeta*(piN)^(zeta-1))/(1 - xi*pbeta(piN)^(zeta))
% nuN = PNByP*(jN_1/jN_2)*(1 - xi*pbeta(piN)^(zeta))/(1-xi*pbeta*(piN)^(zeta-1))
% jN_1/jN_2 = ((zeta-1)/zeta)*((1 - (xi)*piN ^(zeta-1))/(1-xi))^(1/(1-zeta));

jN_1ByjN_2 = ((zetaN-1)/zetaN)*((1 - (xiN)*piN ^(zetaN-1))/(1-xiN))^(1/(1-zetaN));
nuN = PNByP*(jN_1ByjN_2)*(1 - xiN*pbeta*(piN)^(zetaN))/(1-xiN*pbeta*(piN)^(zetaN-1));
jT_1ByjT_2 = ((zetaT-1)/zetaT)*((1 - (xiT)*piTd ^(zetaT-1))/(1-xiT))^(1/(1-zetaT));
nuT = PTdByP*(jT_1ByjT_2)*(1 - xiT*pbeta*(piTd)^(zetaT))/(1-xiT*pbeta*(piTd)^(zetaT-1));
jTm_1ByjTm_2 = ((zetaT-1)/zetaT)*((1 - (xiTm)*piTm ^(zetaT-1))/(1-xiTm))^(1/(1-zetaT));
PsiTm = PTmByP*(jTm_1ByjTm_2)*(1 - xiTm*pbeta*(piTm)^(zetaT))/(1-xiTm*pbeta*(piTm)^(zetaT-1));

%nuT = PTdByP*((zeta-1)/zeta)*((1 - xi*piTd^(zeta-1))/(1-xi))^(1/(1-zeta))* ...
%    ((1-pbeta*(piTd)^(zeta))/(1 - pbeta*(piTd)^(zeta)))
%nuN = PNByP*((zeta-1)/zeta)*((1 - xi*piN^(zeta-1))/(1-xi))^(1/(1-zeta))* ...
%    ((1-pbeta*(piN)^(zeta))/(1 - pbeta*(piN)^(zeta)))
%PsiTm = PTmByP*((zeta-1)/zeta)*((1 - xi*piTm^(zeta-1))/(1-xi))^(1/(1-zeta))* ...
%    ((1-pbeta*(piTm)^(zeta))/(1 - pbeta*(piTm)^(zeta)))
%: varthetaTd = xi*varthetaTd(-1) + (1-xi)*(zeta/(zeta-1)* jTd_1/jTd_2)^(-zeta);

%--------------------------------------------------------------------------
varthetaTd = ((1-xiT)*(zetaT/(zetaT-1)*jT_1ByjT_2)^(-zetaT))/(1 - xiT*(piTd)^(zetaT));
varthetaTx = ((1-xiT)*(zetaT/(zetaT-1)*jT_1ByjT_2)^(-zetaT))/(1 - xiT*(piTx)^(zetaT));
varthetaTm = ((1-xiTm)*(zetaT/(zetaT-1)*jTm_1ByjTm_2)^(-zetaT))/(1 - xiTm*(piTm)^(zetaT));
varthetaN =  ((1-xiN)*(zetaN/(zetaN-1)*jN_1ByjN_2 )^(-zetaN))/(1 - xiN*(piN)^(zetaN));
%--------------------------------------------------------------------------
%: YT = AT*(kT(-1))^(alphaT)*(A*hT)^(1-alphaT);
%: YT_by_kT = rK / (alphaT*nuT);
%: kT_by_hT = (YT_by_kT)^(1/(alphaT -1));
%: YN = AN*(kN(-1))^(alphaN)*(A*hN)^(1-alphaN);
%: YN_by_kN = rK / (alphaN*nuN);
%: kN_by_hN = (YN_by_kN)^(1/(alphaN -1));
%: kN_by_hN = (rK / (alphaN*nuN))^(1/(alphaN -1));
%: PTdByP*yTd + ePTxByP*yTx + PNByP*yN = z
%:(gammaD)*(PTdByPd)^(-muD)*(yD)=yTd
%: ePTxByP*yTx = PTmByP*yTm;
%: yTm = (gammaM)*((PTmByP)^-muM)*z
%: (1-gammaD)*(PNByPd)^(-muD)*(yD) = yN
%: yD = (1-gammaM)*((PdByP )^-muM)*z
%: 1 = PTdByP* (gammaD)*(PTdByPd)^(-muD)*(1-gammaM)*((PdByP )^-muM)*1 ...
%: + (gammaM)*((PTmByP)^-muM)*1 + ...
%: (1-gammaD)*(PNByPd)^(-muD)*(1-gammaM)*((PdByP )^-muM)*1
%--------------------------------------------------------------------------
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
w =  nuT*(1-alphaT)*YT/hT;
w =  nuN*(1-alphaN)*YN/hN;
rk1=alphaN*nuN*YN/kN;
rk2=alphaT*nuT*YT/kT;
phi = (r/rStar) / de;
bF = - (YT * log(phi)) / phiB1;
i = delta*k;
yN = YN/varthetaN;
PTByP = ((PTmByP*gammaM*(PTmByP)^(-muM) - tau1*tau2/(1+tau1*tau2))/(ePTxByP))*(ePTxByP) ....
+ (1 -  ((PTmByP*gammaM*(PTmByP)^(-muM) - tau1*tau2/(1+tau1*tau2))/(ePTxByP)))*PTdByP;
%PTByP = 1;
gdp = PNByP*yN + PTByP*YT/varthetaTd;
g = gByGdp*gdp;
oT = tau2*g;
c = gdp + oT - i - g;
wStar = w*wStarByw;
lambda = varepsilonP*(c - hC*c)^(-sigmaC) - hC*pbeta*varepsilonP*(c - hC*c)^(-sigmaC);
f_1 = (eta-1)/eta*wStar*wStarByw^(-eta)*lambda*hd/(1-pbeta*xiW*(Pi)^((gammaW-1)*(1-eta)));
f_2 = f_1;


omega = f_2*(1 - pbeta*xiW*((Pi^gammaW)/Pi)^(-eta*(1+kappa))*(1)^(-eta*(1+kappa)))/(varepsilonP*varepsilonH*wStarByw^(-eta*(1+kappa))*hd^(1+kappa));

z = c + i + g;
yD = (1-gammaM)*(z)*(PdByP)^(-muM);
yTd = (gammaD)*(PTdByPd)^(-muD)*yD;
yTm = gammaM*(PTmByP)^(-muM)*(z);
yTx = ((PTmByP*gammaM*(PTmByP)^(-muM) - tau1*tau2/(1+tau1*tau2))/(ePTxByP))*z;
yN = YN/varthetaN;
jTd_1 = lambda*nuT*yTd/(1 - xiT*pbeta*(piTd)^(zetaT));
jTd_2 = lambda*yTd*(PTdByP)/(1 - xiT*pbeta*(piTd)^(zetaT-1));
jTx_1 = lambda*nuT*yTx/(1 - xiT*pbeta*(piTx)^(zetaT));
jTx_2 = lambda*yTx*(ePTxByP)/(1 - xiT*pbeta*(piTx)^(zetaT-1));
rer = PsiTm;
PTxByPTStar = ePTxByP/(rer);
yStar = yTx/((PTxByPTStar)^(-muX));
jTm_1 = lambda*rer*yTm/(1 - xiTm*pbeta*(piTm)^(zetaT));
jTm_2 = lambda*yTm*(PTmByP)/(1 - xiTm*pbeta*(piTm)^(zetaT-1));
jN_1 = lambda*nuN*yN/(1 - xiN*pbeta*(piN)^(zetaN));
jN_2 = lambda*yN*(PNByP)/(1 - xiN*pbeta*(piN)^(zetaN-1));

a = ((PTmByP*gammaM*(PTmByP)^(-muM) - tau1*tau2/(1+tau1*tau2))/(ePTxByP));
b = gammaD*(PTdByPd)^(-muD)*(1-gammaM)*(PdByP)^(-muM);
PTByP_2 = (((PTmByP*gammaM*(PTmByP)^(-muM) - tau1*tau2/(1+tau1*tau2))/(ePTxByP))*(ePTxByP) ....
+ gammaD*(PTdByPd)^(-muD)*(1-gammaM)*(PdByP)^(-muM)*PTdByP)/(a + b);
Um = lambda - pbeta*lambda/Pi;
m = (Um/varepsilonMD)^(-1/sigmaM);
yO = (tau4)*gdp;
tau3 = tau1*tau2/tau4;
POByPStar = 1/rer;
gdpOil = yO;
oF = (1-tau3)*gdpOil/(1-rStar*de/Pi);
oT = (tau3)*gdpOil;
nx = - oT;
q = 1;
s = 0;
sDash = 0;
x =1;
Tax = g - oT;
gdpT = PTdByP*yTd + ePTxByP*yTx;
gdpN = PdByP*PNByPd*yN;
varepsilonI = 1;

params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ]);
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = M_.endo_names{ii};
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end







