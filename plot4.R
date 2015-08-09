plot4 = function()  {
  ## Reading data, extracting what we need.
  file = "./house_power/household_power_consumption.txt"
  x = read.table(file, header = TRUE, sep = ";", colClasses = "character")
  X = subset(x, x[,1] == "1/2/2007" | x[,1] == "2/2/2007")
  
  ## Merging date and time, converting it, creating other variables.
  t = paste(X[,1], X[,2], sep = " ")
  t = strptime(t, "%d/%m/%Y %H:%M:%S")
  Global_active_power = as.numeric(X[,"Global_active_power"])
  Voltage = as.numeric(X[,"Voltage"])
  Global_reactive_power = as.numeric(X[,"Global_reactive_power"])
  sm1 = as.numeric(X[, "Sub_metering_1"])
  sm2 = as.numeric(X[, "Sub_metering_2"])
  sm3 = as.numeric(X[, "Sub_metering_3"])
  
  ## Settings.
  par(mfrow = c(2, 2), mar = c(5, 4, 3, 1), oma = c(0, 0, 1, 0) )
  par(bg = "transparent")
  
  ## First plot.
  plot(t, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power",
  cex.lab = 0.75, cex.axis = 0.75)
  
  ## Second plot.
  plot(t, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = 0.75, cex.axis = 0.75)
  
  ## Third plot.
  plot(t, sm1, xlab = "", ylab = "Energy sub metering", main="", type = "l", cex.lab = 0.75, cex.axis = 0.75)
  lines(t, sm2, col = "Red", typ = "l")
  lines(t, sm3, col = "Blue", typ = "l")
  legend("topright", col = c("Black", "Red", "Blue"),legend = c("Sub_metering_1",
  "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = 0.5, bty = "n")
  
  ## Fourth plot
  plot(t, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power",
  cex.lab = 0.75, cex.axis = 0.75)
  
  dev.copy(png, "./ExData_Plotting1/plot4.png")
  dev.off()
}