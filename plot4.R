### Exploratory Final Project

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)


## Question 4
coal <- filter(SCC, grepl("Coal", EI.Sector))$SCC 
coal_us <- filter(NEI, SCC %in% coal)
coal_us <- group_by(coal_us, year)
us_coal_summary <- summarise(coal_us, Total_PMI25 = sum(Emissions))
png(filename = "plot4.png")
plot(us_coal_summary, type = "lm", main = "US PM2.5 from Coal Sources Over Time",
     xlab = "Year", ylab = "Coal Sources PM 2.5", col = "Red", lwd = 3)
dev.off()





