# install.packages('boot') install.packages('pastecs') install.packages('graphics')

library(boot)
library(pastecs)
library(graphics)

file = "spq"

datafile = paste(file, "txt", sep = ".")

quarterly = read.table(datafile, sep = "", dec = ",")
colnms = c("date", "year", "price")

colnames(quarterly) = colnms
attach(quarterly)

return = diff(log(price))
n = length(diff(log(price)))

par(mai = c(1, 1.3, 1, 1))
qqnorm(return, cex.axis = 2.2, cex.main = 2.8, cex = 2.5, col = "red", bg = "red", cex.lab = 2.8, pch = 21, ann = FALSE, axes = FALSE, 
    frame = TRUE)
qqline(return, col = 4, lwd = 3)

mtext(side = 3, text = "Normal Q-Q plot", line = 1, cex = 2.8)
mtext(side = 1, text = "Theoretical Quantiles", line = 4, cex = 2.5)
mtext(side = 2, text = "Sample Quantiles", line = 4, cex = 2.5)
axis(side = 2, at = seq(-0.4, 0.3, by = 0.05), label = seq(-0.4, 0.3, by = 0.05), lwd = 1.2, cex.axis = 2.5, lwd.ticks = 2.5)
axis(side = 1, at = seq(-3, 3, by = 1), label = seq(-3, 3, by = 1), lwd = 1, cex.axis = 2.5, padj = 0.5, lwd.ticks = 2.5) 
