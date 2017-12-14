# Zhiyuan(James) Zhang
# Dec 13 2017
# I pledge my honor that I have abided by the Stevens Honor System

#install.packages('randomForest')
library(class)
library(randomForest)

rm(list=ls())

BC <- read.csv("/Users/JamesJz/Documents/Class/CS513/Final Exam/wisc_bc_ContinuousVar.csv")
BC = BC[,-1]
#View(BC)

set.seed(321)
#BC <- data.frame(lapply(BC, as.factor))
#View(BC)

#BC<-BC[complete.cases(BC),]

myData = seq(from=1, to=nrow(BC), by=5) 
test<-BC[myData,]
training<-BC[-myData,]

diaCol = 1
train = as.data.frame(training[,-diaCol])
trainLabels = as.factor(unlist(training[,diaCol]))
testVals = as.data.frame(test[,-diaCol])
testLabels = as.factor(unlist(test[,diaCol]))

fit <- randomForest(train,trainLabels, ntree= 1000)

#importance(fit)
#varImpPlot(fit)

Prediction <- predict(fit, test)
Prediction
lol = (testLabels != Prediction)
lol
error_rate = sum(lol)/length(lol)
error_rate
table(Prediction=Prediction,Actual=test[,10])
#print(table(prediction=Prediction,Actual=test[,11]))


