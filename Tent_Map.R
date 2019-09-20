tent_Map = function(x,lambda) 1 - abs(x)*lambda
dir.create("Tent_Map")
setwd("Tent_Map")
system.time({
  report_sens_1_1Map(lambdaSeq = lambdaSeq,MAP_FUN = tent_Map,ub=ub,lb=lb,MapName=MapName)
  
  
})
