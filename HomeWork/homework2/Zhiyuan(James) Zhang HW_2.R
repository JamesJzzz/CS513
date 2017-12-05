# Zhiyuan(James) Zhang
# Sep 24 2016
# I pledge my honor that I have abided by the Stevens Honor System. 
x<-c(1,2,3)
y<-c(11,12,13,14,15,16)

z<-x+y
print(z)

#Because the length of the two vectors are different.

#so it add 1,2,3 to 11,12,13, and then add 1,2,3 to 14,15,16 again.

myFirstName <- c("Zhiyuan(James)")
myLastName <- c("Zhang")
myID<-c(10399976)

print(length(myLastName))
print(typeof(myLastName))

# the length is 1 because it recognize the entire string as 
# characters and there is only one string so the length is 1

myinfo<-c(myLastName,myFirstName,myID)

print(myinfo)
print(length(myinfo))
print(typeof(myinfo))

rm(myFirstName)
print(myinfo)

info<-c("fname1","fname2","lname1","lname2",1111,2222)
roster<-matrix(info,nrow=2, ncol = 3,byrow = FALSE)
colnames(roster)<-c("First","Last","ID")
View(roster)


rm(list=ls())



