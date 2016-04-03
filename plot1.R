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
#Plot 1
plot.new()
frame()
dev.off()
png(file="plot1.png", width = 480, height = 480, units = "px")
hist(hwr$Active, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", main="Global Active Power")
dev.off()