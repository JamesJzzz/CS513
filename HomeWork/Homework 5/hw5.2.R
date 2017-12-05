# Zhiyuan(James) Zhang
# I pledge my honor that I have abided by the Stevens Honor System.

#install.packages("C50")
remove(list = ls())
library("C50")

Breast_Cancer <- read.csv("/Users/JamesJz/Documents/Class/CS513/HomeWork/Homework 5/breast-cancer-wisconsin-data.csv")
?C5.0
Breast_Cancer <- data.frame(lapply(Breast_Cancer, as.factor))
mytree <- C5.0(Class~.,data=Breast_Cancer)
summary(mytree)
plot(mytree)
mytree <- C5.0(Class~.,data=Breast_Cancer)
plot(mytree)

# when you first run this code, it would probably complain about this :
# Warning message:
# In as.POSIXlt.POSIXct(x, tz) : unknown timezone 'default/America/New_York'
# it is my system thing, it has nothing to do with this homework.