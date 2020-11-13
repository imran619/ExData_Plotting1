# Read the data
dataset = read.table('household_power_consumption.txt',
                     sep = ';',
                     header = TRUE)
dataset$Date = as.Date(dataset$Date, '%d/%m/%Y')
dataset2 = subset(dataset, Date>= '2007-02-01' & Date <= '2007-02-02')

# Plotting the date
hist(as.numeric(dataset2$Global_active_power),
     main = 'Glbal Active Power',
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     col = 'red')

# Make the png file
dev.copy(png, file = 'plot1.png')
dev.off()