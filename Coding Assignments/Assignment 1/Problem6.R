data("mtcars")
#b
install.packages("ggplot2")
library(ggplot2)
data(mtcars)

#c
mtcars$am <- factor(mtcars$am, levels=c(0,1), labels=c("Automatic","Manual"))


ggplot(data= mtcars,mapping= aes(x=am, y=qsec), fill=am)+
  ggtitle("1/4 Mile Time For Each Transmission Type")+
  geom_boxplot(aes(fill=am), outlier.colour = "red")+
  labs( x= "", y="1/4 Mile Time")+
  theme(plot.title = element_text(color="red", size=14, face="bold.italic"))+
  scale_fill_discrete(name="Transmission Type")

#d
ggplot(data=mtcars,aes(x=gear))+geom_bar(stat="count")

#e
ggplot(data=mtcars, aes(x = factor(cyl), fill = factor(gear))) +  
  xlab("Number of Cyl") +
  ylab("Gear Type") +
  geom_bar()
#f
ggplot(data=mtcars, aes(x = wt, y = mpg)) +
  xlab("wt") + ylab("mpg") +
  geom_point() +
  ggtitle("Relationship between wt and mpg")


#g
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(size=4) +
  geom_smooth(se=TRUE, color="red") +
  labs(title="Relationship Between Miles Per Gallon and Weight",
       x="Weight", y="Miles Per Gallon")

#h
mtcars$cyl <- as.factor(mtcars$cyl) 

ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl, color=cyl)) +
  geom_point(size=4) +
  labs(title="Relationship Between Miles Per Gallon and Weight",
       x="Weight", y="Miles Per Gallon")
