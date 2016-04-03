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
#Plot 2
plot.new()
frame()
dev.off()
png(file="plot2.png", width = 480, height = 480, units = "px")
plot(hwr$NDate, hwr$Active, type="l", lwd=2, ylab="Global Active Power (kilowatts)", xlab="")
dev.off()