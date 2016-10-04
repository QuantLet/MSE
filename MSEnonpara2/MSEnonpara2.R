# Close windows and clear variables
rm(list = ls(all = TRUE))
graphics.off()

n_1 = 300
obs = rnorm(n_1, 0, 1)
den_x = density(obs, kernel = "gaussian", bw = "nrd0")
plot(den_x, lwd = 4, lty = 1, col = "blue", cex.axis = 1.2, font.axis = 1, cex.lab = 1.5, las = 0, xlab = "x", ylab = "f(x)", 
    main = "")

n = 1000
z = rt(n, 3)
h = den_x$bw
g = 1:512

for (j in 1:length(den_x$x)) {
    sum_k = 0
    for (i in 1:length(z)) {
        u = (den_x$x[j] - z[i])/h
        k = exp(-u^2/2)/sqrt(2 * pi)
        sum_k = sum_k + k
    }
    g[j] = 1/(h * length(z)) * sum_k
}

lines(den_x$x, g, lwd = 3, lty = 2, col = "red")
mu = mean(obs)
sd = sd(obs)
q = rnorm(n, mu, sd)
f = 1:512

for (j in 1:length(den_x$x)) {
    sum_k = 0
    for (i in 1:length(q)) {
        u = (den_x$x[j] - q[i])/h
        k = exp(-u^2/2)/sqrt(2 * pi)
        sum_k = sum_k + k
    }
    f[j] = 1/(h * length(q)) * sum_k
}

lines(den_x$x, f, lwd = 4, lty = 3, col = "black")
 
