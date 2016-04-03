#Getting the file
f<- file.path(getwd(), "household_power_consumption.txt")
hw <- read.table(f, stringsAsFactors = FALSE, sep = ";", na.strings = "?", header=FALSE, skip = 1)
#Reformatting the file header
names(hw) <- c("Date","Time","Active","Reactive","Voltage","Intensity","Sub1","Sub2","Sub3")
#Refformatting the date time info
hw$NDate <- strptime(paste(hw$Date, hw$Time), "%d/%m/%Y %H:%M:%S")
#Subsetting the revelant period of measurements
hwr <- subset(hw, NDate>="2007-02-01 00:00:00" & NDate<="2007-02-02 23:59:59")
head(hwr)
#Plot 3
plot.new()
frame()
dev.off()
png(file="plot3.png", width = 480, height = 480, units = "px")
plot(hwr$NDate, hwr$Sub1, type="l", lwd=2, ylab="Energy sub metering", xlab="")
points(hwr$NDate, hwr$Sub2, type="l", lwd=2, col="red")
points(hwr$NDate, hwr$Sub3, type="l", lwd=2, col="blue")
legend("topright", lty=c("solid", "solid", "solid"), col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()