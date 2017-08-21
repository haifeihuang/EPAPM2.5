setwd("~/datasciencecoursera/NEI_data")

library(pylr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



#plot2
#Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plottin
#g system to make a plot answering this question.
png(filename = "plot2.png",width = 480,height = 480,units = 'px')
NEIBaltimore <- subset(NEI,fips=="24510")
sumPM25byYearBaltimore <- tapply(NEIBaltimore$Emissions,NEIBaltimore$year,sum)
plot(names(sumPM25byYearBaltimore),sumPM25byYearBaltimore,type="l",
     xlab="Year",ylab=expression("Total"~PM[2.5]~"Emissions (tons)"),
     main = expression("Total Baltimore City"~PM[2.5]~"Emissions by Year"))
dev.off()