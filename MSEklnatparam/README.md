
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSEklnatparam** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MSEklnatparam

Published in : 'Modern Mathematical Statistics: Exercises and Solutions'

Description : Draws a plot of the Kullback-Leibler function for a natural parameter.

Keywords : plot, visualization, Kullback-Leibler, function, parameter

Author : Wolfgang K. Haerdle, Weining Wang, Shih Kang Chao

Submitted : Mon, September 27 2010 by Maria Osipenko

Example : Plot of the Kullback-Leibler function f(theta) for a natural parameter.

```

![Picture1](plot.png)


### R Code:
```r
x = seq(0.01, 0.3, 0.01)
y = -0.4/x - 0.5 * log(x) + 0.4
plot(x, y, "l", col = "blue") 

```
