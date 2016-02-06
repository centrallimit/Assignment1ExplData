################################################################################
#
# Project: Coursera - Exploratory Data Analysis
# Plot 2
# 
###############################################################################
library(dplyr)
library(lubridate)
library(graphics)
library(grDevices)
# Read data
DF <- read.table("household_power_consumption.txt", header = TRUE, sep  =";",
                 na.strings = "?")

DF$Date <- dmy(DF$Date)

# Filter data 2007/2/1 and 2007/2/2
DF_NEW <- DF %>%
        filter(year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))


# Open PNG device
png(filename = "plot2.png", width = 480, height = 480, units ="px")
# Line plot
plot(DF_NEW$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", axes = FALSE)
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"), pos = NA)
axis(2)
box(which = "plot")
dev.off()