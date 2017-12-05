getwd()
setwd("/Users/katieprescott/Desktop/hw1")

df <- read.csv('Titanic_rows.csv', header = TRUE, sep = ',')

#a. probability passenger survived:
summary(df$Survived)
## yes/total = 711/2201 = 32.3%

#b. probability passenger was first class:
summary(df$Class)
## first/total = 325/2201 = 14.77%

newdf = subset(df, select=c("Survived", "Sex"))

newdata <- newdf[ which(newdf$Survived=='Yes' 
                         & newdf$Sex == 'Female'), ]

#c. probability passenger was female and survived
summary(newdata)
## number/total = 344/2201 = 15.6%

#d. given passenger survived, probability was female
## (answer to c)/(answer to a) = (.1563/.323) = 48.39%

#e. are survival and staying in first class independent?
## P(firstclass|survived) ==? P(survived) -> 28.55% != 32.3%
## NO

survivedf = subset(df, select = c("Survived", "Class"))
survivedata <- survivedf[ which(survivedf$Survived == 'Yes'
                                & survivedf$Class == '1st'), ]
summary(survivedata)

#f. given survival, probability that passenger was first class female?
## (first class female survivors)/(first class survivors) = 141/203 = 69.46%
firstclass = subset(df, select = c("Survived", "Class", "Sex"))
firstclassdata <- firstclass[ which(firstclass$Survived == 'Yes'
                                    & firstclass$Class == '1st'), ]

summary(firstclassdata)

#g. see d

#h. given survival, what is probability of frst class
## (first class survivors)/(survivors) = 203/711 = 28.55%

#i. given survival, are being female and first class independent
## NOT independent -> (141/711) != (203/711) -> 19.8% != 28.55%
newfirstclass = subset(df, select = c("Survived", "Class", "Sex"))
newfirstclassdata <- newfirstclass[ which(newfirstclass$Survived == 'Yes'
                                    & newfirstclass$Sex == 'Female'), ]

summary(newfirstclassdata)



