
close all
clear

if ~exist("mat", "dir")
    mkdir mat
end


modelFiles = [
    "model-source/world.model"
    "model-source/trends.model"
    "model-source/local.model"
];

m = Model.fromFile( ...
     modelFiles ...
    ... , linear=true ...
    , growth=true ...
    , savePreparsed="model-source/preparsed.model" ...
);

p = struct();
p = calibrate.world(p);
p = calibrate.trends(p);
p = calibrate.local(p);

m = assign(m, p);

m.dl_ex = 1;

m = steady(m, "exogenize", "dl_ex", "endogenize", "ss_dl_cpi");
m = solve(m);

table( ...
    m, ["steadyLevel", "steadyChange", "stationary"] ...
    , round=8 ...
)

save mat/createModel.mat m

