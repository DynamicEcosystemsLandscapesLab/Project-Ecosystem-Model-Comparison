library(ggplot2)
library(ggthemes)
timeframe<-c(10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200)
datastart<-read.csv("TSCA_stat.csv")
Eastern_Hemlock<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  Eastern_Hemlock<-rbind(Eastern_Hemlock,row_sp)
}
# Draw plot
pd <- position_dodge(7.0)






graph_name<-paste("Eastern_Hemlock",".jpeg", sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(Eastern_Hemlock, aes(x=Time, y=Adult_Density, colour=factor(Model))) + 
  ## geom_ribbon(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
  ##geom_errorbar(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
  #geom_polygon(aes(ymin=Adult_Density-SE_DA, ymax=Adult_Density+SE_DA), width=.2, colour="black", position=pd) +
  geom_errorbar(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.9,width=1.5)+
geom_point(size=12)  +
  xlab("Year") +
  ylab("Stems per HA") +
  # Use darker colors, lightness=40
  ggtitle("Eastern Hemlock Density") +#+
  ##expand_limits(y=1) +                        # Expand y range
  #scale_y_continuous(breaks=1:2*(.5))+# Set tick every 4
  scale_color_fivethirtyeight("Model")+
  theme_fivethirtyeight() + 
  theme(legend.position= c(0.9,0.9),legend.justification = c(0.9, 0.9))+
  #theme(legend.box.just="left")+ 
  # Position legend in bottom right
  theme(plot.title = element_text(color="#666666", face="bold", size=40)) +
  theme(legend.key.size =unit(2, "cm"))+
  theme(legend.text=element_text(size=30))+
  theme(legend.title =element_text(size=30))+
  theme(axis.title = element_text(color="#666666", face="bold", size=32)) +
  theme(axis.text.x= element_text(size=31))+
  theme(axis.text.y= element_text(size=31))

dev.off()

datastart<-read.csv("QURU_stat.csv")
Red_Oak<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  Red_Oak<-rbind(Red_Oak,row_sp)
}
# Draw plot
pd <- position_dodge(7.0)
cb<-scale_color_brewer
graph_name<-paste("Red_Oak_line",".jpeg", sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(Red_Oak, aes(x=Time, y=Adult_Density, colour=factor(Model))) + 
         ## geom_ribbon(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
         ##geoggplot(Eastern_Hemlock, aes(x=Time, y=Adult_Density, colour=factor(Model))) + 
         ## geom_ribbon(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
         ##geom_errorbar(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
         #geom_polygon(aes(ymin=Adult_Density-SE_DA, ymax=Adult_Density+SE_DA), width=.2, colour="black", position=pd) +
         geom_errorbar(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.9,width=1.5)+
         geom_point(size=12)  +
         xlab("Year") +
         ylab("Stems per HA") +
         # Use darker colors, lightness=40
         ggtitle("Red Oak Density")+
         
     
  ## geom_ribbon(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
  ##expand_limits(y=1) +                        # Expand y range
  #scale_y_continuous(breaks=1:2*(.5))+# Set tick every 4
  scale_color_fivethirtyeight("Model")+
  theme_fivethirtyeight() + 
  theme(legend.position= c(0.9,0.9),legend.justification = c(0.9, 0.9))+
  #theme(legend.box.just="left")+ 
  # Position legend in bottom right
  theme(plot.title = element_text(color="#666666", face="bold", size=40)) +
  theme(legend.key.size =unit(2, "cm"))+
  theme(legend.text=element_text(size=30))+
  theme(legend.title =element_text(size=30))+
  theme(axis.title = element_text(color="#666666", face="bold", size=32)) +
  theme(axis.text.x= element_text(size=31))+
  theme(axis.text.y= element_text(size=31))

dev.off()

datastart<-read.csv("ACRU_stat.csv")
Red_Maple<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  Red_Maple<-rbind(Red_Maple,row_sp)
}
# Draw plot
pd <- position_dodge(7.0)
cb<-scale_color_brewer
graph_name<-paste("Red_Maple_line",".jpeg", sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(Red_Maple, aes(x=Time, y=Adult_Density, colour=factor(Model))) + 
  ## geom_ribbon(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
  ##geom_errorbar(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
  #geom_polygon(aes(ymin=Adult_Density-SE_DA, ymax=Adult_Density+SE_DA), width=.2, colour="black", position=pd) +
  geom_errorbar(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.9,width=1.5)+
  geom_point(size=12)  +
  xlab("Year") +
  ylab("Stems per HA") +
  # Use darker colors, lightness=40
  ggtitle("Red Maple Density") +#+
  ##expand_limits(y=1) +                        # Expand y range
  #scale_y_continuous(breaks=1:2*(.5))+# Set tick every 4
  scale_color_fivethirtyeight("Model")+
  theme_fivethirtyeight() + 
  theme(legend.position= c(0.1,0.1),legend.justification = c(0.1, 0.1))+
  #theme(legend.box.just="left")+ 
  # Position legend in bottom right
  theme(plot.title = element_text(color="#666666", face="bold", size=40)) +
  theme(legend.key.size =unit(2, "cm"))+
  theme(legend.text=element_text(size=30))+
  theme(legend.title =element_text(size=30))+
  theme(axis.title = element_text(color="#666666", face="bold", size=32)) +
  theme(axis.text.x= element_text(size=31))+
  theme(axis.text.y= element_text(size=31))

dev.off()


datastart<-read.csv("PIST_stat.csv")
White_Pine<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  White_Pine<-rbind(White_Pine,row_sp)
}
# Draw plot

graph_name<-paste("White_Pine_line",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(Eastern_Hemlock, aes(x=Time, y=Adult_Density, colour=factor(Model))) + 
  ## geom_ribbon(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
  ##geom_errorbar(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
  #geom_polygon(aes(ymin=Adult_Density-SE_DA, ymax=Adult_Density+SE_DA), width=.2, colour="black", position=pd) +
  geom_errorbar(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.9,width=1.5)+
  geom_point(size=12)  +
  xlab("Year") +
  ylab("Stems per HA") +
  # Use darker colors, lightness=40
 
  ggtitle("White Pine Density") +#+
  ##expand_limits(y=1) +                        # Expand y range
  #scale_y_continuous(breaks=1:2*(.5))+# Set tick every 4
  scale_color_fivethirtyeight("Model")+
  theme_fivethirtyeight() + 
  theme(legend.position= c(0.9,0.9),legend.justification = c(0.9, 0.9))+
  #theme(legend.box.just="left")+ 
  # Position legend in bottom right
  theme(plot.title = element_text(color="#666666", face="bold", size=40)) +
  theme(legend.key.size =unit(2, "cm"))+
  theme(legend.text=element_text(size=30))+
  theme(legend.title =element_text(size=30))+
  theme(axis.title = element_text(color="#666666", face="bold", size=32)) +
  theme(axis.text.x= element_text(size=31))+
  theme(axis.text.y= element_text(size=31))

dev.off()

