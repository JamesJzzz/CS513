
# Zhiyuan(James) Zhang
# I pledge my honor that I have abided by the Stevens Honor System.

#install.packages("neuralnet")
remove(list = ls())

library("neuralnet")
# read the data
Breast_Cancer <- read.csv("/Users/JamesJz/Documents/Class/CS513/HomeWork/Homework 6/breast-cancer-wisconsin-data.csv", na.strings ='?')

#Breast_Cancer <- data.frame(lapply(Breast_Cancer, as.factor))

#View(Breast_Cancer)

# did it with replacing the missing value, it would not work otherwise.
Breast_Cancer<-Breast_Cancer[complete.cases(Breast_Cancer),]
Breast_Cancer = Breast_Cancer[,-1]

# get every 5th data point and store every 5th as test data set
myData = seq(from=1, to=nrow(Breast_Cancer), by=5) 
test<-Breast_Cancer[myData,]

# store every thing else as training data set
training<-Breast_Cancer[-myData,]

lol = neuralnet(Class~F1+F2+F3+F4+F5+F6+F7+F8+F9,training, hidden=5)
lol$result.matrix
#plot(lol)
compute(lol, test[, 2:10])
# ALl predictions are close to 2 or 4 which is good. 

