sum_b = 0

for (iter in 1:400) {
    n = 300
    x = runif(n, 0, 1)
    e = rnorm(n, 0, 0.1)
    u = rnorm(n, 0, 0.3)
    z = x + u
    y = 2 * x + e
    
    lm.y = lm(y ~ x)
    summary(lm.y)
    
    lm.z = lm(y ~ z)
    summary(lm.z)
    
    plot(z, y, cex.axis = 1.2, font.axis = 1, cex.lab = 1.5, las = 1, xlab = c(expression(paste(psi, ", z"))), ylab = "y")
    abline(lm.z, lwd = 4, lty = 1, col = "red")
    abline(lm.y, lwd = 4, lty = 2, col = "blue")
    b = summary(lm.z)$coef[2]
    sum_b = (sum_b + b)
}

1/400 * sum_b 
