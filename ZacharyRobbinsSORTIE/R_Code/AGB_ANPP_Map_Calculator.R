
w.dir<-("C:/Users/zachary.robbins/Desktop/8_25homegrapher")
setwd(w.dir)
Jenkins_LUT<-read.csv("Jenkins_LUT.csv")
Time<-(0:200)


AGB_sp_sheet<-NULL
AGB_total_sheet<-NULL
for(time in Time){
Treemap<-as.data.frame(read.csv(paste("Sortie_PPA_Outputs/Replicate1/PPA_map_",time,".csv",sep="")))
print(time)
Species_list<-c("ACRU","BEAL","BEPA","BELE","FAGR","TSCA","FRAM","PIST","PRSE","QURU","PIRE","PIAB")

sp_biomass<-NULL
sp_total_biomass<-NULL

for(i in Species_list){
  sp_biomass<-NULL
  subsp<-(subset(Treemap,Treemap$Species==i))
  print(i)
  for(slook in 1:nrow(Jenkins_LUT)){
    sp_look<-as.character(Jenkins_LUT[slook,"Sp"])
    data_look<-as.character(Jenkins_LUT[slook,"Formula"])
    if(sp_look==i&data_look=="AGB"){
      A<-(Jenkins_LUT[slook,"A"])
      B<-(Jenkins_LUT[slook,"B"])
      C<-(Jenkins_LUT[slook,"C"])
      D<-(Jenkins_LUT[slook,"D"])
     for(tree in 1:nrow(subsp)){
  gtree<-(subsp[tree,])
  DBH<-gtree$DBH
  biomass<-as.numeric(exp(A+B*DBH+C*(log(DBH^D))))###kg##
  row<-cbind(i,biomass)
  sp_biomass<-rbind(sp_biomass,row)
    }
    }
  }
list<-as.data.frame(sp_biomass)
factor<-as.numeric(list$biomass)
total_biomass<-(sum(factor)/35)####kg/ha###

row2<-cbind(i,total_biomass)
sp_total_biomass<-rbind(sp_total_biomass,row2)
}
write.csv(sp_total_biomass,paste("sp_total_biomass_",time,".csv",sep=""))
AGB<-read.csv(paste("sp_total_biomass_",time,".csv",sep=""))
TotalAGB<-sum(AGB$total_biomass)
TotalAGBrow<-cbind(time,TotalAGB)
AGB_total_sheet<-rbind(AGB_total_sheet,TotalAGBrow)


}
Time<-c(0:200)
AGBGrand<-NULL
for(AGBtime in (Time)){
  AGBin<-read.csv(paste("sp_total_biomass_",AGBtime,".csv",sep=""))
  Yeartotal<-sum(AGBin$total_biomass)
  time<-AGBtime
  AGBrow<-cbind(time,Yeartotal)
  AGBGrand<-rbind(AGBGrand,AGBrow)
}
write.csv(AGBGrand,"AGBGrand.csv")



Time<-c(171:200)
######ANPP#######
Total_Carbon_sp_sheet<-NULL
Total_Carbon_total_sheet<-NULL

for(time in Time){
  Treemap<-as.data.frame(read.csv(paste("Sortie_PPA_Outputs/Replicate1/PPA_map_",time,".csv",sep="")))
  print(time)
  Species_list<-c("ACRU","BEAL","BEPA","BELE","FAGR","TSCA","FRAM","PIST","PRSE","QURU","PIRE","PIAB")
  
  sp_carbon<-NULL
  sp_total_carbon<-NULL
  
  for(i in Species_list){
    sp_biomass<-NULL
    subsp<-(subset(Treemap,Treemap$Species==i))
    print(i)
    for(slook in 1:nrow(Jenkins_LUT)){
      sp_look<-as.character(Jenkins_LUT[slook,"Sp"])
      data_look<-as.character(Jenkins_LUT[slook,"Formula"])
      if(sp_look==i&data_look=="TBM"){
        A<-(Jenkins_LUT[slook,"A"])
        B<-(Jenkins_LUT[slook,"B"])
        C<-(Jenkins_LUT[slook,"C"])
        D<-(Jenkins_LUT[slook,"D"])
        for(tree in 1:nrow(subsp)){
          gtree<-(subsp[tree,])
          DBH<-gtree$DBH
          biomass<-as.numeric(exp(A+B*DBH+C*(log(DBH^D))))###kg##
          row<-cbind(i,biomass)
          sp_biomass<-rbind(sp_biomass,row)
        }
      }
    }
    list<-as.data.frame(sp_biomass)
    factor<-as.numeric(list$biomass)
    total_carbon<-((sum(factor)*.5)/350)#####converting to g/m2 from kg/ha 
    #####divide by 35 to get from total to per ha
    ####multiply by 1000 to get kg to g
    #### divide by 10000 to get ha to m2
    ####reduces to divide by 350
    row2<-cbind(i,total_carbon)
    sp_total_carbon<-rbind(sp_total_carbon,row2)
    
  }
  write.csv(sp_total_carbon,paste("sp_total_carbon_",time,".csv",sep=""))
  
}

ANPP_time<-c(01:200)
ANPPSheet<-NULL
for(ANtime in (ANPP_time)){
timesub<-ANtime-1
Thisyear<-read.csv(paste("sp_total_carbon_",ANtime,".csv",sep=""))
Lastyear<-read.csv(paste("sp_total_carbon_",timesub,".csv",sep=""))
for(Ansp in (Species_list)){
  Totalcarbon1<-Thisyear$total_carbon[Thisyear$i==Ansp]
  Totalcarbon2<-Lastyear$total_carbon[Lastyear$i==Ansp]
  ANPP<-Totalcarbon1-Totalcarbon2
  Time<-ANtime
ANPProw<-cbind(Time,Ansp,ANPP)  
ANPPSheet<-rbind(ANPPSheet,ANPProw) 
}
}
write.csv(ANPPSheet,"ANPP_Species_Sheet.csv")
ANPPTable<-read.csv("ANPP_Species_Sheet.csv")

TotalANPPSheet<-NULL
for(ANtime in (ANPP_time)){
  Year<-ANPPTable$ANPP[ANPPTable$Time==ANtime]
  ANPPperM2<-(sum(Year))
  Time<-ANtime
  rowANPP<-cbind(Time,ANPPperM2)
  TotalANPPSheet<-rbind(TotalANPPSheet,rowANPP)
}


write.csv(TotalANPPSheet,"TotalANPPSheet.csv")
