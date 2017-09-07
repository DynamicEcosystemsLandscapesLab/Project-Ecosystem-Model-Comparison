
library(pastecs)
library(plotrix)
w.dir<-("C:/Users/jean/Desktop/Graphing_Final")
setwd(w.dir)
timesteps<-c(1:200)
reps<-c(1,2,3)
###Averaging SOTIE PPA Totals


Outputmatrix<-NULL
Model<-"PPA"
for(timestep in timesteps){
  Total_Density_Adult_GRP<-NULL
  Total_Density_Sapling_GRP<-NULL
  Total_BAperHA_Adults_Group<-NULL
  Total_BAperHA_Saplings_Group<-NULL
  for(Repli in reps){

  PPAmap<-read.csv(paste("Sortie_PPA_Outputs/Replicate", Repli,"/PPA_map_",timestep,".csv",sep=""))
  
  TotalBAperHA_Adults<-(sum(PPAmap$Basal_Area[PPAmap$Type=="Adult"])/35)
  TotalBAperHA_Saplings<-(sum(PPAmap$Basal_Area[PPAmap$Type=="Sapling"])/35)
  Adults<-(subset(PPAmap,PPAmap$Type=="Adult"))
  Sapling<-(subset(PPAmap,PPAmap$Type=="Sapling"))
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
row<-cbind(timestep ,Model, Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix<-rbind(Outputmatrix,row)
}
write.csv(Outputmatrix,"PPA_Total_Means.csv")


Outputmatrix2<-NULL
Model<-"Sortie_ND"
for(hftime in timesteps){
  Total_Density_Adult_GRP<-NULL
  Total_Density_Sapling_GRP<-NULL
  Total_BAperHA_Adults_Group<-NULL
  Total_BAperHA_Saplings_Group<-NULL
  
  for (hfrep in reps){
  Treedata<-read.csv(paste("Sortie_ND_Outputs/HFReplicate", hfrep,".csv",sep=""))
  
  timestep<-hftime
  ND_Adult_density<-(Treedata$Adult.Den.Total.[Treedata$Step==(hftime)])
  ND_sapling_density<-(Treedata$Sapl.Den.Total.[Treedata$Step==(hftime)])
  ND_Adult_BA<-(Treedata$Adult.BA.Total.[Treedata$Step==(hftime)])
  ND_sapling_BA<-(Treedata$Sapl.BA.Total.[Treedata$Step==(hftime)])
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
row2<-cbind(timestep, Model,Mean_density_adults,ST_ERR_DA,Mean_density_saplings,ST_ERR_DS,Mean_BA_adults,ST_ERR_BAA,Mean_BA_saplings,ST_ERR_BAS)
Outputmatrix2<-rbind(Outputmatrix2,row2)  
}  


write.csv(Outputmatrix2,"SORTIE_ND_Total_Means.csv")

Graphing_Stats<-NULL
model<-c("SORTIE_ND","PPA")
for(timelook in timesteps){
for (modellook in model){
  Model_Type<-read.csv(paste(modellook,"_Total_Means.csv",sep=""))
Time<-timelook
Model<-modellook
Adult_Density<-Model_Type$Mean_density_adults[Model_Type$timestep==timelook]
SE_DA<-Model_Type$ST_ERR_DA[Model_Type$timestep==timelook]
Sapling_Density<-Model_Type$Mean_density_saplings[Model_Type$timestep==timelook]
SE_DS<-Model_Type$ST_ERR_DS[Model_Type$timestep==timelook] 
Adult_BA<-Model_Type$Mean_BA_adults[Model_Type$timestep==timelook]
SE_BA<-Model_Type$ST_ERR_BAA[Model_Type$timestep==timelook]
Sapling_BA<-Model_Type$Mean_BA_saplings[Model_Type$timestep==timelook]
SE_BS<-Model_Type$ST_ERR_BAS[Model_Type$timestep==timelook]
row2<-cbind(Time,Model,Adult_Density,SE_DA,Sapling_Density,SE_DS,Adult_BA,SE_BA,Sapling_BA,SE_BS)
Graphing_Stats<-rbind(Graphing_Stats,row2)

}
}
write.csv(Graphing_Stats,"Graphing_Stats.csv")




