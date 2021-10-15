%% Create model object


%% Clear workspace

close all
clear

if ~exist("mat", "dir")
    mkdir mat
end


%% Load model files

modelFiles = [
    "model-source/world.model"
    "model-source/trends.model"
    "model-source/local.model"
    "model-source/policy.model"
];

% Use growth=true so that the function steady() knows this is a model in
% which some variables are non-stationary (grow over time in steady state)

m = Model.fromFile(modelFiles, growth=true);
% m = Model.fromFile(modelFiles, growth=true, savePreparsed="model-source/__preparsed.model");


%% Calibrate

p = struct();
p = calibrate.world(p);
p = calibrate.trends(p);
p = calibrate.local(p);
p = calibrate.policy(p);

% p.ss_q1 = p.c1_r_tar;
% p.ss_q2 = p.c2_r_tar;
% p.ss_q3 = p.c3_r_tar;
% p.ss_q4 = p.c1_r;
% p.ss_q5 = p.c1_int;

m = assign(m, p);

%% List currently assigned parameters

access(m, "parameter-values")


%% Calculate steady state and first-order solution

m = steady( ...
    m ...
    , "exogenize", ["dl_ex", "r_ww"] ...
    , "endogenize", ["ss_dl_cpi", "ss_rr_ww"] ...
);

checkSteady(m);

t = table( ...
    m, ["steadyLevel", "steadyChange",  "description"] ...
    , round=8 ...
)


m = alter(m, 2);


m.c1_r_tar = [2.5, 2];
m.c2_r_tar = [0, 1];
m.c3_r_tar = [0, -2];

m.c1_r = [0, 2.5];
m.c1_int = [0, 0*1500+1];

m = steady(m);
checkSteady(m);

m = solve(m);


%% Save to mat file

save mat/createModel.mat m

% printWithValues( ...
%     m, "model-source/local.model" ...
%     , saveAs="model-source/local__.model" ...
%     ... , braces=["#'", "'"] ...
%     , steady=false ...
% );


