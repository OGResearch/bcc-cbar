1. Model Dynare File
  ModelTnTOil.mod
Tested for Dynare version  4.6.2 :  
Instruction: "dynare ModelTnTOil.mod  - DisPeg = 0" for the flexible inflation Trageting 
2. ModelTnTOil_steadystate.m: Computes the steady state
3. funs_ss_Helpter: Helps to numerically find the steady state. (When there is a heterogeneity across sectors we will get the price level differential between them. Taking this ratio as a guess, 2 and 3 solves the rest analytically)
4. regime.mod If you want to set up the regime inside the mod file, instead of calling the dynare with options
5. compModels.m: Compares Irfs between different version (regimes) of the model. Need one copy of the mod file when w use dynare's switch. 
6. simHere.m: Lighter version of the above. Comp the model with different parameters. Does not need to re-run the mod file
7. generateTex Generates the tex file, collecting irf figures from the folder, specified inside the program. 
8. sensitivity.pdf compares irfs for different parameters under the peg. High/Low Import and Tradable shares
9. Short Paper,pdf Short description of the model
10. Appendix.pdf: Derivations
11. FlexibleVsPeg. Compares 2 regimes



Best,
Elchin 