%--------------------------------------------------------------------------
var 
lambda               % Marginal utility of the consumption   
%Uh                  % Marginal disutility of the labour
A                    % Aggrefate TFP
AT                   % Tradable TFP
AN                   % non-Tradable TFP   
varepsilonP          % Preference Shock
varepsilonH          % Labour Supply Shock
varepsilonRP         % Risk Premium Shock
varepsilonMD         % Money demand Shock
varepsilonI          % Investment Shock
yStar                % Foreign output, demand
rStar                % Foreign interest rate, nominal
piStar               % Foreign inflation (Tradable)
phi                  % Risk Premium
omega                % Utility 'Parameter' of the Labour (to fix the labour supply in the s.s.)
r                    % Nominal Interest rate   
w                    % Real Wage
rK                   % Real, Rental Rate of the Capital
x                    % Investment growth
q                    % Price of Capital, Tobin's Q
s                    % variable to define the capital adjustment cost
sDash                % variable to define the capital adjustment cost   
c                    % Consumption
m                    % Real Money Balances
Um                   % Marginal Utility of Real Money Balances
i                    % Investment, Private
g                    % Government Consumption   
Tax                  % Lump-sum Tax
h                    % Total Labour 
hT                   % labour, non-Tradable   
hN                   % labour, non-Tradable   
k                    % Total, Capital
kN                   % Capital, non-Tradable
kT                   % Capital, Tradable
yTx                  % Tradable Export demanded, qanitity
yTd                  % Tradable Deomestic demanded, qanitity
yTm                  % Imports demanded, quantities
yN                   % Quantity demanded, non-Tradable   
YT                   % Supply of Tradable Output, qauntity
YN                   % Supply of non-Tradable Output, quantity
yD                   % Domesitic (-ally produced) consumables   
z                    % Domestic absorbtion
gdp                  % Non-Oil GDP   
nx                   % Net (non-Oil)Exports 
bF                   % Foreign Bonds
yO                   % Oil Production, quantity
%oF                  % Oil Funds 
gdpOil               % GDP Oil:   
oT                   % Oil Transfer value
tau3                 % Oil Transfer Proportion
nuT                  % Tradable Real Marginal Cost
nuN                  % non-Tradable Real Marginal Cost
varthetaTd           % Domestic Tradable price dispersion   
varthetaTx           % Export Tradable price dispersion
varthetaTm           % Import price dispersion  
varthetaN            % non-Tradable price dispersion   
jN_1                 % To define the LOM of prices in non-Tradable
jN_2                 % To define the LOM of prices in non-Tradable
jTx_1                % To define the LOM of prices in Exports
jTx_2                % To define the LOM of prices in Exports
jTd_1                % To define the LOM of prices in Domestic Tradables
jTd_2                % To define the LOM of prices in Domestic Tradables
jTm_1                % To define the LOM of prices in Imports         
jTm_2                % To define the LOM of prices in Imports
de                   % Nominal exchange rate
rer                  % Real exchange rate
PTdByPN              % Realtive price of domestic Tradable to non-Tradable
ToT                  % Terms of Trade
PTxByPTStar          % Tradable Export price over the foreign tradable price
PsiTx                % LOOP Gap in the export market
PNByPd               % non-Tradable price over the price domestic consumables
PNByP                % Real price of non-Tradables
PTdByPd              % Tradable price over the price domestic consumables       
PTdByP               % Real price of domestic tradables
PdByP                % Real Price of domestic consumables
PTmByP               % Real Price of Imports
ePTxByP              % Real export price in national currency
POByPStar            % Real Price of the Oil
Pi                   % CPI Inflation    
Pid                  % Domestic consumables inflation
piTm                 % Import inflation
piTd                 % Tradable Domestic inflation
piTx                 % Export inflation
piN                  % non-Tradable inflation

%--------------------------------------------------------------------------
wStar
wStarByw
hd
varthetaW
f_1
f_2
gdpT
gdpN
u
%--------------------------------------------------------------------------
;
varexo epsA epsAT epsAN epsG epsP epsH epsRP  epsPsiTm epsMC epsM
epsRStar epsPiStar epsYStar epsPO epsYO epsTO epsMD epsI;


parameters
%--------------------------------------------------------------------------
sigmaC      % Elasticity of intertemporal substitution
sigmaM      % Inverse interest rate elasticity of the money 
phiX        % Elasticity governing the capital adjustement cost
kappa       % Inverse Frisch elasticity
pbeta       % Discount Factor 
hC          % Habit parameter
phiB1       % Elasticity of the Risk Premium to Foreign Assets
phiB2       % Elasticity of the Risk Premium to (nominal) Exchange Rate
alphaT      % Capital Share in the Tradable Sector
alphaN      % Capital Share in the non-Tradable Sector
zetaT       % Market Power Parameter: Markup = 1/zeta in the zero infl. s.s.
zetaN       % Market Power Parameter: Markup = 1/zeta in the zero infl. s.s.
xiT         % Calvo non-reset probability, Tradable
xiTm        % Calvo non-reset probability, Import
xiN         % Calvo non-reset probability, non-Tradable
gammaM      % Share of Imports in z
gammaD      % Share of Trradables in yD
muM         % Elactisity of substitution between imports and domestic consumables 
muD         % Elactisity of substitution between non-tradables and tradables
muX         % Elacticity of subst. for export varieties
delta       % Capital depreciation
gamma1      % For capital utiliz. cost
gamma2      % For capital utiliz. cost
thetaPi     % Taylor Rule param. for inflation
thetaY      % Taylor Rule param. for Output Gap
%--------------------------------------------------------------------------
% Oil Block Parameters:
tau1       % Share of the Oil revenue in the Government Spending
tau2       % Share of the Government Spending in the non-oil GDP
tau4       % oil GDP to non-oil
           % tau3: Share of the Oil Transfers in Oil GDP - endogenosly determined
           % in the steady state to satisfy tau1, tau2, and tau4: tau3 = tau1*tau2/tau4
%--------------------------------------------------------------------------
%Persistence Parameters:
rhoAT
rhoAN
rhoA
rhoRP
rhoYStar
rhoPiStar
rhoRStar
rhoG
rhoP
rhoH
rhoR
rhoMD
rhoYO
rhoPO
rhoTau3
%--------------------------------------------------------------------------
gammaW  % Wage indexation
xiW     % Calvo Wage
eta     % Labour elast. of subst.  
;
%--------------------------------------------------------------------------
sigmaC =  1.00;     
sigmaM =  20;
kappa  =  2;      
pbeta  =  0.99;     
hC     =  0.5;      
phiB1  =  0.0001;    
phiB2  =  0.0;      
alphaT =  0.3;         
alphaN =  0.4;         
zetaT  =  7; 
zetaN  =  7;           
xiT    =  0.7;  
xiTm   =  0.7;
xiN    =  0.7;     
gammaM =  0.5;          
gammaD =  0.5;          
muM =     1.5;         
muD =     1.5; 
muX =     0.75;
         
delta =   0.025;         
phiX =    0.5;            
%--------------------------------------------------------------------------
tau1 =  0.5;         
tau2 =  0.4;         
tau4 =  1;  
%--------------------------------------------------------------------------
rhoAT =     0.7;        
rhoAN =     0.7;        
rhoA  =     0.7;        
rhoRP =     0.7;        
rhoYStar  = 0.7;     
rhoPiStar = 0.7;    
rhoG =      0.7;         
rhoP =      0.2;  
rhoMD =     0.7;       
rhoH =      0.7;         
rhoR =      0.7;          
rhoRStar =  0.7;    
rhoYO    =  0.7;
rhoPO    =  0.7;
rhoTau3  =  0.7;
gamma1 = 1/pbeta - 1+ delta;
gamma2 = gamma1*2;
thetaPi = 1.5;
thetaY = 0.0;
%--------------------------------------------------------------------------
gammaW = 1;
xiW = 0.7;
eta = 5;
%--------------------------------------------------------------------------

@#include "regime.mod"


model;
%--------------------------------------------------------------------------
%   RBC block:
%--------------------------------------------------------------------------
% Equation 1. Marginal U. of the consumption:
lambda = varepsilonP*(c - hC*c(-1))^(-sigmaC) - hC*pbeta*varepsilonP(+1)*(c(+1) - hC*c)^(-sigmaC);

% Equation 2. Euler equation:
pbeta*(lambda(+1)/lambda)*(r/Pi(+1)) = 1;

% Equation 3. Risk Prem.:
phi = exp(-phiB1*bF/gdp + phiB2*(de(+1)*de -1) + log( varepsilonRP));

% Equation 4. UIP:
pbeta*(lambda(+1)/lambda)*(phi*rStar*de(+1)/Pi(+1)) = 1;

% Equation 5. Marginal U. of money:
Um = varepsilonP*varepsilonMD*m^(-sigmaM);

% Equation 6. Money demand:
Um = lambda - pbeta*lambda(+1)/Pi(+1);

% Not in the list used to fix h_bar =1/3
omega = STEADY_STATE(omega);

% Equation 7. Investment growth:
x = i/(i(-1));

% Equation 8. Capital adjustment cost:
s = phiX*(x - 1)^2;

% Euation 9. Derivative of the  Capital adjustment cost
sDash = 2*phiX*(x-(1));

% Equation 10. Capital Accumulation:
k = (1-s)*i+ (1-delta)*k(-1);

% Equation 11. FOC w.r.t. to capital:
1 = (pbeta*lambda(+1)/lambda)*(rK(+1)*u(+1) - varepsilonI(+1)^(-1)*(gamma1*(u(+1)-1) + gamma2/2*(u(+1)-1)^2) +(1-delta)*q(+1))/q;    % 

% Equation 12. FOC w.r.t. to Investment:
varepsilonI*q*(1-s-x*sDash)+pbeta*(lambda(+1)/lambda)*varepsilonI(+1)*q(+1)*sDash(+1)*x(+1)^2 = 1;                              % 

% Equation 13. FOC w.r.t. to utilization:
rK = (gamma1*u + varepsilonI^(-1)*gamma2*(u-1)); 


%--------------------------------------------------------------------------
% Equation 14. An auxiliary variable variable to present the wage stickiness: 
f_1 = (eta-1)/eta*wStar*lambda*wStarByw^(-eta)*hd + 
pbeta*xiW*((Pi^gammaW)/Pi(+1))^(1-eta)*(wStar/wStar(+1))^(1-eta)*f_1(+1);
% Equation 15. An auxiliary variable variable to present the wage stickiness: 
f_2 = omega*varepsilonP*varepsilonH*wStarByw^(-eta*(1+kappa))*hd^(1+kappa) +  
pbeta*xiW*((Pi^gammaW)/Pi(+1))^(-eta*(1+kappa))*(wStar/wStar(+1))^(-eta*(1+kappa))*f_2(+1);  
% Equation 16: FOC. for the labour supply:
f_1 = f_2;
% Equation 17: Law of motn. for wages :
1 = xiW*(Pi(-1)^gammaW/Pi)^(1-eta)*((w(-1))/w)^(1-eta)+(1-xiW)*wStarByw^(1-eta);
% Equation 18: Wage Dispersion
varthetaW = xiW*(w(-1)/w*Pi(-1)^gammaW/Pi)^(-eta)*varthetaW(-1)+(1-xiW)*(wStarByw)^(-eta);
%Wage inflation, Not defined on Appendix. Defined here for convinience
wStarByw = wStar/w;
% Equation 19: Market clearing in the labour markets:
hd = h/varthetaW;
%--------------------------------------------------------------------------

% Equation 20: Supply (Production) of the non-tradable products: 
YN = AN*(kN)^(alphaN)*(A*hN)^(1-alphaN);
% Equation 21: Demand for the Labour in the NT sector:
w  = nuN*(1-alphaN)*YN/hN;
% Equation 22: Demand for the Capital in the NT sector:
rK = nuN*alphaN*YN/kN;
% Equation 23: Supply (Production) of the tradable products: 
YT = AT*(kT)^(alphaT)*(A*hT)^(1-alphaT);
% Equation 24: Demand for the Labour in the T sector:
w  = nuT*(1-alphaT)*YT/hT;
% Equation 25: Demand for the Capital in the T sector:
rK = nuT*alphaT*YT/kT;
% Equation 26: Aggregate Capital Demand, Capital in the Production Process:
u*k(-1)   = kT + kN;                                                          
%Note that Capital supply is a predetmined variable 
%Equation 27: Aggregate demand for the Labour
hd   = hT + hN;
%--------------------------------------------------------------------------
% NK Block: Supply side:
%--------------------------------------------------------------------------
% Price dynamics in the non-tradable sector:
[ name = '28. Price Dynamics: Domestic nonTradables 1']
jN_1 = lambda*nuN*yN*exp(epsMC) + xiN*pbeta*jN_1(+1)*(piN(+1))^(zetaN);
[ name = '29. Price Dynamics: Domestic nonTradables 2']
jN_2 = lambda*yN*(PNByP) + xiN*pbeta*jN_2(+1)*(piN(+1))^(zetaN-1);
[ name = '30. Price Dynamics: Domestic nonTradables 3']
1 = (xiN)*piN ^(zetaN-1) + (1-xiN)*(zetaN/(zetaN-1)* jN_1/jN_2)^(1-zetaN);
[ name = '31. Price dispersion: Domestic']
varthetaN = xiN*varthetaN(-1)*(piN)^(zetaN) + (1-xiN)*(zetaN/(zetaN-1)*jN_1/jN_2)^(-zetaN);
%--------------------------------------------------------------------------
% Price dynamics in the domestic-tradable sector:
[ name = '32. Price Dynamics: Domestic Tradables 1']
jTd_1 = lambda*nuT*yTd*exp(epsMC) + xiT*pbeta*jTd_1(+1)*(piTd(+1))^(zetaT);
[ name = '33. Price Dynamics: Domestic Tradables 2']
jTd_2 = lambda*yTd*(PTdByP) + xiT*pbeta*jTd_2(+1)*(piTd(+1))^(zetaT-1);
[ name = '34. Price Dynamics: Domestic Tradables 3']
1 = (xiT)*piTd ^(zetaT-1) + (1-xiT)*(zetaT/(zetaT-1)* jTd_1/jTd_2)^(1-zetaT);
[ name = '35. Price dispersion: Domestic Tradables']
varthetaTd = xiT*varthetaTd(-1)*(piTd)^(zetaT) + (1-xiT)*(zetaT/(zetaT-1)*jTd_1/jTd_2)^(-zetaT);
%--------------------------------------------------------------------------
% Price dynamics in the export-tradable sector:
[ name = '36. Price Dynamics: Export 1']
jTx_1 = lambda*nuT*yTx*exp(epsMC) + xiT*pbeta*jTx_1(+1)*(piTx(+1))^(zetaT);
[ name = '37. Price Dynamics: Export 2']
jTx_2 = lambda*yTx*(ePTxByP) + xiT*pbeta*jTx_2(+1)*(piTx(+1))^(zetaT-1);
[ name = '38. Price Dynamics: Export 3']
1 = xiT*piTx ^(zetaT-1) + (1-xiT)*(zetaT/(zetaT-1)* jTx_1/jTx_2)^(1-zetaT);
[ name = '39. Price dispersion: Export']
varthetaTx = xiT*varthetaTx(-1)*(piTx )^(zetaT) + (1-xiT)*(zetaT/(zetaT-1)*jTx_1/jTx_2)^(-zetaT);
%--------------------------------------------------------------------------
% Price dynamics in the impot market:
[ name = '40. Price Dynamics: Import 1']
jTm_1 = lambda*(rer)*yTm*exp(epsPsiTm) + xiTm*pbeta*jTm_1(+1)*(piTm(+1))^(zetaT);
[ name = '41. Price Dynamics: Import 2']
jTm_2 = lambda*yTm*PTmByP + xiTm*pbeta*jTm_2(+1)*(piTm(+1))^(zetaT-1);
[ name = '42. Price Dynamics: Import 3']
1 = xiTm*piTm ^(zetaT-1) + (1-xiTm)*(zetaT/(zetaT-1)* jTm_1/jTm_2)^(1-zetaT);
[ name = '43. Price dispersion: Import']
varthetaTm = xiTm*varthetaTm(-1)*(piTm )^(zetaT) + (1-xiTm)*(zetaT/(zetaT-1)*jTm_1/jTm_2)^(-zetaT);
%--------------------------------------------------------------------------
% NK Block Demand Side:
%--------------------------------------------------------------------------
% Equation 44. Domestic absorption:
z = c + i + varepsilonI^(-1)*(gamma1*(u-1) - gamma2/2*(u-1)^2)*k(-1) + g;                 
% Equation 45. Demand for Domestic (N+Td) goods:
yD  = (1-gammaM)*((PdByP)^-muM)*z;
% Equation 46. Demand for Imports:
yTm = (gammaM)*((PTmByP)^-muM)*z;
% Equation 47. Demand For Non-Tradables 
yN =  (1-gammaD)*(PNByPd)^(-muD)*yD;
% Equation 48. Demand for Tradable Domestic
yTd = (gammaD)*(PTdByPd)^(-muD)*yD;
% Equation 49. Demand for Exports
yTx = (PTxByPTStar)^(-muX)*yStar;
% Equation 50. Market Clearing non-Tradabke
yN =  YN/varthetaN;
% Equation 51. Market Clearing Tradable
YT =  yTd*varthetaTd + yTx*varthetaTx;
%--------------------------------------------------------------------------
% yD  = ((1-gammaD)^(1/muD)*yN^((muD-1)/muD) + gammaD^(1/muD)*(yTd)^((muD-1)/muD))^(muD/(muD-1));
% This becomes redundant: 
% z   = ((1-gammaM)^(1/muM)*yD^((muM-1)/muM) + gammaM^(1/muM)*(yTm)^((muM-1)/muM))^(muM/(muM-1));
%--------------------------------------------------------------------------
% Prices:
%--------------------------------------------------------------------------
% Equation 52. Real Price of Exports:
ePTxByP = PsiTx*PTdByP;
% Equation 53. Export LOOP Gap:
PsiTx/PsiTx(-1) = de*piTx/piTd;
% Equation 54. Real Exchange Rate:
rer/rer(-1) = de*piStar/Pi;
% Equation 55. Price Ratio for Export Demand:
PTxByPTStar = ePTxByP/(rer);
% Equation 56. Terms of Trade 
ToT/ToT(-1) = piTm/Pid;
% Equation 57. Terms of Trade between T and N:
PTdByPN/PTdByPN(-1) = piTd/piN;
% Equation 58. Price of NT over Price of Domestic goods. 
% Used 1) to define domestic (ly produced) inflation
% 2) Together with PdByP to define the real price of non-tradable goods later:
PNByPd  = 1/(((1-gammaD) + (gammaD)*(PTdByPN)^(1-muD))^(1/(1-muD)));         
% Equation 59. Price of NT over Price of Domestic goods. 
% Used 1) to define domestic (ly produced) inflation
% 2) Together with PdByP to define the real price of tradable goods later:
PTdByPd = 1/(((1-gammaD)*(PTdByPN)^(muD-1) + (gammaD))^(1/(1-muD)));         
% Equation 60. The real price of the domestic consumables:
PdByP   = 1/(((1-gammaM) + (gammaM)*(ToT)^(1-muM))^(1/(1-muM)));             
% Equation 61. The real price of the Imported goods:
PTmByP  = 1/(((1-gammaM)*(ToT)^(muM-1) + gammaM)^(1/(1-muM)));  
% Equation 62. The real price of the non-tradables:            
PNByP = PNByPd*PdByP; 
% Equation 63. The real price of the domestic-tradables:            
PTdByP = PTdByPd*PdByP;  
% Equation 64.Domestically produced-consumed goods inflation:                                                    
Pid     = ((1-gammaD)*(piN*PNByPd(-1))^(1-muD) +                             
(gammaD)*(piTd*PTdByPd(-1))^(1-muD))^(1/(1-muD)); 
% Equation 65: The CPI inflation:                           
Pi      = ((1-gammaM)*(Pid*PdByP(-1))^(1-muM) +                              
(gammaM)*(piTm* PTmByP(-1))^(1-muM))^(1/(1-muM));   
                         
%-------------------------------------------------------------------------- 
@#if isPeg == 0
[ name = '66. Monetary Policy']
log(r)  = rhoR*log(r(-1)) + (1-rhoR)*(log(STEADY_STATE(Pi)) - log(pbeta) +   
thetaPi  * (log(Pi)- STEADY_STATE(log(Pi))) +                                    
thetaY  * log((gdp)/STEADY_STATE(gdp)*(gdp)/(gdp(-1)))) + epsM;  
@#else
de = 1 - epsM;
@#endif   
[ name = '67. Fiscal Policy']                                                          
Tax = g -   m + m(-1)/Pi - oT;
%--------------------------------------------------------------------------
% Equation 68. National Account Identity:
gdp = z + nx;
% Equation 69. Definition of the GDP
gdp + gdpOil = PdByP*PNByPd*yN + PTdByP*yTd + ePTxByP*yTx + oT + (1-tau3)*gdpOil;
% Equation 70. Evolution of net foreign assets:
nx + oT = (bF/(rStar *phi))-(de)/Pi*bF(-1);
% Equation 71. Oil GDP:
gdpOil = rer*POByPStar*yO;
% Equation 72. Oil Transfers:
oT = (tau3)*gdpOil;
%--------------------------------------------------------------------------
%   oF(+1) = (rStar(+1)*de(+1)/Pi(+1))*(oF) + (1-tau3)*gdpOil(+1) ;       %  
%--------------------------------------------------------------------------
% variables of interest. Not Defined on the Appendix
gdpT = PTdByP*yTd + ePTxByP*yTx;
gdpN = PdByP*PNByPd*yN;

%--------------------------------------------------------------------------
% Exogenous Processes:
%--------------------------------------------------------------------------
[ name = '73. Shock: Agg. TFP shock:']
log(A)  = rhoA*log(A(-1))                         + epsA;
[ name = '74. Shock: NT TFP shock:']
log(AN) = rhoAN*log(AN(-1))                       + epsAN;
[ name = '75. Shock: Tradable TFP shock:']
log(AT) = rhoAT*log(AT(-1))                       + epsAT;
[ name = '76. Shock: Preference:']
log(varepsilonP)   = rhoP*log(varepsilonP(-1))    + epsP;
[ name = '77. Shock: Labour Supply:']
log(varepsilonH)   = rhoH*log(varepsilonH(-1))    + epsH;
[ name = '78. Shock: Risk Prem.:']
log(varepsilonRP)  = rhoRP*log(varepsilonRP(-1))  + epsRP;
[ name = '79. Shock: Money Demand:']
log(varepsilonMD)  = rhoMD*log(varepsilonMD(-1))  + epsMD;
[ name = '80. Shock: Foreign Demand/Output:']
log(yStar/STEADY_STATE(yStar))   = rhoYStar*log(yStar(-1)/STEADY_STATE(yStar))      + epsYStar;
[ name = '81. Shock: Foreign Inflation:']
log(piStar/STEADY_STATE(piStar)) = rhoPiStar*log(piStar(-1)/STEADY_STATE(piStar))   + epsPiStar;
[ name = '82. Shock: Foreign Nominal Interest Rate:']
log(rStar/STEADY_STATE(rStar))   = rhoRStar*log(rStar(-1)/STEADY_STATE(rStar))      + epsRStar;
[ name = '83. Shock: Government Expenditure Shock:']
log(g/STEADY_STATE(g))           = rhoG*log(g(-1)/STEADY_STATE(g)) + 0.0*log(oT/STEADY_STATE(oT)) + epsG;
[ name = '84. Oil Production:']
log(yO/STEADY_STATE(yO))         = rhoYO*log(yO(-1)/STEADY_STATE(yO))                     + epsYO;
[ name = '85. Oil Price:']
log(POByPStar/STEADY_STATE(POByPStar)) = rhoPO*log(POByPStar(-1)/STEADY_STATE(POByPStar)) + epsPO;
[ name = '86.Shock: Oil Transfer Shock:']
log(tau3/STEADY_STATE(tau3))           = rhoTau3*log(tau3(-1)/STEADY_STATE(tau3))         + epsTO;
[ name = 'Not on the Paper, I am not sure about this']
log(varepsilonI)                       = (epsI);
end;
steady;
check;
%--------------------------------------------------------------------------
shocks;
var epsA;      stderr       0.01;
var epsAT;     stderr       0.01;
var epsAN;     stderr       0.01;
var epsM;      stderr       0.01;
var epsG;      stderr       0.01;
var epsP;      stderr       0.01;
var epsH;      stderr       0.01;
var epsRP;     stderr       0.01;
var epsYStar;  stderr       0.01;
var epsRStar;  stderr       0.01;
var epsPiStar; stderr       0.01;
var epsPsiTm;  stderr       0.01;
var epsPO;     stderr       0.01;
var epsYO;     stderr       0.01;
var epsTO;     stderr       0.01;
var epsMC;     stderr       0.01;
var epsI;      stderr       0.01;
%--------------------------------------------------------------------------


end;

stoch_simul(order=1,  pruning,  irf=20, nograph) ; 

