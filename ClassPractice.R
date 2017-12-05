# First Name
# Last Name
# Id
# Date
# Comments


x<-c(10,5,6,6,6,7)
x
mode(x)
min(x,na.rm=TRUE)
max(x,na.rm=TRUE)
mean(x,na.rm = TRUE)


hello<-"Hello World"
length(hello)
mode(hello)



x2<-c(1,2,3,4)
x2

x3<- (x+x2)

x
x2
x3



x4<- c(1,2,3,4,5,6)
mode(x4)
typeof(x4)

x5<- seq(from=1, to=6, by=1)
typeof(x5)
x5

x6<- 1:6
x6
typeof(x6)

x7<- as.integer(x5)
typeof(x7)


mixed_vector<-c(1,2,8.5,'5')
mode(mixed_vector)
typeof(mixed_vector)

ls()
?rm()

objects<- ls()
?rm()
rm(list=ls())






















