v = seq(-3, -0.01, 0.01)
y = 0.8 * v - 0.5 * log(-0.5/v) + 0.4
plot(v, y, "l", col = "blue", cex.lab = 1.5, cex.axis = 1.5) 
