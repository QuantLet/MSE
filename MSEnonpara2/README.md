
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSEnonpara2** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : MSEnonpara2

Published in : 'Modern Mathematical Statistics : Exercises and Solutions'

Description : 'Generates n=300 standard normal distributed random sample, and draws the kernel
density curve of the estimated kernel density function using a Gaussian kernel. Since the kernel
density function is biased in a finite sample, one can not compare it with the true density
directly. One rather compare it with the expectation of the kernel density function under the true
density. Then it draws the expectation of the kernel density function under the true density.'

Keywords : plot, kernel, density, nonparametric, nonparametric estimation

Author : Wolfgang Karl Haerdle, Vladimir Panov, Vladimir Spokoiny, Weining Wang

Submitted : Fri, November 09 2012 by Dedy Dwi Prastyo

Example : 'The kernel density estimator ^fh(x) (solid line), ^g(x) with f0=t(3) (dashed line), and
^g(x) with f0=N(^mu, ^sigma^2), for n=300.'

```

![Picture1](plot.png)


### R Code:
```r
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
 

```
