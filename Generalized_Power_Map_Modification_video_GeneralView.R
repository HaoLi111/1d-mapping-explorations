setwd('G:/1/')

seq_GeneralView = paste0(1:400,"/General View.png")
require("av")
av_encode_video(seq_GeneralView,"GeneralView.mp4")
dir.create("FFT View")
for(i in seq(from = 10,to =400, by=10)){
  av_encode_video(paste0(i,"/FFT/",1:2001,".png"),paste0("FFT View/",i,".mp4"))
}

dir.create("CobWeb View")
for(i in seq(from = 10,to =400, by=10)){
  av_encode_video(paste0(i,"/CobWeb/",1:2001,".png"),paste0("CobWeb View/",i,".mp4"))
}

dir.create("CobWeb by Lambda")
for(i in seq(from = 0, to=2000,by=100)),i+1,".png"),paste0("CobWeb by Lambda/",i,".mp4"))
}