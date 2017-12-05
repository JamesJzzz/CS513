#########################################################################################
## Course          : CS 513
## First Name      : Zhiyuan(James)
## Last Name       : Zhang
## Pledge          : I pledge my honor that I have abided by the Stevens honor system.
##                   ------James
##                 : Question 5
#########################################################################################

library(class)

rm(list=ls())

# read in data
readfile<- read.csv('/Users/JamesJz/Documents/Class/CS513/Midterm/breast-cancer-wisconsin.data.csv', na.strings = '?')

# we only use those data that are meaningful
# so delete the records that are associate with the "?" cell
# our record will be 699 at first and then 683 after deletion
# we also delete the first column since it is the row id rather than the actual data
# so if we have it in there it would severely impact our preformance.
# so our new dataset is 10 variable instead of 11. 

# store test and training data
readfile<-readfile[complete.cases(readfile),]
readfile = readfile[, -1]
myData = seq(from=1, to=nrow(readfile), by=5)
test<-readfile[myData,]
training<-readfile[-myData,]

# knn with k = 5 
knn5<-knn(training[,-10], test[,-10], training[,10], k=5)
knn5

# measure performance of knn
err5<-1-sum(test[,10]==knn5)/length(knn5)
err5
table(Prediction=knn5,Actual=test[,10] )
# since the error rate is 0.05109489. 
# so our accuracy would be around 95%, which is good 


