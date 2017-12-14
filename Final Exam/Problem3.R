# Zhiyuan(James) Zhang
# Dec 13 2017
# I pledge my honor that I have abided by the Stevens Honor System

library(class)
library(neuralnet)
library(nnet)

rm(list=ls())

titanic <- read.csv('/Users/JamesJz/Documents/Class/CS513/Final Exam/Titanic_rows.csv', stringsAsFactors = TRUE)
titanic$iClass= as.integer(as.factor(titanic$Class))
titanic$iSex= as.integer(as.factor(titanic$Sex))

titanic$Age <- ifelse(titanic$Age=="Child", 0, 1)

titanic$iAge= as.integer(as.factor(titanic$Age))
titanic$iSurvived= as.integer(as.factor(titanic$Survived))
#View(titanic)
# get every 5th data point
myData = seq(from=1, to=nrow(titanic), by=5) 
# store every 5th as test data set
test<-titanic[myData,]
# store every thing else as training data set
training<-titanic[-myData,]

ann = neuralnet(iSurvived~ iClass + iSex + iAge, training, hidden=5, threshold=0.1)

plot(ann)

ann_res <- compute(ann, test[, 5:7])
ann2=as.numeric(ann_res$net.result)

ann_round<-round(ann2)
ann_cat<-ifelse(ann2<1.5,1,2)
table(Actual=test$iSurvived,ann_round)
table(Actual=test$iSurvived,ann_cat)

wrong<- (test$iSurvived!=ann_cat)
rate<-sum(wrong)/length(wrong)
rate


