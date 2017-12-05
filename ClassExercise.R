myfirstname <-"james";
mylastname <- "zhang";
myfirstname
mylastname

myfirstlast<-c(myfirstname, mylastname);
myfirstlast

avector<-c(1,2,3,4)
avector

names(avector)<-c("one","two","three","four");
avector

typeof(avector)
elementnames<- names(avector)

## vector #######################
x<- 1:9
mode(x)
typeof(x)
is.vector(x)
length(x)

## factor ########################
?factor()

cat<-c("good","bad")
typeof(cat)
cat2<-factor(cat)

cat2
typeof(cat2)

cat3<- factor(cat,levels = (c("good", "bad")))
cat3
catnumb<-as.numeric(cat3)

##################################

days<-c("Monday", "Tuesday","Wednesday", "Thursday", "Saturday", "Sunday");
days

day<- factor(days)
day

## matrix #########################

x<-1:9
?matrix()

is.matrix(x)

mxl <- matrix(x,nrow = 3, ncol = 3, byrow = TRUE)
is.matrix(mxl)
mxl

colnames(mxl)<-c("col1", "col2", "col3")

## dimnames(mxl) <- list(c("a","b","c",)


mxl<-matrix(1:9, nrow = 3, ncol = 3, byrow = FALSE)




















