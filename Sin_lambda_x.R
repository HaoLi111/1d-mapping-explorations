setwd("E:/1D Mapping explorations")
source("map3.R")


Map = function(x,lambda) sin(lambda*x)
dir.create("Sin_Lambda_x")
setwd("Sin_Lambda_x")
MapName = "Sin_Lambda_x"
lambdaSeq = seq(from=0,to=6.283,by=.001)
system.time({
  report_sens_1_1Map(lambdaSeq = lambdaSeq,MAP_FUN = Map,ub=ub,lb=lb,MapName=MapName)
})
setwd("E:/1D Mapping explorations")