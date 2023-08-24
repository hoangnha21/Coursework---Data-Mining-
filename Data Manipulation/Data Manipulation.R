# Read the data set "Carseats" from ISLR package

library(ISLR)
data(Carseats)

# Look at the variables in the Carseats data
View(Carseats)
?Carseats

# Lets attach this dataset. This means that the Carseats data
# is searched by R when evaluating a variable, 
# so objects in the database can be accessed by simply 
# giving their names.
attach(Carseats)

# Look at all instances whose Sales is less than 8
Carseats[Sales < 8, ]

# Look at all instances whose Shelve location is "Good"
Carseats[ShelveLoc == "Good", ]

# Look at all instances whose Sales is less than 8 AND Shelve location is "Good"
Carseats[Sales < 8 & ShelveLoc == "Good", ]

# Look at all instances whose Sales is less than 4 AND Shelve location is either "Good" OR "Bad
Carseats[Sales < 4 & (ShelveLoc == "Good" | ShelveLoc == "Bad"), ]

# Lets do lines 17 and 26 using the filter function from the dplyr package
library(dplyr)
filter(Carseats, Sales < 8)
filter(Carseats, Sales < 4, ShelveLoc == "Good" | ShelveLoc == "Bad")

# Look at a subset of your data that only includes the variables
# "ShelveLoc", "US", and "Urban"
Carseats[, c("ShelveLoc", "US", "Urban")]

# Lets do Live 35 using the select function from the dplyr package
select(Carseats, ShelveLoc, US, Urban)
select(Carseats, CompPrice: Advertising, contains("Pop"))

# chaining method

Carseats %>% select(ShelveLoc, US, Urban)

x1 <- 1:5
x2 <- 2:6

# Try the following codes and see what they return
sum(x1)
sum(x1 - x2)
(x1-x2)^2
sum((x1 - x2)^2)
sqrt(sum((x1-x2)^2))

# chaining method for line 53:
(x1 - x2)^2 %>% sum() %>%
  sqrt()

# order returns a rearragement of the first argument into ascending or descenfing order
x <- c(1, 5, 2, 6, 8, 3, 9)
order(x) # returns the indises
x[order(x)] # returns vector x in an increasing order
x[order(x, decreasing = TRUE)]

# Look at variables ShelveLoc and Price and sort instances based on Price
Carseats[order(Price, decreasing = TRUE), c("ShelveLoc", "Price")]

# Lets do Live 66 using the arrange function from the dplyr package
Carseats %>% select(ShelveLoc, Price)%>%
  arrange(Price)

# Lets sort Price in a decreasing arrangement
Carseats %>% select(Sales, Price) %>%
  arrange(desc(Sales))

# Lets introduce a new variable Ratio which is the ratio of Price and CompPrice
Carseats$Ratio <- Price/CompPrice
Carseats[, c("Price", "CompPrice", "Ratio")]

# Lets do Live 77 and 78 using the mutate function from the dplyr package
Carseats %>% select(Price, CompPrice) %>%
  mutate(Ratio1 = Price/CompPrice) # mutate does not add the variable Ratio1 to the dataset

# Adding the variable to the data set
Carseats <- Carseats %>% mutate(Ratio1 = Price/CompPrice)

# Take the average of Price variable
mean(Price, na.rm = TRUE)

# Look at the average of price for all instances in each "Good","Bad", and "Medium" Shelve Location
Carseats  %>% group_by(ShelveLoc) %>% 
  summarise(mean(Price, na.rm = TRUE))

# Summary of today's lecture
# dyplr is an important package for data manipulation in R
# It simplifies writing and reading the R codes
# There are 5 basics functions in dplyr
# - filter: is used to subset a data frame retaining all rows that satisfy some conditions
# - select: is used to select variables in a data frame. You can select variables based on 
#           what they start with (starts_with()), what they end with (ends_with()), what they contain (contains()), and what they match to (matches())
# - arrange: is used to order the rows of a data frame by the values of selected columns
# - mutate: is used to add new variables as a function of other variables
# - summerise: is used to provide apply a given function to a selected group of instances