# Close windows and clear variables
graphics.off()
rm(list = ls(all = T))

theta = seq(0.01, 3, 0.01)  # area to evaluate the pdf
y = 1 - pchisq(10/theta, df = 10)  # cdf
plot(theta, y, xlab = expression(paste("", theta)), "l", col = "blue", cex.lab = 1.5, cex.axis = 1.5, lwd = 3) 
