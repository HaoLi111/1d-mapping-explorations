setwd("E:/1D Mapping explorations")
source("map3.R")


Map = function(x,lambda) cos(lambda*x)
dir.create("Cos_Lambda_x")
setwd("Cos_Lambda_x")
MapName = "Cos_Lambda_x"
lambdaSeq = seq(from=0,to=6.283,by=.001)
system.time({
  report_sens_1_1Map(lambdaSeq = lambdaSeq,MAP_FUN = Map,ub=ub,lb=lb,MapName=MapName)
})
setwd("E:/1D Mapping explorations")