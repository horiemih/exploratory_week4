##5)How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 

NEI<- readRDS ("C:\\XX\\Desktop\\corsera\\exdata\\summarySCC_PM25.rds")
library(dplyr)
SCC<- readRDS ("C:\\XX\\Desktop\\corsera\\exdata\\Source_Classification_Code.rds")
NEISCC <-merge(NEI, SCC, by="SCC")
unique(NEISCC$type)
##select baltimore

NEISCC2 <- filter(NEISCC, fips == "24510")
## select ON-ROAD
NEISCC3 <- filter(NEISCC2, type == "ON-ROAD")
motor <- aggregate(NEISCC3$Emissions, by=list(year = NEISCC3$year), FUN =sum)
png("C:\\XX\\Desktop\\corsera\\week4plo5.png", width=480, height=480)

with(motor, plot(year, x, ylab= "Emissons"))
## emissions from motor vehicle source decreased from 1999 to 2008
dev.off()
