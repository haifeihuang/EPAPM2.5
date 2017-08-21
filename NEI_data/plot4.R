setwd("~/datasciencecoursera/NEI_data")

library(pylr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
png(filename = "plot4.png",width = 480,height = 480,units = 'px')
SCCCoal <- SCC[grepl("coal",SCC$Short.Name,ignore.case = TRUE),]
CoalEmission <- merge(NEI,SCCCoal,by="SCC")
EmissionByCoal <- aggregate(CoalEmission[c("Emissions")],list(year=CoalEmission$year),sum)
colnames(EmissionByCoal) <- c("year","Emissions")
ggplot(EmissionByCoal,aes(factor(year),Emissions))+
        geom_line(aes(group=1,col=Emissions))+geom_point(aes(size=1,col=Emissions))+
        xlab("Year")+ylab(expression("Total"~PM[2.5]~"Emissions (tons)"))+
        ggtitle("Total emissions from Coal Cobustions (199-2008)")
dev.off()
