
# Zhiyuan(James) Zhang
# Dec 13 2017
# I pledge my honor that I have abided by the Stevens Honor System.

#install.packages("neuralnet")
#remove(list = ls())

library(class)
rm(list=ls())
library(ggplot2)


data <- as.data.frame(read.csv("/Users/JamesJz/Documents/Class/CS513/Final Exam/NJ_zip_median_income.csv"))
#View(data)

clusP <- hclust(dist(data[,2:2]), method = 'average')
clusterCut <- cutree(clusP, 3)
plot(clusP)
table(clusterCut,data[,2])


?kmeans
butmedian = as.data.frame(data[,-2])
butpop = as.data.frame(butmedian[,-3])

?table

kmeans_3<- kmeans(butpop,3,nstart = 10)
kmeans_3$cluster

table(kmeans_3$cluster,data$Zip)
table(kmeans_3$cluster,data$Pop)



