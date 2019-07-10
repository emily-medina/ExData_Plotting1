#Assignment 1
#plot 1 global active power is title with red bars, frequency is y axis and global active power(kilowats)is xaxis
setwd("~/Desktop/Coursera")
#read in data
householdpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(householdpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetofhousepower <- subset(householdpower,householdpower$Date=="1/2/2007" | householdpower$Date =="2/2/2007")

#save plot
png('plot1.png')
#plot with red and bars and labels
hist(as.numeric(as.character(subsetofhousepower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#finish saving
dev.off()