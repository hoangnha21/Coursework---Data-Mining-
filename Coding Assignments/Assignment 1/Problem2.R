#a
x=15;
y=c(1,2,3,10,100);
z=y*x;
print(z);
sum(z)

#b
b1=seq(0,10);
print(b1);
b2=seq(-5,5);
print(b2);

#c
c=seq(-3,3,by=0.1);
print(c)

#d
t <- c("mon","tue","wed","thu","fri","sat")
m <- c(90,80,50,20,5,20)
matrix(cbind(t,m),nrow=6,ncol=2, byrow=FALSE)
study <- matrix(cbind(t,m),nrow=6,ncol=2, byrow=FALSE)

#e
#we need to have age, sex, height, weight vectors 
age <- c(21,35,829,2)
sex <- c('m','f','m','e')
height <- c(181,173,171,166)
weight <- c(69,58,75,60)
df <- data.frame(age,sex,height,weight)

#Calculate the max and min value in column age
max(age, na.rm=TRUE)
min(age, na.rm=TRUE)


#generate a logical query  of age under 20 and above 80.
df$age[df$age<20 | df$age>80] 
#Set the age observations to NA
df$age[df$age<20 | df$age>80] <- NA

#calculate BMI
df$BMI <- df$weight/df$height
df
