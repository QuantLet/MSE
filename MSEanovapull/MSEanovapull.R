rm(list = ls(all = T))
graphics.off()

y = c(9, 11, 10, 12, 7, 11, 12, 10, 11, 13, 10, 15, 11, 15, 15, 13, 7, 15, 13, 10, 18, 14, 17, 9, 14, 17, 16, 14, 17, 15)
a = rep(0, times = 10)
b = rep(1, times = 10)
x2 = c(a, b, a)
x3 = c(a, a, b)

lm1 = lm(y ~ x2 + x3)  # linear model y = b0 + b1*x2 + b2*x3

summary(lm1)

anova(lm1) 
