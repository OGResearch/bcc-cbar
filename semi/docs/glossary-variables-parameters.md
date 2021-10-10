# Glossary of model variables


## World economy module

Variable name | Docs | Description | S/S level | S/S Y/Y
---|---|---|---:|---:
`l_gdp_ww`|$y^\mathrm{ww}$|Foreign demand|$0.00$|$-$
`l_gdp_ww_tnd`|$y^\mathrm{ww, tnd}$|Foreign demand trend|$0.00$|$-$
`l_gdp_ww_gap`|$y^\mathrm{ww, tnd}$|Foreign demand gap|$0.00$|$-$
`r_ww`|$r^\mathrm{ww}$|Foreign short-term rate, FCY|$2.00$|$-$
`rr_ww`|$rr^\mathrm{ww}$|Foreign real short-term rate, FCY|$0.00$|$-$
`l_cpi_ww`|$p^\mathrm{ww}$|Foreign CPI|$-$|$2.00$
`dl_cpi_ww`|$\Delta p^\mathrm{ww}$|Foreign CPI, Q/Q PA|$2.00$|$-$
`d4l_cpi_ww`|$\Delta_4 p^\mathrm{ww}$|Foreign CPI, Y/Y|$2.00$|$-$

## Long-term trends module

Variable name | Docs | Description | S/S level | S/S Y/Y
---|---|---|---:|---:
`l_gdp_tnd`|$y^\mathrm{tnd}$|GDP trend|$-$|$3.00$
`dl_gdp_tnd`|$\Delta y^\mathrm{tnd}$|GDP trend, Q/Q PA|$3.00$|$-$
`l_rex_tnd`|$rex^\mathrm{tnd}$|Real exchange rate trend|$-$|$-1.00$
`dl_rex_tnd`|$\Delta rex^\mathrm{tnd}$|Real exchange rate trend|$-1.00$|$-$
`rr_tnd`|$rr^\mathrm{tnd}$|Real short-term rate trend|$3.00$|$-$
`r_tnd`|$r^\mathrm{tnd}$|Short-term cash rate trend|$7.00$|$-$
`prem_tnd`|$prem^\mathrm{tnd}$|Interest disparity trend|$4.00$|$-$
`rr_ww_tnd`|$rr^\mathrm{ww,tnd}$|Foreign real short-term rate, FCY|$0.00$|$-$

## Local economy module

Variable name | Docs | Description | S/S level | S/S Y/Y
---|---|---|---:|---:
`l_gdp`|$y$|Real GDP|$-$|$3.00$
`l_ngdp`|$ny$|Nominal GDP|$-$|$7.00$
`l_pgdp`|$py$|GDP deflator|$-$|$4.00$
`dl_gdp`|$\Delta y$|Real GDP, Q/Q PA|$3.00$|$-$
`d4l_gdp`|$\Delta_4 y$|Real GDP, Y/Y|$3.00$|$-$
`dl_ngdp`|$\Delta ny$|Nominal GDP, Q/Q PA|$7.00$|$-$
`dl_pgdp`|$\Delta py$|GDP deflator, Q/Q PA|$4.00$|$-$
`l_gdp_gap`|$y^\mathrm{gap}$|GDP gap|$0.00$|$-$
`l_gdp_fws`|$y^\mathrm{fws}$|Discounted future income|$-$|$3.00$
`l_cpi`|$p$|CPI|$-$|$4.00$
`dl_cpi`|$\Delta p$|CPI, Q/Q PA|$4.00$|$-$
`d4l_cpi`|$\Delta_4 p$|CPI, Y/Y|$4.00$|$-$
`dl_cpi_ste`|$\Delta p^\mathrm{ste}$|Short-term inflation expectations|$4.00$|$-$
`r`|$r$|Short-term rate|$7.00$|$-$
`r_tar`|$r^\mathrm{tar}$|Short-term rate target|$7.00$|$-$
`rr`|$rr$|Real short-term rate|$3.00$|$-$
`rr_gap`|$rr^\mathrm{gap}$|Real short-term rate gap|$0.00$|$-$
`int`|$int$|Forex interventions in premium equivalent|$0.00$|$-$
`l_ex`|$ex$|Nominal exchange rate|$-$|$1.00$
`dl_ex`|$\Delta ex$|Nominal exchange rate, Q/Q PA|$1.00$|$-$
`l_ex_ste`|$ex^\mathrm{ste}$|Short-term nominal exchange rate expectations|$-$|$1.00$
`dl_ex_gap`|$\Delta ex^\mathrm{gap}$|Nominal exchange rate depreciation gap|$0.00$|$-$
`l_ex_tar`|$ex^\mathrm{tar}$|Nominal exchange rate target|$-$|$1.00$
`l_rex`|$rex$|Real exchange rate|$-$|$-1.00$
`dl_rex`|$\Delta rex$|Real exchange rate, Q/Q PA|$-1.00$|$-$
`l_rex_gap`|$rex^\mathrm{gap}$|Real exchange rate gap|$0.00$|$-$
`dl_rex_gap`|$\Delta rex^\mathrm{gap}$|Real exchange rate gap, Q/Q PA|$0.00$|$-$
`prem`|$prem$|Interest disparity|$4.00$|$-$
`prem_gap`|$prem^\mathrm{gap}$|Interest disparity gap|$0.00$|$-$
`rlc`|$rlc$|New lending conditions in lending spread equivalent|$0.00$|$-$
# Glossary of model parameters


## World economy module

Parameter name | Description | Value
---|---|---:
`ss_rr_ww`|S/S Foreign real short-term rate, FCY|$0.00$
`ss_dl_cpi_ww`|S/S Foreign CPI, Q/Q PA|$2.00$
`c0_l_gdp_ww_gap`|Autoregression in foreign demand gap|$0.80$
`c0_r_ww`|Autoregression in foreign short-term rate|$0.80$
`c0_dl_cpi_ww`|Autoregression in foreign CPI inflation|$0.80$
`c1_rr_ww`|Weight on model-consistent expectations in foreign inflation|$0.50$

## Long-term trends module

Parameter name | Description | Value
---|---|---:
`ss_dl_gdp`|S/S Real GDP, Q/Q PA|$3.00$
`ss_dl_cpi`|S/S CPI, Q/Q PA|$4.00$
`ss_rr`|S/S Real short-term rate|$3.00$
`ss_dl_rex`|S/S Real exchange rate, Q/Q PA|$-1.00$
`c0_dl_gdp_tnd`|Autoregression in real GDP trend|$0.95$
`c1_dl_gdp_tnd`|Hysteresis in real GDP trend|$0.00$
`c0_rr_tnd`|Autoregression in real short-term rate trend|$0.95$
`c0_dl_rex_tnd`|Autoregression in real exchange rate trend|$0.95$
`c1_dl_rex_tnd`|Response in real exchange rate trend to real exchange rate gap|$0.00$
`c0_rr_ww_tnd`|Autoregression in real foreign short-term rate|$0.95$

## Local economy module

Parameter name | Description | Value
---|---|---:
`c0_l_gdp_gap`|Autoregression in GDP gap|$0.70$
`c1_l_gdp_gap`|Response in GDP gap to future income proxy|$0.05$
`c2_l_gdp_gap`|Response i nGDP gap to real short-term rate|$0.07$
`c3_l_gdp_gap`|Response in GDP gap to lending conditions|$0.15$
`c4_l_gdp_gap`|Response in GDP gap to real exchange rate gap|$0.05$
`c5_l_gdp_gap`|Response in GDP gap to foreign demand|$0.20$
`c0_dl_pgdp`|Autoregression in GDP deflator|$0.50$
`c1_l_gdp_fws`|Discount factor in discounted future income|$0.90$
`c0_dl_cpi`|Autoregression in CPI inflation|$0.65$
`c1_dl_cpi`|Response in CPI inflation to GDP gap|$0.07$
`c2_dl_cpi`|Response in CPI inflation to RER gap|$0.02$
`c3_dl_cpi`|Response in CPI inflation to RER gap change|$0.02$
`c4_dl_cpi`|Persistence of response in CPI inflation to RER gap change|$0.50$
`c1_dl_cpi_ste`|Weight on model-consistent expectations in inflation expectations|$0.60$
`c0_r_tar`|Autoregression in short-term rate target|$0.70$
`c1_r_tar`|Response in short-term rate target to inflation|$2.50$
`c2_r_tar`|Response in short-term rate target o GDP gap|$0.00$
`c3_r_tar`|Response in short-term rate target to FX gap|$0.00$
`c1_r`|Weight on exchange rate targeting through short-term rate|$0.00$
`c1_int`|Weight on exchange rate targeting through forex interventions|$0.00$
`c1_l_ex_ste`|Weight on model-consistent expectations in exchange rate expectations|$0.60$
`c1_prem`|Response in interest disparity to lending conditions|$0.50$
`c0_prem_gap`|Autoregression in autonomous cyclical component in interest disparity|$0.80$