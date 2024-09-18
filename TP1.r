s <- c(1,2,3,4)

b <- matrix(c(15, 3, 12, 2, 1), nrow=5, ncol=1)
#b <-c(15, 3, 12, 2, 1)
c<-seq(5)
d<-b%*%c
f<-cbind(b,c)
f
u <- c(TRUE, FALSE, TRUE, TRUE)
any(u)
a<-c(1,2,3,3,2,3)
which(a==max(a))
setwd("Home/Intro_R/TP1")
pop<-read.csv2("Intro_R/TP1/Pop2015.csv")
superficie<-read.csv2("Intro_R/TP1/Superficie.csv", sep = ",",dec = ".")
str(pop)
summary(pop)
str(superficie)
chr(pop[1])
pop[seq(20), ]
pop$CODGEO<-as.character(pop$CODGEO)
superficie$DEPCOM<-as.character(superficie$DEPCOM)
pop<-cbind(pop,substr(pop$CODGEO,1,2))
colnames(pop)<-c("CODGEO","LIBGEO","P15_POPH","P15_POPF","DEP")
which(duplicated(superficie))

superficie <- superficie[-11,]
which(duplicated(superficie))
fusion<-merge(pop,superficie,by.x="CODGEO",by.y="DEPCOM")
illeetvillaine<-fusion[fusion$DEP=="35",]
horsilleetvillaine<-fusion[fusion$DEP!="35",]
q11 <- cbind(illeetvillaine$LIBGEO, illeetvillaine$SURFACE)
which(illeetvillaine$SURFACE==max(illeetvillaine$SURFACE))
illeetvillaine$LIBGEO[,200]      
colnames(illeetvillaine)[6]<-"SUPERFICIE"
illeetvillaine <- cbind(illeetvillaine, illeetvillaine$P15_POPH+illeetvillaine$P15_POPF)
summary(illeetvillaine)

colnames(illeetvillaine)[7] <- "POPTOTAL"

write.csv(illeetvillaine, "Intro_R/TP1/final3.csv",row.names=FALSE, sep=";")
