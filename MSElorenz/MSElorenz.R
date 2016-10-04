# Close windows and clear variables
graphics.off()
rm(list = ls(all = TRUE))

# install.packages('MASS')
library(MASS)

# setwd('C:/...')

file = read.csv("kredit.csv", sep = ";", dec = ".")  #load credit data
y = 1 - file$kredit  # default set to 1
prev = (file$moral > 2) + 0  # previous loans were OK
employ = (file$beszeit > 1) + 0  # employed (>=1 year)
dura = (file$laufzeit)  # duration
d9.12 = ((file$laufzeit > 9) & (file$laufzeit <= 12)) + 0  #  9 < duration <= 12
d12.18 = ((file$laufzeit > 12) & (file$laufzeit <= 18)) + 0  # 12 < duration <= 18
d18.24 = ((file$laufzeit > 18) & (file$laufzeit <= 24)) + 0  # 18 < duration <= 24
d24 = (file$laufzeit > 24) + 0  # 24 < duration
amount = file$hoehe  # amount of loan
age = file$alter  # age of applicant
savings = (file$sparkont > 4) + 0  # savings >= 1000 DM
phone = (file$telef == 1) + 0  # applicant has telephone
foreign = (file$gastarb == 1) + 0  # non-german citizen
purpose = ((file$verw == 1) | (file$verw == 2)) + 0  # loan is for a car
house = (file$verm == 4) + 0  # house owner

# Logit: dependence on several rating factors (with model choice)
g11 = glm(y ~ age + amount + prev + d9.12 + d12.18 + d18.24 + d24 + savings + purpose + house, family = binomial)
summary(g11)

# model choice
s11 = stepAIC(g11)
s11$anova
summary(s11)

# show est. PDs
s11$null.deviance - s11$deviance
s11$df.null - s11$df.residual
dchisq(s11$null.deviance - s11$deviance, s11$df.null - s11$df.residual)

# probability
s11$fitted.values

# scores
scores = log(s11$fitted.values/(1 - s11$fitted.values))

# calculationg required probabilities to plot loreny curve)
A = cbind(scores, y)  #data frame consisiting of scores and y values
n = length(scores)  #number of observations
n1 = sum(y == 1)  #number of observations which are default

l = 1000  #desired length of sequence

s1 = seq(min(scores), max(scores), length.out = l)  #seq of s's
s = c(s1, (max(scores) + 1))  #some modification to get prob 1

# define vectors and matrices
prop1 = rep(0, length(s))
prop2 = rep(0, length(s))


for (i in 1:length(s)) {
    prop1[i] = length(which(scores < s[i]))/n
    prop2[i] = length(which(scores < s[i] & y == 1))/n1
}

prop1  #xaxis
prop2  #yaxis

# lorenz curve
win.graph()
plot(prop1, prop2, xlab = "P(S<s)", ylab = "P(S<s|Y=1)", lwd = 2, pch = 16, col = "red", type = "l", cex.lab = 1.25, cex.axis = 1.25)
par(new = TRUE)
abline(0, 1) 
