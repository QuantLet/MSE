# clear variables, close windows
rm(list=ls(all=TRUE))
graphics.off()

load("vocabulary.rda")

names(vocabulary)=c("grade8","grade9","grade10","grade11","mean")

res1=lm(grade11~grade8+grade9+grade10,data=vocabulary)
res2=lm(grade11~grade9+grade10,data=vocabulary)

print(summary(res1))
print(summary(res2))
