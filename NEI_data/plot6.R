setwd("~/datasciencecoursera/NEI_data")

library(pylr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#plot6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
#vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city 
#has seen greater changes over time in motor vehicle emissions?
png(filename = "plot6.png",width = 480,height = 480,units = 'px')
Baltimore <- subset(NEI,fips=="24510"&type=="ON-ROAD")
Baltimore$year <- factor(Baltimore$year,levels=c('1999','2002','2005','2008'))
BaltimorePM2.5 <- cbind(aggregate(Baltimore[c("Emissions")],list(year=Baltimore$year),sum),City="Baltimore")
colnames(BaltimorePM2.5) <- c("year","Emissions","City")

LA <- subset(NEI,fips=="06037"&type=="ON-ROAD")
LA$year <- factor(LA$year,levels = c('1999','2002','2005','2008'))
LAPM2.5 <- cbind(aggregate(LA[c("Emissions")],list(year=LA$year),sum),City="Los Angeles")
colnames(LA) <- c("year","Emissions","City")

combineData <- rbind.data.frame(BaltimorePM2.5,LAPM2.5)
ggplot(combineData,aes(year,Emissions))+geom_bar(aes(fill=year),stat="identity")+facet_grid(.~City)+
        xlab("Year")+ylab(expression("Total"~PM[2.5]~"Emissions (tons)"))+
        ggtitle("Total Emissions from motor vehicles in Baltimore and in Los Angeles")
dev.off()
