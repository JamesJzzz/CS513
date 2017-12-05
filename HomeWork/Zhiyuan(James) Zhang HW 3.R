# Zhiyuan(James) Zhang
# 10399976
# I pledge my honor that I have abided by the Stevens Honor System.
# ------James

rm(list=ls())
#load the dataset

library(class)
data("iris")
View(iris)
#find the min and max value of each column except the last column
min_col <- apply(iris[,-5],2,min);
max_col <- apply(iris[,-5],2,max);

# the range of min and max
range_col = max_col - min_col
#nomalize the data
for (i in 1:nrow(iris)){
  iris[i,-5] <- (iris[i,-5] - min_col) /range_col
}

#ceate the testing set with every fifth record in iris starting from first one
idx <- seq(1,nrow(iris),5)
test <- iris[idx,]

training <-iris[-idx,]

# measure the permformance of the knn
# this is the error ratio:
error_ratio <- function(r){
  count <- 0.0 ;
  for (i in 1:length(r)){
    if (r[i] == TRUE){
      count = count + 1
    }
  }
  ratio <-(length(r)-count) / length(r)
  return (ratio)
}

#When k = 1
result1 <- knn(training[,-5],test[,-5],training[,5],k=1)
result1
#error ratio is :
e1 <- 1 - sum(test[,5]==result1) / length(result1)
e1
#When k = 2
result2 <- knn(training[,-5],test[,-5],training[,5],k=2)
result2
#error ratio is :
e2 <- 1 - sum(test[,5]==result2) / length(result2)
e2

#When k = 5
result3 <- knn(training[,-5],test[,-5],training[,5],k=5)
result3
#error ratio is :
e3 <- 1 - sum(test[,5]==result3) / length(result3)
e3

#When k = 10
result4 <- knn(training[,-5],test[,-5],training[,5],k=10)
result4
#error ratio is :
e4 <- 1 - sum(test[,5]==result4) / length(result4)
e4


# conlusion : according to the result, when set k=10, 
# the classification may or may not get completely correct 
# and the others just has the same error ratio



