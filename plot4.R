#Assignment 1
#plot 4 4 graphs
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
global_reactive_power <- as.numeric(subsetofhousepower$Global_reactive_power)
voltage <- as.numeric(subsetofhousepower$Voltage)
submetering1 <- as.numeric(subsetofhousepower$Sub_metering_1)
submetering2 <- as.numeric(subsetofhousepower$Sub_metering_2)
submetering3 <- as.numeric(subsetofhousepower$Sub_metering_3)

#save plot
png('plot4.png', width=480, height=480)

#plot 
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subsetofhousepower,{
    plot(subsetofhousepower$Time,as.numeric(as.character(subsetofhousepower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
    plot(subsetofhousepower$Time,as.numeric(as.character(subsetofhousepower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
    plot(subsetofhousepower$Time,subsetofhousepower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    with(subsetofhousepower,lines(Time,as.numeric(as.character(Sub_metering_1))))
    with(subsetofhousepower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
    with(subsetofhousepower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
    plot(subsetofhousepower$Time,as.numeric(as.character(subsetofhousepower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#finish saving
dev.off()


