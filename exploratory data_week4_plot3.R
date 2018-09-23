## 3) Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

NEI<- readRDS ("C:\\XX\\Desktop\\corsera\\exdata\\summarySCC_PM25.rds")
library(dplyr)

library(ggplot2)
NEI2 <- filter(NEI, fips == "24510")

## filter by type

NEI3 <- filter(NEI2, type == "POINT")
new3 <- aggregate(NEI3$Emissions, by=list(year = NEI3$year), FUN =sum)
new3$type <- "POINT"

NEI4 <- filter(NEI2, type == "NONPOINT")
new4 <- aggregate(NEI4$Emissions, by=list(year = NEI4$year), FUN =sum)
new4$type <- "NONPOINT"

NEI5 <- filter(NEI2, type == "ON-ROAD")
new5 <- aggregate(NEI5$Emissions, by=list(year = NEI5$year), FUN =sum)
new5$type <- "ON-ROAD"

NEI6 <- filter(NEI2, type == "NON-ROAD")
new6<- aggregate(NEI6$Emissions, by=list(year = NEI6$year), FUN =sum)
new6$type <- "NON-ROAD"

new7 <- rbind(new3, new4, new5, new6)
## print plot
png("C:\\XX\\Desktop\\corsera\\week4plot3.png", width=480, height=480)
qplot(year, x, data= new7, ylab="Emissions", geom="line", fill = type, color=type)

##emission decrease except"point"
dev.off()
