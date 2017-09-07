library(ggplot2)
library(RColorBrewer)
library(ggthemes)
pd <- position_dodge(0.1)
Graphing_Stats<-as.data.frame(read.csv("Graphing_Stats.csv"))
graph_name<-paste("AdultDensity",".jpeg", sep="")


######ADULT DENSITY###########
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
## graphing setup

ggplot(Graphing_Stats, aes(x=Time, y=Adult_Density, colour=Model, group=Model )) + 
 ## geom_ribbon(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
  geom_errorbar(aes(ymin=Adult_Density-SE_DA,ymax=Adult_Density+SE_DA),alpha=.3)+
  #geom_polygon(aes(ymin=Adult_Density-SE_DA, ymax=Adult_Density+SE_DA), width=.2, colour="black", position=pd) +
 
  geom_line(aes(linetype=Model),size=2)+
  geom_line(position=pd) +
  geom_point(position=pd, size=3, shape=21, fill="white") + # 21 is filled circle
  xlab("Year") +
  ylab("Adult Density(Trees per HA)") +
  
                 # Use darker colors, lightness=40
  ggtitle("Adult Density") +#+
  ##expand_limits(y=1) +                        # Expand y range
  #scale_y_continuous(breaks=1:2*(.5))+# Set tick every 4
  theme_fivethirtyeight() +
  
  theme(legend.position= c(0.1,0.1),legend.justification = c(0.1, 0.1))+
  #theme(legend.box.just="left")+ 
  # Position legend in bottom right
  theme(plot.title = element_text(color="#666666", face="bold", size=32)) +
  theme(legend.key.size =unit(2, "cm"))+
  theme(legend.text=element_text(size=20))+
  theme(axis.title = element_text(color="#666666", face="bold", size=22)) +
  theme(axis.text.x= element_text(size=21))+
  theme(axis.text.y= element_text(size=21))

dev.off()

###########ADULT BA###############
graph_name<-paste("AdultBA",".jpeg", sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
## graphing setup
ggplot(Graphing_Stats, aes(x=Time, y=Adult_BA, colour=Model, group=Model )) + 
  #geom_polygon(aes(ymin=Adult_BA-SE_DA, ymax=Adult_BA+SE_DA), width=.2, colour="black", position=pd) +
  
  geom_line(aes(linetype=Model),size=2)+
  geom_line(position=pd,) +
  geom_point(position=pd, size=3, shape=21, fill="white") + # 21 is filled circle
  xlab("Year") +
  ylab("Adult BA(Trees per HA)") +
  
  # scale_colour_hue(name="Model",    # Legend label, use darker colors
  #                 breaks=Model,
  #                labels=Model,
  #               l=40) +                    # Use darker colors, lightness=40
  ggtitle("Adult BA") +#+
  ##expand_limits(y=1) +                        # Expand y range
  #scale_y_continuous(breaks=1:2*(.5))+# Set tick every 4
  theme_bw() +
  
  theme(legend.position= c(0.1,0.1),legend.justification = c(0.1, 0.1))+
  #theme(legend.box.just="left")+ 
  # Position legend in bottom right
  theme(plot.title = element_text(color="#666666", face="bold", size=32)) +
  theme(legend.key.size =unit(2, "cm"))+
  theme(legend.text=element_text(size=20))+
  theme(axis.title = element_text(color="#666666", face="bold", size=22)) +
  theme(axis.text.x= element_text(size=21))+
  theme(axis.text.y= element_text(size=21))

dev.off()
########################SAPLING DENSITY###################
graph_name<-paste("SaplingDensity",".jpeg", sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
## graphing setup
ggplot(Graphing_Stats, aes(x=Time, y=Sapling_Density, colour=Model, group=Model )) + 
  geom_errorbar(aes(ymin=Sapling_Density-SE_DA, ymax=Sapling_Density+SE_DA), width=.2, colour="black", position=pd) +
  
  geom_line(aes(linetype=Model),size=2)+
  geom_line(position=pd,) +
  geom_point(position=pd, size=3, shape=21, fill="white") + # 21 is filled circle
  xlab("Year") +
  ylab("Sapling Density(Trees per HA)") +
  
  # scale_colour_hue(name="Model",    # Legend label, use darker colors
  #                 breaks=Model,
  #                labels=Model,
  #               l=40) +                    # Use darker colors, lightness=40
  ggtitle("Sapling Density") +#+
  ##expand_limits(y=1) +                        # Expand y range
  #scale_y_continuous(breaks=1:2*(.5))+# Set tick every 4
  theme_bw() +
  
  theme(legend.position= c(.1,.9),legend.justification = c(.1, .9))+
  #theme(legend.box.just="left")+ 
  # Position legend in bottom right
  theme(plot.title = element_text(color="#666666", face="bold", size=32)) +
  theme(legend.key.size =unit(2, "cm"))+
  theme(legend.text=element_text(size=20))+
  theme(axis.title = element_text(color="#666666", face="bold", size=22)) +
  theme(axis.text.x= element_text(size=21))+
  theme(axis.text.y= element_text(size=21))

dev.off()

##################SAPLING BA#######################
graph_name<-paste("SaplingBA",".jpeg", sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
## graphing setup
ggplot(Graphing_Stats, aes(x=Time, y=Sapling_BA, colour=Model, group=Model )) + 
  #geom_polygon(aes(ymin=Sapling_BA-SE_DA, ymax=Sapling_BA+SE_DA), width=.2, colour="black", position=pd) +
  
  geom_line(aes(linetype=Model),size=2)+
  geom_line(position=pd,) +
  geom_point(position=pd, size=3, shape=21, fill="white") + # 21 is filled circle
  xlab("Year") +
  ylab("Sapling BA(Trees per HA)") +
  
  # scale_colour_hue(name="Model",    # Legend label, use darker colors
  #                 breaks=Model,
  #                labels=Model,
  #               l=40) +                    # Use darker colors, lightness=40
  ggtitle("Sapling BA") +#+
  ##expand_limits(y=1) +                        # Expand y range
  #scale_y_continuous(breaks=1:2*(.5))+# Set tick every 4
  theme_bw() +
  
  theme(legend.position= c(0.1,0.9),legend.justification = c(0.1, 0.9))+
  #theme(legend.box.just="left")+ 
  # Position legend in bottom right
  theme(plot.title = element_text(color="#666666", face="bold", size=32)) +
  theme(legend.key.size =unit(2, "cm"))+
  theme(legend.text=element_text(size=20))+
  theme(axis.title = element_text(color="#666666", face="bold", size=22)) +
  theme(axis.text.x= element_text(size=21))+
  theme(axis.text.y= element_text(size=21))

dev.off()
