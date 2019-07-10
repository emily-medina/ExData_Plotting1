#Assignment 1
#plot 2 no title line graph, Global Active Power (kilowatts) is y axis and Thursday, Friday, Saturday is xaxis
setwd("~/Desktop/Coursera")
#read in data
householdpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(householdpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetofhousepower <- subset(householdpower,householdpower$Date=="1/2/2007" | householdpower$Date =="2/2/2007")

#need to make date and time into readable variables
subsetofhousepower$Date <- as.Date(subsetofhousepower$Date, format="%d/%m/%Y")
subsetofhousepower$Time <- strptime(subsetofhousepower$Time, format="%H:%M:%S")
subsetofhousepower[1:1440,"Time"] <- format(subsetofhousepower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetofhousepower[1441:2880,"Time"] <- format(subsetofhousepower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
global_active_power <- as.numeric(subsetofhousepower$Global_active_power)


#save plot
png('plot2.png')
#plot with black(default) lines points that connect
plot(subsetofhousepower$Time, as.numeric(global_active_power),type="l",xlab="",ylab="Global Active Power(kilowatts)")
#finish saving
dev.off()