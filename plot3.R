#Assignment 1
#plot 3 no title y axis = energy sub metering x axis= days of the week legend with submetering1 = black submetering 2= red submetering3 = blue
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
#make numeric
global_active_power <- as.numeric(subsetofhousepower$Global_active_power)
submetering1 <- as.numeric(subsetofhousepower$Sub_metering_1)
submetering2 <- as.numeric(subsetofhousepower$Sub_metering_2)
submetering3 <- as.numeric(subsetofhousepower$Sub_metering_3)

#save plot
png('plot3.png')
#plot 
plot(subsetofhousepower$Time, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subsetofhousepower$Time, submetering2, type="l", col="red")
lines(subsetofhousepower$Time, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


#finish saving
dev.off()


