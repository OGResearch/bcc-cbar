close all;
dynare ModelTnTOil -DisPeg=0 noclearall;
var_list_ = {'gdp';'c';'i';'Pi';'piTm';'piTx';'piN';'gdpN';'gdpT';'piTd';'de'; 'r'};
shock_list_ = {'_epsA', '_epsAT', '_epsAN', '_epsPO', '_epsRP', '_epsPsiTm', '_epsRStar', '_epsPiStar', '_epsM', '_epsP', '_epsMC', '_epsG'};
model_names = {'CPI-Inflation Targeting',  'Peg'};

colors_ = {'*-k','o-b'};

%--------------------------------------------------------------------------
% Simulate model_1 :
%--------------------------------------------------------------------------


% You can run different models with different parameters as well:
% set_param_value('alphaN',0.35);

[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
irfs_model1 = struct();


% Store Irfs :
for i = 1:length(var_list_)
    for j = 1:length(shock_list_)
        genrate_irf_names=['irfs_model1.',var_list_{i},shock_list_{j},'=','1*oo_.irfs.',var_list_{i},shock_list_{j},';'];
        evalin('base', genrate_irf_names);
    end
end
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% Simulate model_2 :
%--------------------------------------------------------------------------
dynare ModelTnTOil -DisPeg=1 noclearall;
% Since The new version of the dynare keeps only global variables with
% noclearall option we need to repeat following variables again: 
var_list_ = {'gdp';'c';'i';'Pi';'piTm';'piTx';'piN';'gdpN';'gdpT';'piTd';'de'; 'r'};
shock_list_ = {'_epsA', '_epsAT', '_epsAN', '_epsPO', '_epsRP', '_epsPsiTm', '_epsRStar', '_epsPiStar', '_epsM', '_epsP', '_epsMC', '_epsG'};
model_names = {'CPI-Inflation Targeting',  'Peg'};

colors_ = {'*-k','o-b'};

% You can run different models with different parameters as well:
% set_param_value('alphaN',0.35);

[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
irfs_model2 = struct();

% Store Irfs :

for i = 1:length(var_list_)
    for j = 1:length(shock_list_)
        genrate_irf_names=['irfs_model2.',var_list_{i},shock_list_{j},'=','1*oo_.irfs.',var_list_{i},shock_list_{j},';'];
        evalin('base', genrate_irf_names);
    end
end
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Plot f out :
%--------------------------------------------------------------------------
    for i = 1:length(shock_list_)
    h=figure('Position', [600, 0, 1000, 900]);
    axes ('position', [0, 0, 1, 1]);
    F1=figure(i);
    set(F1, 'numbertitle','off');
    set(F1, 'name', ['Impulse response functions to',shock_list_{i}]);
    for j = 1:length(var_list_)
        for m=1:2
                splot = ['subplot(3,4,', sprintf('%d', j) , '),', ...
                'plot(irfs_model' , sprintf('%d', m), '.', var_list_{j}, shock_list_{i},',''', colors_{m},''',''LineWidth'', 1.1)'];
                evalin('base',splot);
                hold on;
                xlabel('Quarters');
                ylabel('% dev from SS');
                grid on;
                title(var_list_(j,:),'FontSize',10);
                axis tight;                   
        end
    end
    legend(model_names) ;
    saveas(h,sprintf('./mimages/irfs%s.png',shock_list_{i}))
    end
%--------------------------------------------------------------------------



