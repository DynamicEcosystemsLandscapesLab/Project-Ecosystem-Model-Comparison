


w.dir<-"C:/Users/jean/Documents/REU_Strigul_2017/Species/data/Understory_sorted/"
setwd(w.dir)



spec<-c("ACSA","BEAL","ACRU","BELE","BEPA","FAGR","FRAM","PIAB","PIRE","PIST","PRSE","QURU","TSCA")
full<-NULL
growthmatrix<-NULL
for(i in spec){

seedling<-read.csv(paste(i,"_seedling_under.csv",sep=""))
sapling<-read.csv(paste(i,"_sapling_under.csv",sep=""))
adult<-read.csv(paste(i,"_adult_under.csv",sep=""))
seedlinggrowth<-seedling$Growth
saplinggrowth<-sapling$Growth
adultgrowth<-adult$Growth
Growth<-c(seedlinggrowth,saplinggrowth,adultgrowth)
seedlingheight<-seedling$Height
saplingheight<-sapling$Height
adultheight<-adult$Height
Height<-c(seedlingheight,saplingheight,adultheight)
seedlingtime<-seedling$Time
saplingtime<-sapling$Time
adulttime<-adult$Time
time<-c(seedlingtime,saplingtime,adulttime)
seedlingDBH<-seedling$Diam10
saplingDBH<-sapling$DBH
adultDBH<-adult$DBH

DBH<-c(seedlingDBH,saplingDBH,adultDBH)
full<-cbind(time,i,Height,Growth,DBH)
growthmatrix<-cbind(growthmatrix,full)
}


write.csv(growthmatrix,file="under_compiler_matrix.csv")
####Clear data for plots###########
sp_matrix<-read.csv("under_compiler_matrix.csv")
?plot()
list<-c(1,2,3,4,5,6,7,8,9,10)

sp<-c("ACSA","BEAL","ACRU","BELE","BEPA","FAGR","FRAM","PIAB","PIRE","PIST","PRSE","QURU","TSCA")

plot(sp_matrix$time.1,sp_matrix$Growth.2,main = "Understory ACSA",xlab="Time",ylab="Growth")

