install.packages('e1071', dependencies = TRUE)
library(e1071)
library(class)

#read the data
data <- read.csv("/Users/JamesJz/Documents/Class/CS513/Titanic_rows.csv")
class(Titanic_rows)
table(class = Titanic_rows$Class, Survival = Titanic_rows$Survived)
ftable()