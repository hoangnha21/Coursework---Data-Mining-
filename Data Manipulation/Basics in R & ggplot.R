x <- 2
x <- c(1, 5, 3, 8)
y <- c(5, 2)
z <- x + y
z^2
2 * z

install.packages("ISLR")
library(ISLR)
data("Carseats")
?Carseats
View(Carseats)
dim(Carseats)
names(Carseats)
str(Carseats)

Carseats$Sales
min(Carseats$Sales)
max(Carseats$Sales)

attach(Carseats)
mean(Sales)
sd(Sales)

Carseats[1:5,"Sales"]
Carseats[20:30,"Sales"]
Carseats[1:5, 1]
Carseats$Sales[1:5]
Carseats[, "Sales"]

install.packages("ggplot2")
library(ggplot2)
ggplot(data = Carseats, mapping = aes(x = Price, y = Sales))+ 
  geom_point(size = 1)+
  geom_line(color = "red")+
  ggtitle("Scatter plot of size and price")+
  labs(x = "Sales points", y = "Price points")

ggplot(Carseats, aes(Sales))+
  geom_histogram(fill = "blue", color = "yellow", binwidth = 0.3)+
  labs(y ="Frequency")+
  ggtitle("Histogram of Sales")

library(tidyverse)
Carseats %>% ggplot(aes(ShelveLoc)) +
  geom_bar(fill = c("yellow", "blue", "red"))
