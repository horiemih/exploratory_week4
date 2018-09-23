##4) Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

NEI<- readRDS ("C:\\XX\\Desktop\\corsera\\exdata\\summarySCC_PM25.rds")
library(dplyr)

SCC<- readRDS ("C:\\XX\\Desktop\\corsera\\exdata\\Source_Classification_Code.rds")
NEISCC <-merge(NEI, SCC, by="SCC")
## remove space##
NEISCC$EI.Sector <- gsub("\\s+", "", NEISCC$EI.Sector)
unique(NEISCC$EI.Sector)
## find the word Coal
##"FuelComb-ElectricGeneration-Coal"
## "FuelComb-IndustrialBoilers,ICEs-Coal"
## "FuelComb-Comm/Institutional-Coal"
library(dplyr)

##filter by each category
Coal1 <- filter(NEISCC, EI.Sector == "FuelComb-ElectricGeneration-Coal")
Coal2 <- filter(NEISCC, EI.Sector == "FuelComb-IndustrialBoilers,ICEs-Coal")
Coal3<- filter(NEISCC, EI.Sector == "FuelComb-Comm/Institutional-Coal")

Coal <- rbind(Coal1, Coal2, Coal3)
new2 <- aggregate(Coal$Emissions, by=list(year = Coal$year), FUN =sum)
png("C:\\XX\\Desktop\\corsera\\week4plo4.png", width=480, height=480)
with(new2, plot(year, x, ylab= "Emissons"))
## emissions from coal decreased from 1999 to 2008
dev.off()
