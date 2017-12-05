install.packages("C50")

Titanic <- read.csv('/Users/JamesJz/Documents/Class/CS513/Titanic_rows.csv')

library('C50')

?C5.0
?system
mytree<-C5.0( Survived~.,data = Titanic)
summary(mytree)
mytree
plot(mytree)

Forest_data <- read.csv("/Users/JamesJz/Documents/Class/CS513/forest_data_example.csv")
mytree2<-C5.0( Target~F1+F2,data = Forest_data)
plot(mytree2)

mytree3<-C5.0( Target~F3+F4,data = Forest_data)
plot(mytree3)

mytree4<-C5.0( Target~F2+F3,data = Forest_data)
plot(mytree4)

install.packages("randomForest")
library(randomForest)
set.seed(321)

index <- seq(1,nrow(Titanic), by = 5)

test <- Titanic[index,]

training <- Titanic[-index,]

fit <- randomForest(Survived~., data= Titanic, importance =TRUE,ntree = 2000)
importance(fit)
varImpPlot(fit)
Prediction<- predict(fit,test)
# table(actual test[-4])
