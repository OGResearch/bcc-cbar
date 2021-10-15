
close all
clear


d1q = databank.fromCSV("data-files/cQuarterly_sa.csv");

d2m = databank.fromCSV( ...
    "data-files/interest_rates.csv" ...
    , dateFormat="dd/mm/yyyy" ...
    , enforceFrequency=Frequency.Monthly ...
);


d2q = databank.apply(d2m, @(x) convert(x, Frequency.Quarterly));

d3m = databank.fromFred("TB3MS -> r_us");


d3q = databank.apply(d3m, @(x) convert(x, Frequency.Quarterly));


dq = databank.merge("error", d1q, d2q, d3q);

save mat/readData.mat dq
databank.toCSV(dq, "data-files/quarterly-databank.csv");
