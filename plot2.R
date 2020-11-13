# Read the data
dataset = read.table('household_power_consumption.txt',
                     sep = ';',
                     header = TRUE)
dataset2 = subset(dataset, as.Date(Date, '%d/%m/%Y')>= '2007-02-01' & as.Date(Date, '%d/%m/%Y') <= '2007-02-02')

# Plotting the date
x1 = paste(dataset2$Date, dataset2$Time)
x = strptime(x1, "%d/%m/%Y %H:%M:%S")
with(dataset2, plot(x,Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power  (Kilowatts)'))

# Make the png file
dev.copy(png, file = 'plot2.png')
dev.off()
