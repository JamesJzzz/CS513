# Zhiyuan(James) Zhang
# Nov 27 2017
# I pledge my honor that I have abided by the Stevens Honor System
# The question asks to convert the elements into factors
# also asked to do it without replacing the missing value.
# but it is not possible to be done with missing values so 
# I replaced it. 




#install.packages('randomForest')
library(class)
library(randomForest)

rm(list=ls())

BC <- read.csv("/Users/JamesJz/Documents/Class/CS513/HomeWork/Homework 7/breast-cancer-wisconsin-data.csv")
set.seed(321)
BC <- data.frame(lapply(BC, as.factor))
#View(BC)

BC<-BC[complete.cases(BC),]
BC = BC[,-1]
myData = seq(from=1, to=nrow(BC), by=5) 
test<-BC[myData,]
training<-BC[-myData,]

fit <- randomForest(Class~F1+F2+F3+F4+F5+F6+F7+F8+F9, data = training, importance = TRUE, ntree= 2000)
importance(fit)
varImpPlot(fit)
Prediction <- predict(fit, test)
table(Prediction=Prediction,Actual=test[,10])
#print(table(prediction=Prediction,Actual=test[,11]))


