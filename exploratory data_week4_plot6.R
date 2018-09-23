##6) ompare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

NEI<- readRDS ("C:\\XX\\Desktop\\corsera\\exdata\\summarySCC_PM25.rds")
library(dplyr)
SCC<- readRDS ("C:\\XX\\Desktop\\corsera\\exdata\\Source_Classification_Code.rds")
NEISCC <-merge(NEI, SCC, by="SCC")
NEISCC <-merge(NEI, SCC, by="SCC")
unique(NEISCC$type)
##filter baltimore
NEISCC2 <- filter(NEISCC, fips == "24510")

NEISCC3 <- filter(NEISCC2, type == "ON-ROAD")
motor <- aggregate(NEISCC3$Emissions, by=list(year = NEISCC3$year), FUN =sum)
## filter california
NEISCC4 <- filter(NEISCC, fips == "06037")
NEISCC5 <- filter(NEISCC4, type == "ON-ROAD")
motor2 <- aggregate(NEISCC5$Emissions, by=list(year = NEISCC5$year), FUN =sum)
library(ggplot2)
motor$fips <- "baltimore"
motor2$fips <- "califonia"

motor3 <- rbind(motor, motor2)
##print graph
png("C:\\XX\\Desktop\\corsera\\week4plo6.png", width=480, height=480)

qplot(year, x, data=motor3, ylab="Emissions", geom="line", fill = fips, color=fips)
## between 1999 amd 2008, baltimore decreased more than california
dev.off()
