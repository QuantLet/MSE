
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSEanovapull** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MSEanovapull

Published in : 'Modern Mathematical Statistics: Exercise and Solution'

Description : 'Estimates a linear model (ANOVA). The plot presents results of the estimation of a
linear model'

Keywords : linear-regression, linear-model, regression, linear, anova, estimation, variance

Author : Wolfgang Karl Haerdle, Vladimir Panov, Vladimir Spokoiny, Weining Wang

Example : Presents results of the estimation of a linear model

```


### R Code:
```r
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

```
