library(av)

l = length(lambdaSeq)
av_encode_video(paste("Cobweb/",1:2001,'.png',sep = ''),"CobWeb.mp4")
av_encode_video(paste("FFT",1:lambdaseq),"FFT.mp4")