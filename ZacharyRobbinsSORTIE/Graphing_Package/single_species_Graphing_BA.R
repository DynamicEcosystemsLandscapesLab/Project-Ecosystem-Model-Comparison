w.dir<-"F:/graphic"
setwd(w.dir)
library(ggplot2)
library(ggthemes)
timeframe<-c(0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200)
datastart<-read.csv("TSCA_stat.csv")
Eastern_Hemlock<-NULL
for(time in timeframe){
row_sp<-subset(datastart,datastart$Time==time)
Eastern_Hemlock<-rbind(Eastern_Hemlock,row_sp)
}
# Draw plot
pd <- position_dodge(7.0)

Eastern_Hemlock<- transform(Eastern_Hemlock, 
                                     model =factor(
                                       Model,
                                       levels=c( 'SORTIE_ND','PPA'),
                                       ordered =TRUE))





graph_name<-paste("Eastern_Hemlock",".jpeg", sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(Eastern_Hemlock,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("Eastern Hemlock Basal Area") +#+
  ##expand_limits(y=1) +                        # Expand y range
  #scale_y_continuous(breaks=1:2*(.5))+# Set tick every 4
  scale_color_fivethirtyeight("Model")+
  theme_fivethirtyeight()+
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


Red_Oak<- transform(Red_Oak, 
                            model =factor(
                              Model,
                              levels=c( 'SORTIE_ND','PPA'),
                              ordered =TRUE))
# Draw plot
pd <- position_dodge(7.0)
cb<-scale_color_brewer
graph_name<-paste("Red_Oak",".jpeg", sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=Red_Oak,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("Red Oak Basal Area") +#+
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
Red_Maple<- transform(Red_Maple, 
                            model =factor(
                              Model,
                              levels=c( 'SORTIE_ND','PPA'),
                              ordered =TRUE))


pd <- position_dodge(7.0)
cb<-scale_color_brewer
graph_name<-paste("Red_Maple",".jpeg", sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=Red_Maple,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("Red Maple Basal Area") +#+
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
White_Pine<- transform(White_Pine, 
                            model =factor(
                              Model,
                              levels=c( 'SORTIE_ND','PPA'),
                              ordered =TRUE))
graph_name<-paste("White_Pine",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=White_Pine,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("White Pine Basal Area") +#+
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


datastart<-read.csv("PRSE_stat.csv")
Black_Cherry<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  Black_Cherry<-rbind(Black_Cherry,row_sp)
}
# Draw plot
Black_Cherry<- transform(Black_Cherry, 
                       model =factor(
                         Model,
                         levels=c( 'SORTIE_ND','PPA'),
                         ordered =TRUE))
graph_name<-paste("Black_Cherry",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=Black_Cherry,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("Black Cherry Basal Area") +#+
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

datastart<-read.csv("PIAB_stat.csv")
Norway_Spruce<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  Norway_Spruce<-rbind(Norway_Spruce,row_sp)
}
# Draw plot
Norway_Spruce<- transform(Norway_Spruce, 
                       model =factor(
                         Model,
                         levels=c( 'SORTIE_ND','PPA'),
                         ordered =TRUE))
graph_name<-paste("Norway_Spruce",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=Norway_Spruce,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("Norway Spruce Basal Area") +#+
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

datastart<-read.csv("FRAM_stat.csv")
American_Ash<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  American_Ash<-rbind(American_Ash,row_sp)
}
# Draw plot
American_Ash<- transform(American_Ash, 
                       model =factor(
                         Model,
                         levels=c( 'SORTIE_ND','PPA'),
                         ordered =TRUE))
graph_name<-paste("American_Ash",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=American_Ash,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("American Ash Basal Area") +#+
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

datastart<-read.csv("FAGR_stat.csv")
Yellow_Beech<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  Yellow_Beech<-rbind(Yellow_Beech,row_sp)
}
# Draw plot
Yellow_Beech<- transform(Yellow_Beech, 
                       model =factor(
                         Model,
                         levels=c( 'SORTIE_ND','PPA'),
                         ordered =TRUE))
graph_name<-paste("Yellow_Beech",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=Yellow_Beech,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("Yellow Beech Basal Area") +#+
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

datastart<-read.csv("BEPA_stat.csv")
Paper_Birch<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  Paper_Birch<-rbind(Paper_Birch,row_sp)
}
# Draw plot
Paper_Birch<- transform(Paper_Birch, 
                       model =factor(
                         Model,
                         levels=c( 'SORTIE_ND','PPA'),
                         ordered =TRUE))
graph_name<-paste("Paper_Birch",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=Paper_Birch,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("Paper Birch Basal Area") +#+
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

datastart<-read.csv("BELE_stat.csv")
Cherry_Birch<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  Cherry_Birch<-rbind(Cherry_Birch,row_sp)
}
# Draw plot
Cherry_Birch<- transform(Cherry_Birch, 
                       model =factor(
                         Model,
                         levels=c( 'SORTIE_ND','PPA'),
                         ordered =TRUE))
graph_name<-paste("Cherry_Birch",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=Cherry_Birch,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("Cherry Birch Basal Area") +#+
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

datastart<-read.csv("PIRE_stat.csv")
Red_Pine<-NULL
for(time in timeframe){
  row_sp<-subset(datastart,datastart$Time==time)
  Red_Pine<-rbind(Red_Pine,row_sp)
}
# Draw plot
Red_Pine<- transform(Red_Pine, 
                         model =factor(
                           Model,
                           levels=c( 'SORTIE_ND','PPA'),
                           ordered =TRUE))
graph_name<-paste("Red_Pine",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(data=Red_Pine,aes(x=Time,y=Adult_BA,fill=model)) + 
  geom_bar(stat="identity",width=7.0,position = pd) +
  xlab("Year") +
  ylab("Adult Basal Area m2 per ha") +
  # Use darker colors, lightness=40
  ggtitle("Red Pine Basal Area") +#+
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

