#Reading the dataset and creating a clean dataframe
householdData <- "./dataset/household_power_consumption.txt"
data <- read.table(householdData, header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
head(subdata)
str(subdata)

#Changing the screen device to a file device
dev.cur()
dev.off()
dev.set(which = 3)


png("plot1.png", width=480, height=480)     #Creating a png file to which the plot is to be written
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)  #Converting the char variable to a numeric one 
hist(subdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power") 
dev.off()
