# Reading the data
data<-read.table('household_power_consumption.txt', sep=";", header=T, stringsAsFactors=T,na.strings="?")
# Transforming the factors into Date objects
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Transforming the factors into numeric objects
data$Global_active_power <- as.numeric(data$Global_active_power)
# for this plot, there is no need of changing anything else
# since I do not actually need all of the data object
# it is transformed into its subset
data <- subset(data, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
# creating the proper  time data for our coming plot
data$plot_time <- as.POSIXct(paste(data$Date,data$Time))
# creating the .png device
# the exercise states that the figure should be 480x480
# luckily those are the default sizes for a png file
# but, since it is an exercise, I add them explicitly
png("plot2.png", height=480, width=480)
# creating the plot
plot(data$Global_active_power ~ data$plot_time, type="l",ylab="Global Active Power (kilowatts)", xlab="")
# actually shutting off the device while creating the .png file
dev.off()
