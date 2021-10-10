dynare ModelTnTOil.mod -DisPeg=0 
close all;
var_list_ = {'gdp';'c';'i';'Pi';'Pid';'piTx';'piN';'gdpN';'gdpT';'piTd';'de'; 'r'};
shock_list_ = {'_epsA', '_epsAT', '_epsAN', '_epsPO', '_epsRP', '_epsPsiTm', '_epsRStar', '_epsPiStar', '_epsM', '_epsP', '_epsMC', '_epsG'};
model_names = {'\gamma_{m,d} = [0.5,0.5]',  '\gamma_{m,d} = [0.6,0.4]'};

colors_ = {'*-k','o-b'};

%--------------------------------------------------------------------------
% Simulate model_1 
%--------------------------------------------------------------------------
% fileID = fopen('regime.mod','w');
% fprintf(fileID,'@# define isPeg = 0');
% fclose(fileID);

%set_param_value('phiB1',.001);
%set_param_value('phiB2', 0.0);
%set_param_value('muX', 1.01);
set_param_value('gammaM', .5);
set_param_value('gammaD', .5);
set_param_value('xiN', .3);

%set_param_value('alphaN', .3);





[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
irfs_model1 = struct();


% Store Irfs 
for i = 1:length(var_list_)
    for j = 1:length(shock_list_)
        genrate_irf_names=['irfs_model1.',var_list_{i},shock_list_{j},'=','oo_.irfs.',var_list_{i},shock_list_{j},';'];
        evalin('base', genrate_irf_names);
    end
end
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% Simulate model_2 
%--------------------------------------------------------------------------
% fileID = fopen('regime.mod','w');
% fprintf(fileID,'@# define isPeg = 0');
% fclose(fileID);


% set_param_value('phiB1',.001);
% set_param_value('phiB2', 0.0);
% set_param_value('muX', 0.5);
set_param_value('gammaM', .5);
set_param_value('gammaD', .9999);
set_param_value('xiN', .3);

% set_param_value('alphaN', .3);



[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
irfs_model2 = struct();


for i = 1:length(var_list_)
    for j = 1:length(shock_list_)
        genrate_irf_names=['irfs_model2.',var_list_{i},shock_list_{j},'=','oo_.irfs.',var_list_{i},shock_list_{j},';'];
        evalin('base', genrate_irf_names);
    end
end
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Plot f out 
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
            'plot(irfs_model' , sprintf('%d', m), '.', var_list_{j}, shock_list_{i},',''', colors_{m},''',''LineWidth'', 1.00)'];
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
saveas(h,sprintf('./images/irfs%s.png',shock_list_{i}));

end
%--------------------------------------------------------------------------


fileID = fopen('regime.mod','w');
fprintf(fileID,'');
fclose(fileID);
