#Read data from file
	house<-read.table("household_power_consumption.txt", sep=";",header=TRUE,stringsAsFactors=FALSE, dec=".")

#Subset to reduce data to the required dates
	subhouse<-subset(house,Date=="1/2/2007" | Date=="2/2/2007")

#Add new column for Date & Time
	subhouse$DateTime<-strptime(paste(subhouse$Date,subhouse$Time), "%d/%m/%Y %H:%M:%S")

#Convert Date column to Date 
	subhouse$Date<-as.Date(subhouse$Date, "%d/%m/%Y")

#Open PNG file
	png("plot2.png", width=480, height=480)

#Plot
	plot(subhouse$DateTime, as.numeric(subhouse$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Device off
	dev.off()

