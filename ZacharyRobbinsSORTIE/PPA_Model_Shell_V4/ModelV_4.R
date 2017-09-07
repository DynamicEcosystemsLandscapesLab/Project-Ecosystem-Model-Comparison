
########PPA R Model V4.0######
########Z.J.Robbins 2017######



####Setting up work drives####
w.dir<-("C:/Users/zachary.robbins/Desktop/PPA/PPA_Model_V3_1")
setwd(w.dir)


timesteps<-c(0:200)
###Control Coeffs
###Determines the amount of light the suppressed cohort gets 
###PPAf and SaplingPPAf
PPAf<-.1
SaplingPPAf<-


#####Loop for multiple replicates
replicates<-c(1,2,3)
for(repl in replicates){
  w.dir<-(paste("C:/Users/zachary.robbins/Desktop/PPA/PPA_Model_V3_1/Replicate",repl,"/",sep=""))
  setwd(w.dir)
for(timestep in timesteps){
######Initial map should be PPA_map_0.csv
Startmap<-read.csv(paste("PPA_map_",timestep,".csv",sep=""))
print("sort")
map1<-NULL
map1<-as.data.frame((Startmap[order(Startmap[,"Height"],decreasing = T),]))

###Total CR and assign it in decesnding hiegh
Totalcol<-as.data.frame(cumsum(map1$Crown_Area))
colnames(Totalcol)<-"CCR"
map1<-as.data.frame(cbind(map1,Totalcol))
colnames(map1)<-c("Marker","marker","Type","Species","DBH","Height","Crown_Radius","Crown_Depth","Crown_Area","Basal_Area","CCR")
Startmap<-NULL
Totalcol<-NULL
####LUT##3
Mortality_LUT<-as.data.frame(read.csv("LUTS/Mortality_LUT.csv"))

Growth_LUT<-as.data.frame(read.csv("LUTS/Growth_Scenario_LUT.csv"))

mortmap<-NULL
###Mortality
print("mortality")
Species_list<-c("ACRU","BEAL","BEPA","BELE","FAGR","TSCA","FRAM","PIST","PRSE","QURU","PIRE","PIAB")
Type_list<-c("Sapling","Adult")
for(mslook in Species_list){
  for(mtlook in Type_list){
    current<-subset(map1,map1$Species==mslook&map1$Type==mtlook)
for(mlook in 1:nrow(Mortality_LUT)){
  sp_look<-as.character(Mortality_LUT[mlook,"Species"])
  sp_type<-as.character(Mortality_LUT[mlook,"Type"])
  if((sp_look==mslook)&(sp_type==mtlook)){
    mscore<-NULL
    mscore<-(Mortality_LUT[mlook,"Mortality_Prob"])
   
for(each_tree in 1:nrow(current)){
tree<-(current[each_tree,])
mSpecies<-tree["Species"]
mType<-tree["Type"]
mDBH<-tree$DBH
if(is.na(mDBH)){break}
mCCR<-tree$CCR
mortality<-runif(1, min=0.00, max=1.00)
if(mscore<mortality){
  mort<-cbind(mSpecies,mType,mDBH,mCCR)
  mortmap<-rbind(mort,mortmap)



}
}
}
}
  }
}
mtree<-NULL
mSpecies<-NULL
mType<-NULL
mDBH<-NULL
CCR<-NULL



###Growth#########################
print("growth")
map1<-(mortmap)

colnames(map1)<-c("Species","Type","DBH","CCR")
write.csv(map1,"map1.csv")
map1<-read.csv("map1.csv")
mortmap<-NULL
##for(each_tree in 1:nrow(map1)){
#tree<-as.data.frame(map1[ech_tree,])
map2<-NULL
for(gslook in Species_list){
  for(gtlook in Type_list){
    gcurrent<-subset(map1,map1$Species==gslook&map1$Type==gtlook)
    for(glook in 1:nrow(Growth_LUT)){
      sp_look<-as.character(Growth_LUT[glook,"species"])
      print(sp_look)
       sp_type<-as.character(Growth_LUT[glook,"type"])
      print(sp_type)
      
      ###Looks through Species and Type and Assigns Allometric Values###
      if((sp_look==gslook)&(sp_type==gtlook)){###This can be modified with final text 
        Hcoff<-(Growth_LUT[glook,"Hcoff"])## height Coefficent 
        Allo_CR1<-(Growth_LUT[glook,"Allo_CR1"])##CR1
        Allo_CR2<-(Growth_LUT[glook,"Allo_CR2"])
        Allo_CD<-(Growth_LUT[glook,"Allo_CD"])
        Growth<-(Growth_LUT[glook,"MeanGrowth"])
    
     for(each_tree in 1:nrow(gcurrent)){
  gtree<-(gcurrent[each_tree,])
  gSpecies<-gtree["Species"]
  gType<-gtree["Type"]
  gX<-gtree$X
  gY<-gtree$Y
  gDBH<-gtree$DBH
  CCR<-gtree$CCR
 
      zstar<-350000
     if(gType=="Adult"){
      if(CCR<350000){DBH<-(gDBH+Growth)
      test<-("yes")
      print("yes")
      }
      if(CCR>350000){
       DBH<-(gDBH+(Growth*PPAf))
     test<-("no")
     print("no")
       }
     }
      if(gType=="Sapling"){DBH<-(gDBH+Growth*SaplingPPAf)}
      
      Height<-1.35+(30-1.35)*(1-exp(-(Hcoff*DBH)))
      if(Height>30){Height<-30.000}
      if(DBH>10){gType<-"Adult"}
      else{gType<-"Sapling"}
      Crown_Radius<-(Allo_CR1*(DBH^Allo_CR2))
      Crown_Depth<-(Allo_CD*DBH)
      Crown_Area<-((Crown_Radius^2)*3.14)
      Basal_Area<-(((DBH^2)*.00007854))
      newrow<-cbind(gType,gslook,DBH,Height,Crown_Radius,Crown_Depth,Crown_Area,Basal_Area)
       map2<-rbind(newrow,map2)
      
      }
    }
  
}
  }
}
gcurrent<-NULL
###Newsaplings###
print("saplings")

map1<-NULL
write.csv(map2,"map2.csv")
map2<-NULL
map3<-read.csv("map2.csv")
map2<-as.data.frame(map3)
New_Sapling_LUT<-read.csv("LUTS/Time_sapling_LUT.csv")
colnames(map2)<-c("Number","Type","Species","DBH","Height","Crown_Radius","Crown_Depth","Crown_Area","Basal_Area")
Species_list<-c("ACRU","BEAL","BEPA","BELE","FAGR","TSCA","FRAM","PIST","PRSE","QURU","PIRE","PIAB")

sapmap<-NULL
for(i in Species_list){
  subsp<-(subset(map2,map2$Species==i&map2$Type=="Adult"))
  print(i)
for(slook in 1:nrow(New_Sapling_LUT)){
sp_look<-as.character(New_Sapling_LUT[slook,"Sp"])
Time_look<-as.character(New_Sapling_LUT[slook,"Time"])
if(sp_look==i&Time_look==timestep){
Saplingmean<-(New_Sapling_LUT[slook,"Saplings"])
Treecount<-nrow(subsp)

newsaplings<-Saplingmean
print(newsaplings)
add<-c(0:newsaplings)
Number<-1
Species<-i
Type<-"Sapling"
DBH<-1
Height<-2
Crown_Radius<-.1
Crown_Depth<-.845
Crown_Area<-.0314
Basal_Area<-.00008
newtree<-as.data.frame(cbind(Number,Species,Type,DBH,Height,Crown_Radius,Crown_Depth,Crown_Area,Basal_Area))
for(tree in 1:length(add)){
  marker<-tree
  print(marker)
sapmap<-as.data.frame(rbind(sapmap,newtree))
}
}
}

}
Endmap<-rbind(map2,sapmap)
newtime<-(timestep+1)
write<-paste("PPA_map_",newtime,".csv",sep="")
write.csv(Endmap,write)
Endmap<-NULL
map2<-NULL
map3<-NULL
map4<-NULL
sapmap<-NULL
subsp<-NULL
}
}
