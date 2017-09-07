ANPPdata<-read.csv("TotalANPPSheet.csv")

graph_name<-paste("ANPP",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(ANPPdata, aes(x=Time, y=ANPPperM2)) + 
  geom_line(size=3)  +
  xlab("Year") +
  ylab("gC per meter") +
  # Use darker colors, lightness=40
  
  ggtitle("ANPP per Year") +#+
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




AGBdata<-read.csv("AGBGrand.csv")

graph_name<-paste("AGB",".jpeg",sep="")
jpeg(file=graph_name, bg="white", width = 2100, height = 1050, units = "px", pointsize = 20, res= 100)
ggplot(AGBdata, aes(x=Time, y=Yeartotal)) + 
  geom_point(size=9)  +
  xlab("Year") +
  ylab("Kg/HA") +
  # Use darker colors, lightness=40
  ggtitle("Above ground biomass") +#+
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


