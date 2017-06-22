#Read data from file
	house<-read.table("household_power_consumption.txt", sep=";",header=TRUE,stringsAsFactors=FALSE, dec=".")

#Subset to reduce data to the required dates
	subhouse<-subset(house,Date=="1/2/2007" | Date=="2/2/2007")

#Add new column for Date & Time
	subhouse$DateTime<-strptime(paste(subhouse$Date,subhouse$Time), "%d/%m/%Y %H:%M:%S")

#Convert Date column to Date 
	subhouse$Date<-as.Date(subhouse$Date, "%d/%m/%Y")

#Open PNG file
	png("plot4.png", width=480, height=480)

#multiple plots
	par(mfrow = c(2, 2))

#Plot 1
	plot(subhouse$DateTime, as.numeric(subhouse$Global_active_power), type="l", xlab="", ylab="Global Active Power")

#Plot 2
	plot(subhouse$DateTime, as.numeric(subhouse$Voltage), type="l", xlab="datetime", ylab="Voltage")

#Plot 3
	plot(subhouse$DateTime, as.numeric(subhouse$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
	lines(subhouse$DateTime, as.numeric(subhouse$Sub_metering_2), type="l", col="red")
	lines(subhouse$DateTime, as.numeric(subhouse$Sub_metering_3), type="l", col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Plot 4
	plot(subhouse$DateTime, as.numeric(subhouse$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

#Device off
	dev.off()
