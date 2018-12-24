#Reading the dataset and creating a clean dataframe
householdData <- "./dataset/household_power_consumption.txt"
data <- read.table(householdData, header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
#head(subdata)
#str(subdata)

#Changing the screen device to a file device
dev.cur()
dev.off()
dev.set(which = 3)

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()