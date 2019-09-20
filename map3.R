#pol map
setwd("E:/1D Mapping explorations")


LogisticMap = function(x=0.4,lambda) 1-lambda*x^2# * abs(x)
MapName ="LogisticMap"
MAP_FUN = LogisticMap
lambdaSeq <- seq(from = 0, by = 1e-3, to = 2)
# detect lb,ub of x
lb=-1
ub=1




sensitivity_1_1Map = function(MAP_FUN,lambdaSeq,xInit=.4,nEsc=2^10,n = 2^9){
  
  l_lambdaSeq <- length(lambdaSeq)
  x_Seq = rep(xInit,l_lambdaSeq)
  
  for(i in 1:nEsc)  for(j in 1:l_lambdaSeq) x_Seq[j] = MAP_FUN(x_Seq[j], lambdaSeq[j])
  
  xResult=matrix(0,n,l_lambdaSeq)
  for(i in 1:n){
    for(j in 1:l_lambdaSeq) x_Seq[j] = MAP_FUN(x_Seq[j], lambdaSeq[j])
    xResult[i,] = x_Seq
  } 
  xResult
}

matplot_xResult = function(xResult,lambdaSeq,
                           deviceName= "png",
                           fileName = "General View.png",width =2400,height =1800,cex=1,
                           save = FALSE,addtitle = FALSE){
  if(isTRUE(save)) eval(parse(text = deviceName))(fileName,width = width,height = height)
  
  matplot(lambdaSeq,t(xResult),xlab = "Lambda",ylab = "x",cex.lab =2,cex.main = 3,pch = 18,col = "black",cex =cex)#
  grid()
  if(!isFALSE(addtitle)) title(addtitle,cex.main = 3)
  if(isTRUE(save)) dev.off()
  
}



report_sens_1_1Map = function(MAP_FUN,MapName,lambdaSeq,lb,ub,xInit=.4){
  
  l = length(lambdaSeq)
  
  xResult = sensitivity_1_1Map(MAP_FUN,xInit = xInit,lambdaSeq)
  matplot_xResult(xResult,lambdaSeq,save =TRUE,addtitle = "Overview")

#Fourier Transform
i =5
dir.create("FFT")
for(i in 1:l){
  png(paste0("FFT/",i,".png"),width =2400,height =1800)
  plot(Re(fft(xResult[,i])),xlab ="f", ylab = "Re(F(f(t)))",cex.main=3,main = paste("Lambda =",i),cex.lab=2,type = "l")
  grid()
  dev.off()
}

# power Spectral
psd_dir = "PSD"
dir.create(psd_dir)
#origionalwd =getwd()
#setwd(paste(origionalwd,psd_dir,sep = '/')
library(psd)
for(i in 1:l){
  try({
    png(paste0("PSD/",i,".png"),width =2400,height =1800)
    pspectrum(xResult[,i],plot=TRUE,cex.text=3)
    dev.off()
  })

}
#setwd(origionalwd)

#library(SeriesXplorer)
#library(ggplot2)



#Cobweb
cob_dir =paste("CobWeb")
dir.create(cob_dir)
message(paste(cob_dir,"created"))
#duplicate l = length(lambdaSeq)
xb = seq(from=lb,to=ub,length.out = 200)

library(ggplot2)
library(SeriesXplorer)
library(ggthemes)
library(RColorBrewer)

xResult = rbind(t(rep(xInit,times = length(lambdaSeq))),sensitivity_1_1Map(MAP_FUN,lambdaSeq,nEsc = 0))
for(i in 1:l) {
  yf = numeric(200)
  for(j in 1:200) yf[j] =  MAP_FUN(xb[j],lambdaSeq[i])
  #  yf = sapply(xb,MAP_FUN,lambda = )
  plotCobWeb(xResult[,i],updateDf = data.frame(xb=xb,yf=yf)) + ggtitle(paste0("Lambda = ",lambdaSeq[i]))#,parseTitle=F)
  ggsave(paste0(cob_dir,'/',i,".png"),width=8,height = 6,dpi = 300)
  message(paste("Working on",i))
}

}

#report_sens_1_1Map(lambdaSeq = lambdaSeq,MAP_FUN = MAP_FUN,ub=ub,lb=lb,MapName=MapName)


