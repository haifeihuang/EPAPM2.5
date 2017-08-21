setwd("~/datasciencecoursera/NEI_data")

library(pylr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot5
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
png(filename = "plot5.png",width = 480,height = 480,units = 'px')
Baltimore <- subset(NEI,fips=="24510" & type =="ON-ROAD")
Baltimore$year <- factor(Baltimore$year,levels = c('1999','2002','2005','2008'))
BaltimorePM2.5 <- aggregate(Baltimore[c("Emissions")],list(year=Baltimore$year),sum)
colnames(BaltimorePM2.5) <- c("year","Emissions")
ggplot(BaltimorePM2.5,aes(year,Emissions))+ geom_bar(aes(fill=year),stat = "identity")+
        xlab("Year")+ylab(expression("Total"~PM[2.5]~"Emissions (tons)"))+
        ggtitle("Total Emissions of Motor Vehicles in Baltimore")
dev.off()
