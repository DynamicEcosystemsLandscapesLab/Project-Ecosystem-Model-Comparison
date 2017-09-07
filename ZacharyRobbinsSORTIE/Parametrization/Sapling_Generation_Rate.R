###############This program determines the rate of saplings entering the PPA model
##############by determining the amount at each time step in the SORTIE-ND NCI based model
##############The first output can be used as a model LUT if you want deterministic sapling 
##############additions, the second if you want mean/SE
##############Z.J.Robbins 2017


###Drives
w.dir<-"G:/HF_1"
setwd(w.dir)

###TreemapinCSV####
Treedata<-read.csv("HF2.csv")####CSV of harvard forest SORTIE-ND simulation
###Variables
Time<<-c(1:250)


#####Determining new saplings per timestep######
####I had problems with looping given ND's Labeling Convention, So Code it just repeated with species
###changed
sapling_matrix<-NULL

 for(t in 1:length(Time)){
  timestep<-t 
  sp<-"PIAB"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..PIAB[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..PIAB[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..PIAB[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..PIAB[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..PIAB[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..PIAB[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..PIAB[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2)
  sapling_matrix<-rbind(sapling_matrix,col) 
  }

for(t in 1:length(Time)){
  timestep<-t 
  sp<-"ACRU"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..ACRU[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..ACRU[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..ACRU[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..ACRU[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..ACRU[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..ACRU[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..ACRU[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2) 
  sapling_matrix<-rbind(sapling_matrix,col) 

             }
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"ACSA"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..ACSA[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..ACSA[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..ACSA[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..ACSA[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..ACSA[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..ACSA[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..ACSA[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2) 
  sapling_matrix<-rbind(sapling_matrix,col) 
  
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"BEAL"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..BEAL[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..BEAL[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..BEAL[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..BEAL[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..BEAL[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..BEAL[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..BEAL[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2) 
  sapling_matrix<-rbind(sapling_matrix,col) 
  
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"BEPA"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..BEPA[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..BEPA[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..BEPA[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..BEPA[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..BEPA[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..BEPA[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..BEPA[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2) 
  sapling_matrix<-rbind(sapling_matrix,col) 
  
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"BELE"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..BELE[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..BELE[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..BELE[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..BELE[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..BELE[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..BELE[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..BELE[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2) 
  sapling_matrix<-rbind(sapling_matrix,col) 
  
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"FAGR"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..FAGR[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..FAGR[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..FAGR[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..FAGR[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..FAGR[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..FAGR[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..FAGR[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2) 
  sapling_matrix<-rbind(sapling_matrix,col) 
  
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"TSCA"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..TSCA[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..TSCA[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..TSCA[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..TSCA[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..TSCA[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..TSCA[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..TSCA[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2) 
  sapling_matrix<-rbind(sapling_matrix,col) 
  
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"FRAM"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..FRAM[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..FRAM[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..FRAM[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..FRAM[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..FRAM[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..FRAM[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..FRAM[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2) 
  sapling_matrix<-rbind(sapling_matrix,col) 
  
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"PIST"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..PIST[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..PIST[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..PIST[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..PIST[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..PIST[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..PIST[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..PIST[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2) 
  sapling_matrix<-rbind(sapling_matrix,col) 
  
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"PRSE"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..PRSE[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..PRSE[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..PRSE[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..PRSE[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..PRSE[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..PRSE[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..PRSE[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2)
  sapling_matrix<-rbind(sapling_matrix,col) 
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"QURU"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..QURU[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..QURU[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..QURU[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..QURU[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..QURU[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..QURU[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..QURU[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2)
  sapling_matrix<-rbind(sapling_matrix,col) 
}
for(t in 1:length(Time)){
  timestep<-t 
  sp<-"PIRE"
  Delta_Saplings<-(Treedata$Sapl.Abs.Den..PIRE[Treedata$Step==(t)])-(Treedata$Sapl.Abs.Den..PIRE[Treedata$Step==(t-1)])
  Saplings_Mort<-Treedata$Natural.Dead.Sapl.Abs.Den..PIRE[Treedata$Step==t]
  Delta_Adults<-(Treedata$Adult.Abs.Den..PIRE[Treedata$Step==(t)])-(Treedata$Adult.Abs.Den..PIRE[Treedata$Step==(t-1)])
  Adult_Mort<-Treedata$Natural.Dead.Adult.Abs.Den..PIRE[Treedata$Step==t+1]
  Seedlings_2_Saplings<-(Delta_Saplings+Saplings_Mort)+(Delta_Adults+Adult_Mort)
  Saplings_per_adult<-(Seedlings_2_Saplings/Treedata$Adult.Abs.Den..PIRE[Treedata$Step==t])
  col<-cbind(timestep,sp,Delta_Saplings,Saplings_Mort,Delta_Adults,Adult_Mort,Seedlings_2_Saplings,S2)
  sapling_matrix<-rbind(sapling_matrix,col) 
}
write.csv(sapling_matrix,sapling_matrix.csv)
#####MEan and SE#############
sapling_matrix<-read.csv("sapling_matrix.csv")
library(plotrix) #Needed for SE
##Spec<-c("ACRU","ACSA","BEAL","BEPA","BELE","FAGR","TSCA","FRAM","PIST","PRSE","QURU","PIRE","PIAB")
saplingstats<-NULL

for(i in Spec){
    Average_saplings<-sapling_matrix$Saplings_per_adult[sapling_matrix$sp==i]
    Average_saplings[is.na(Average_saplings)]<-0
    Average_saplings[is.infinite(Average_saplings)]<-(1/35)
    mean<-mean(Average_saplings)
    STD<-std.error(Average_saplings)
    mean_SE<-cbind(i,mean,STD)
    saplingstats<-rbind(saplingstats,mean_SE)
}
write.csv(saplingstats,"saplingstats.csv") 

