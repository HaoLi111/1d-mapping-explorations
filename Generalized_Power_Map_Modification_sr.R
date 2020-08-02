# Generalized Map

#

index =1:400
workList = index[81]
#Sys.sleep(3600*5)

source("E:/1D Mapping explorations/map3.R")
#dir.create('E:/1D Mapping explorations/Generalized_Power_Modified')
#setwd('E:/1D Mapping explorations/Generalized_Power_Modified')

#library(parallel)
#cluster = makeCluster(4) 



workFlow= function(x){

   system.time({
    def_function = function(p){
      f = function(x,lambda,p) 1 - lambda * abs(x)^p
      formals(f)$p= p
      return(f)
    }
    
    get_p = function(x){
      x/100
    }    
    print("###################################################")
    print(paste0("working on",x))
    print("###################################################")
    library(compiler)
    enableJIT(3)
    library(grDevices)
    source("E:/1D Mapping explorations/map3.R")
    p = get_p(x)
    map_f = def_function(p)
    sub.dir = paste0('E:/1D Mapping explorations/Generalized_Power_Modified/',x)
    dir.create(sub.dir)
    sub.dir =paste0(sub.dir,'/')
    LogisticMap = function(x=0.4,lambda) 1-lambda*x^2# * abs(x)
    MapName =paste("1 - lambda * x^",p,sep='')
    MAP_FUN = map_f
    lambdaSeq <- seq(from = 0, by = 1e-3, to = 2)
    # detect lb,ub of x
    lb=-1
    ub=1
    report_sens_1_1Map(lambdaSeq = lambdaSeq,MAP_FUN=MAP_FUN,ub=ub,lb=lb,MapName=MapName,
                       sub.dir = sub.dir)
    print("work finished")
   })[3]
}
sapply(workList,workFlow)
##print(Timing)

# elapsed  elapsed  elapsed  elapsed  elapsed 
#66035.42 65487.53 66053.09 65523.65 66080.95 
#elapsed  elapsed  elapsed 
#65547.78 65553.78 66082.64 


#elapsed  elapsed  elapsed  elapsed  elapsed 
#65213.11 64950.12 64939.64 65187.93 65180.81 
#elapsed  elapsed  elapsed 
#64874.16 64849.93 65152.11 
#elapsed  elapsed  elapsed  elapsed  elapsed 
#64126.76 64125.15 64366.04 64375.36 64124.64 
#elapsed  elapsed  elapsed 
#64105.88 64357.33 64348.35 
#
#elapsed  elapsed  elapsed  elapsed  elapsed 
#66757.14 66761.47 68034.75 68039.84 66712.34 
#elapsed  elapsed  elapsed 
#66715.01 67992.80 68042.70 
#
#
#