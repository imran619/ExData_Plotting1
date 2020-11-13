# Read the data
dataset = read.table('household_power_consumption.txt',
                     sep = ';',
                     header = TRUE)
dataset2 = subset(dataset, as.Date(Date, '%d/%m/%Y')>= '2007-02-01' & as.Date(Date, '%d/%m/%Y') <= '2007-02-02')

# Plotting the data
par(mfrow = c(2,2))

x1 = paste(dataset2$Date, dataset2$Time)
x = strptime(x1, "%d/%m/%Y %H:%M:%S")

# 1st plot
with(dataset2, plot(x,Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power  (Kilowatts)'))

# 2nd plot
with(dataset2, plot(x,Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage'))

# 3r plot
plot(x, dataset2$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
points(x, dataset2$Sub_metering_2, type = 'l', col = 'red')
points(x, dataset2$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', bty = 'n', cex = 0.5, y.intersp = 0.3, lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# 4th plot
with(dataset2, plot(x,Global_reactive_power, type = 'l', xlab = 'datetime'))

# Make the png file
dev.copy(png, file = 'plot4.png')
dev.off()

