################################################################################
#
# Project: Coursera - Exploratory Data Analysis
# Plot 1
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

png(filename = "plot1.png", width = 480, height = 480, units ="px")
# Plot histogram
hist(DF_NEW$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
 
       