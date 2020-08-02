source("E:/1D Mapping explorations/map3.R")


Modified_Cos_Map = function(x,lambda) 1 -lambda * (1-cos(x*pi/2))
dir.create("Modified_Cos_Map")
setwd("Modified_Cos_Map")
system.time({
  report_sens_1_1Map(lambdaSeq = lambdaSeq,MAP_FUN = Modified_Cos_Map,ub=ub,lb=lb,MapName="Modified_Cos_Map")
})
# 1644.12 28072.98 30677.31 
# 1330.74 28913.78 36198.89 