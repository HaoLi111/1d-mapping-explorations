#
report_sens_1_1_Map_FFT = function(xResult,lambdaSeq,){
  dir.create("FFT")
  for(i in 1:l){
    png(paste0("FFT/",i,".png"),width =2400,height =1800)
    plot(Re(fft(xResult[,i])),xlab ="f", ylab = "Re(F(f(t)))",cex.main=3,main = paste("Lambda =",lambdaSeq[i]),cex.lab=2,type = "l")
    grid()
    dev.off()
  }
  av::av_encode_video(paste0("FFT/",1:length(lambdaSeq),".png"),"FFT.mp4")
}