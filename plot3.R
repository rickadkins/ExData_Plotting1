# Exploratory Data Analysis
#Plot 3  energy Sub metering by datetime
#rick adkins
#April 8, 2015

#set the working directory for this session
setwd("~/personal/john hopkins/DataScientist/Exploratory Data Analysis/WorkingDirectory")

#Retrieve data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#unzip and place extracted file in the working directory.

#Examine the file with Notepad++  determine only rows 66638 through 69517 inclusive are needed

#the date and time variables will come in as factors, so set stringsAsFactors to FALSE

df<-read.table(file="household_power_consumption.txt",stringsAsFactors=FALSE, header=FALSE, sep=";", na.strings=c("?"), skip=66637, nrows=2880)
names(df)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#the date format for the source is d/m/y  
#combine the date and time variables and convert to a datetime
df$DT<-strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")


#create the plot for visualization
png("Plot3.png", width=480, height=480)
plot(df$DT, df$Sub_metering_1, type="l",xlab="", ylab="Energy Sub Metering", col="black")
lines(df$DT, df$Sub_metering_2, col="red")
lines(df$DT, df$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1))
dev.off()
