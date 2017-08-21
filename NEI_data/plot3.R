setwd("~/datasciencecoursera/NEI_data")

library(pylr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#plot3
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999-2008 for Baltimore City? Which have seen increases in
# emissions from 1999-2008? Use the ggplot2 plotting system to make a plot
# answer this question.
library(ggplot2)
png(filename = "plot3.png",width=480,height = 480,units = 'px')
NEIBaltimore <- subset(NEI,fips=="24510")
BaltimorePM2.5 <- aggregate(NEIBaltimore[c("Emissions")],list(type=NEIBaltimore$type,year=NEIBaltimore$year),sum)
qplot(year,Emissions,data=BaltimorePM2.5,color=type,geom = "path")+
        ggtitle(expression("Total Baltimore City"~PM[2.5]~"Emissions by Year"))+
        xlab("Year")+ylab(expression("Total"~PM[2.5]~"Emissions (tons)"))
dev.off()