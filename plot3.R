# Read the data
dataset = read.table('household_power_consumption.txt',
                     sep = ';',
                     header = TRUE)
dataset2 = subset(dataset, as.Date(Date, '%d/%m/%Y')>= '2007-02-01' & as.Date(Date, '%d/%m/%Y') <= '2007-02-02')

# Plotting the data
x1 = paste(dataset2$Date, dataset2$Time)
x = strptime(x1, "%d/%m/%Y %H:%M:%S")

plot(x, dataset2$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
points(x, dataset2$Sub_metering_2, type = 'l', col = 'red')
points(x, dataset2$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'),y.intersp = 0.4, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# Make the png file
dev.copy(png, file = 'plot3.png')
dev.off()

