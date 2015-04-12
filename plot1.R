# Exploratory Data Analysis
#Plot 1  Histogram
#rick adkins
#April 8, 2015

#set the working directory for this session
setwd("~/personal/john hopkins/DataScientist/Exploratory Data Analysis/WorkingDirectory")

#Retrieve data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#unzip and place extracted file in the working directory.

#Examine the file with Notepad++  determine only rows 66638 through 69517 inclusive are needed

df<-read.table(file="household_power_consumption.txt", header=FALSE, sep=";", na.strings=c("?"), skip=66637, nrows=2880, stringsAsFactors=FALSE)
names(df)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#create histogram
png("Plot1.png", width=480, height=480)
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
