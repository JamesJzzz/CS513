# Zhiyuan(James) Zhang
# Nov 27 2017
# I pledge my honor that I have abided by the Stevens Honor System
# Two questions are exactly the same, I don't know why it appears two times.

rm(list=ls())
library(class)
library(ggplot2)
data(iris)
View(iris)

clusP <- hclust(dist(iris[, 3:4]), method = 'average')
plot(clusP)

clusCutP <- cutree(clusP, 3)
table(clusCutP, iris$Species)
ggplot(iris, aes(Petal.Length, Petal.Width, color = iris$Species)) + 
  geom_point(alpha = 0.4, size = 3.5) + geom_point(col = clusCutP) + 
  scale_color_manual(values = c('blue', 'red', 'green'))

clustersS <- hclust(dist(iris[, 3:4]), method = 'average')
plot(clustersS)

clusCutS <- cutree(clustersS, 3)
table(clusCutS, iris$Species)

ggplot(iris, aes(Sepal.Width,Sepal.Length,  color = iris$Species)) + 
  geom_point(alpha = 0.4, size = 3.5) + geom_point(col = clusCutS) + 
  scale_color_manual(values = c('blue', 'red', 'green'))

