

library(pastecs)
library(plotrix)

w.dir<-("C:/Users/zachary.robbins/Desktop/8_25homegrapher")
setwd(w.dir)
timesteps<-c(0:200)
reps<-c(1,2,3)
###Averaging SOTIE PPA Totals



Outputmatrix<-NULL
Model<-"PPA"
Species_list<-c("ACRU","BEPA","BEAL","BELE","FAGR","TSCA","FRAM","PIST","PRSE","QURU","PIRE","PIAB")
for(timestep in timesteps){
for(spec in Species_list){  
  Total_Density_Adult_GRP<-NULL
  Total_Density_Sapling_GRP<-NULL
  Total_BAperHA_Adults_Group<-NULL
  Total_BAperHA_Saplings_Group<-NULL
  for(Repli in reps){

  PPAmap<-read.csv(paste("Sortie_PPA_Outputs/Replicate", Repli,"/PPA_map_",timestep,".csv",sep=""))

  TotalBAperHA_Adults<-(sum(PPAmap$Basal_Area[PPAmap$Type=="Adult"&PPAmap$Species==spec])/35)
  TotalBAperHA_Saplings<-(sum(PPAmap$Basal_Area[PPAmap$Type=="Sapling"&PPAmap$Species==spec])/35)
  Adults<-(subset(PPAmap,PPAmap$Type=="Adult"&PPAmap$Species==spec))
  Sapling<-(subset(PPAmap,PPAmap$Type=="Sapling"&PPAmap$Species==spec))
  TotalDensity_Adults<-(nrow(Adults)/35)
  TotalDensity_Saplings<-(nrow(Sapling)/35)
  Total_Density_Adult_GRP<-c(TotalDensity_Adults,Total_Density_Adult_GRP)
  Total_Density_Sapling_GRP<-c(TotalDensity_Saplings,Total_Density_Sapling_GRP)
  Total_BAperHA_Adults_Group<-c(TotalBAperHA_Adults,Total_BAperHA_Adults_Group)
  Total_BAperHA_Saplings_Group<-c(TotalBAperHA_Saplings,Total_BAperHA_Saplings_Group)
  }
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row<-cbind(timestep ,Model, spec, Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix<-rbind(Outputmatrix,row)
}
}
 write.csv(Outputmatrix,"PPA_Spec.csv")


Outputmatrix2<-NULL
Model<-"Sortie_ND"
for(hftime in timesteps){
  Total_Density_Adult_GRP<-NULL
  Total_Density_Sapling_GRP<-NULL
  Total_BAperHA_Adults_Group<-NULL
  Total_BAperHA_Saplings_Group<-NULL

  for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
  spec<-"ACRU"
  timestep<-hftime  
  ND_Adult_density<-(Treedata$Adult.Abs.Den..ACRU[Treedata$Step==(hftime)])
  ND_sapling_density<-(Treedata$Sapl.Abs.Den..ACRU[Treedata$Step==(hftime)])
  ND_Adult_BA<-(Treedata$Adult.Abs.BA..ACRU[Treedata$Step==(hftime)])
  ND_sapling_BA<-(Treedata$Sapl.Abs.BA..ACRU[Treedata$Step==(hftime)])
  Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
  Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
  Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
  Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
  }
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL


for (hfrep in reps){
Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
spec<-"BEAL"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..BEAL[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..BEAL[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..BEAL[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..BEAL[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL

for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
  spec<-"BEPA"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..BEPA[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..BEPA[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..BEPA[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..BEPA[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL



for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))

  spec<-"BELE"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..BELE[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..BELE[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..BELE[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..BELE[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL


for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
  spec<-"FAGR"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..FAGR[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..FAGR[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..FAGR[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..FAGR[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL

for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
  spec<-"TSCA"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..TSCA[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..TSCA[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..TSCA[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..TSCA[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL
for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
  spec<-"FRAM"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..FRAM[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..FRAM[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..FRAM[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..FRAM[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL

for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))

  spec<-"PIST"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..PIST[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..PIST[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..PIST[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..PIST[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL


for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
  spec<-"PRSE"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..PRSE[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..PRSE[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..PRSE[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..PRSE[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL

for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
  spec<-"QURU"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..QURU[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..QURU[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..QURU[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..QURU[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)
Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL



for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
  spec<-"PIRE"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..PIRE[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..PIRE[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..PIRE[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..PIRE[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)


Total_Density_Adult_GRP<-NULL
Total_Density_Sapling_GRP<-NULL
Total_BAperHA_Adults_Group<-NULL
Total_BAperHA_Saplings_Group<-NULL

for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
spec<-"PIAB"
timestep<-hftime
ND_Adult_density<-(Treedata$Adult.Abs.Den..PIAB[Treedata$Step==(hftime)])
ND_sapling_density<-(Treedata$Sapl.Abs.Den..PIAB[Treedata$Step==(hftime)])
ND_Adult_BA<-(Treedata$Adult.Abs.BA..PIAB[Treedata$Step==(hftime)])
ND_sapling_BA<-(Treedata$Sapl.Abs.BA..PIAB[Treedata$Step==(hftime)])
Total_Density_Adult_GRP<-c(ND_Adult_density,Total_Density_Adult_GRP)
Total_Density_Sapling_GRP<-c(ND_sapling_density,Total_Density_Sapling_GRP)
Total_BAperHA_Adults_Group<-c(ND_Adult_BA,Total_BAperHA_Adults_Group)
Total_BAperHA_Saplings_Group<-c(ND_sapling_BA,Total_BAperHA_Saplings_Group)
}
Mean_density_adults<-mean(Total_Density_Adult_GRP)
ST_ERR_DA<-std.error(Total_Density_Adult_GRP)
Mean_density_saplings<-mean(Total_Density_Sapling_GRP)
ST_ERR_DS<-std.error(Total_Density_Sapling_GRP)
Mean_BA_adults<-mean(Total_BAperHA_Adults_Group)
ST_ERR_BAA<-std.error(Total_BAperHA_Adults_Group)
Mean_BA_saplings<-mean(Total_BAperHA_Saplings_Group)
ST_ERR_BAS<-std.error(Total_BAperHA_Saplings_Group)
row2<-cbind(timestep,spec,Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)



}  


write.csv(Outputmatrix2,"SORTIE_ND_Spec.csv")

Graphing_Stats<-NULL
model<-c("SORTIE_ND","PPA")


for(timelook in timesteps){
for(sp in Species_list){
  for (modellook in model){

Model_Type<-read.csv(paste(modellook,"_Spec.csv",sep=""))
Time<-timelook
Model<-modellook
Species<-sp
Adult_Density<-Model_Type$Mean_density_adults[Model_Type$timestep==timelook&Model_Type$spec==sp]
SE_DA<-Model_Type$ST_ERR_DA[Model_Type$timestep==timelook&Model_Type$spec==sp]
Sapling_Density<-Model_Type$Mean_density_saplings[Model_Type$timestep==timelook&Model_Type$spec==sp]
SE_DS<-Model_Type$ST_ERR_DS[Model_Type$timestep==timelook&Model_Type$spec==sp] 
Adult_BA<-Model_Type$Mean_BA_adults[Model_Type$timestep==timelook&Model_Type$spec==sp]
SE_BA<-Model_Type$ST_ERR_BAA[Model_Type$timestep==timelook&Model_Type$spec==sp]
Sapling_BA<-Model_Type$Mean_BA_saplings[Model_Type$timestep==timelook&Model_Type$spec==sp]
SE_BS<-Model_Type$ST_ERR_BAS[Model_Type$timestep==timelook&Model_Type$spec==sp]
row2<-cbind(Time,Species,Model,Adult_Density,SE_DA,Sapling_Density,SE_DS,Adult_BA,SE_BA,Sapling_BA,SE_BS)
Graphing_Stats<-rbind(Graphing_Stats,row2)
}
}
}

Graphing_Stats<-as.data.frame(Graphing_Stats)
for(sp in Species_list){
  a<-sp
Sp_specific<-subset(Graphing_Stats,Graphing_Stats$Species==sp)
name<-paste(sp,"_stat.csv",sep="")
                    
write.csv(Sp_specific,name)
}






