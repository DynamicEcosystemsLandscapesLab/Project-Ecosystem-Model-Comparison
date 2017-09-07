########This script calculates the Mortality rate from a 
########SortieND NCI simulation for a given time length. This will give you
######## a derministic LUT with the first output or a Mean/SE with the second
########Z.J.Robbin 2017




w.dir<-"G:/"
setwd(w.dir)
library(pastecs)
###TreemapinCSV####
Treedata<-read.csv("HFreplicate1.csv")

Time<<-c(1:250)
Spec<-c("ACRU","ACSA","BEAL","BEPA","BELE","FAGR","TSCA","FRAM","PIST","PRSE","QURU","PIRE","PIAB")
LUT_SP<-read.csv("LUT_SP_Codes.csv")

mortality_matrix<-NULL

for(t in 1:length(Time)){
  timestep<-t 
  sp<-"PIAB"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..PIAB[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..PIAB[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..PIAB[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..PIAB[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"ACRU"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..ACRU[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..ACRU[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..ACRU[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..ACRU[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"ASCA"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..ASCA[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..ASCA[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..ASCA[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..ASCA[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"BEAL"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..BEAL[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..BEAL[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..BEAL[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..BEAL[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"BEPA"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..BEPA[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..BEPA[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..BEPA[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..BEPA[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"BELE"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..BELE[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..BELE[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..BELE[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..BELE[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"FAGR"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..FAGR[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..FAGR[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..FAGR[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..FAGR[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"TSCA"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..TSCA[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..TSCA[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..TSCA[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..TSCA[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"FRAM"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..FRAM[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..FRAM[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..FRAM[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..FRAM[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"PIST"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..PIST[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..PIST[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..PIST[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..PIST[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"PRSE"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..PRSE[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..PRSE[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..PRSE[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..PRSE[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"QURU"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..QURU[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..QURU[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..QURU[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..QURU[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}for(t in 1:length(Time)){
  timestep<-t 
  sp<-"PIRE"
  Live_Saplings<-(Treedata$Sapl.Abs.Den..PIRE[Treedata$Step==(t)])
  Dead_Saplings<-(Treedata$Natural.Dead.Sapl.Abs.Den..PIRE[Treedata$Step==(t)])
  Mortality_Saplings<-(Dead_Saplings/Live_Saplings)
  Live_Adults<-(Treedata$Adult.Abs.Den..PIRE[Treedata$Step==(t)])
  Dead_Adults<-(Treedata$Natural.Dead.Adult.Abs.Den..PIRE[Treedata$Step==(t)])
  Mortality_Adults<-(Dead_Adults/Live_Adults)
  col<-cbind(timestep,sp,Live_Saplings,Dead_Saplings,Mortality_Saplings,Live_Adults,Dead_Adults,Mortality_Adults) 
  mortality_matrix<-rbind(mortality_matrix,col)
}

write.csv(mortality_matrix,"mortality_matrix.csv")
mortality_matrix<-read.csv("mortality_matrix.csv")

###SE AND MEAN####
library(plotrix) #Needed for SE
Spec<-c("ACRU","ACSA","BEAL","BEPA","BELE","FAGR","TSCA","FRAM","PIST","PRSE","QURU","PIRE","PIAB")
mortalitystats<-NULL

for(i in Spec){
  saplingAverage_mortalitys<-mortality_matrix$Dead_Saplings[mortality_matrix$sp==i]
  saplingAverage_mortalitys[is.na(saplingAverage_mortalitys)]<-0
  saplingmean<-mean(saplingAverage_mortalitys)
  saplingSTD<-std.error(saplingAverage_mortalitys)
  AdultAverage_mortalitys<-mortality_matrix$Dead_Adults[mortality_matrix$sp==i]
  AdultAverage_mortalitys[is.na(AdultAverage_mortalitys)]<-0
  Adultmean<-mean(AdultAverage_mortalitys)
  AdultSTD<-std.error(AdultAverage_mortalitys)
  
  
  
  
  mean_SE<-cbind(i,saplingmean,saplingSTD,Adultmean,AdultSTD)
  mortalitystats<-rbind(mortalitystats,mean_SE)
}
write.csv(mortalitystats,"mortalitystats.csv") 
writesaplingstats
Treedata$Adult
