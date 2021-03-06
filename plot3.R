setwd('C:/Users/hp/Desktop/6th sem/Data Science/Exploratory Data Analysis')
dat1 <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subdat1 <- subset(dat1, Date %in% c("1/2/2007","2/2/2007"))
subdat1$Date <- as.Date(subdat1$Date, format="%d/%m/%Y")
dat1time <- paste(as.Date(subdat1$Date), subdat1$Time)
subdat1$Datetime <- as.POSIXct(dat1time)

with(subdat1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()