# We use the "Carseats" data set from the ISLR package to construct a KNN model

library(ISLR)
data("Carseats")
# Lets rename our data-frame to Data
Data <- Carseats
attach(Data)

# Introducing a categorical target variable
Data$Sales <- as.factor(ifelse(Sales >= 8, "High", "Low"))


# Check if the data requires balancing
table(Data$Sales)
mean(Data$Sales == "High")
mean(Data$Sales == "Low")

# Identify numerical variables
myscale <- function(x)
{
(x - min(x))/(max(x) - min(x))  
}


# Normalizing the numerical variables
library(dplyr)
Data <- mutate_if(Data, is.numeric, myscale)
summary(Data)

str(Data)
# The inputs to the knn model must be numerical
# Converting factor variables to numerical variables using dummies
library(fastDummies)
# Introducing dummies for selected factor variables (we keep the target variable as factor)
Data <- dummy_cols(Data.scaled, select_columns = c('ShelveLoc', 'Urban', 'US'))
# Removing the original factor variables
Data <- Data[, -c(7, 10, 11)]
str(Data)


#split data into training and testing
# Notice that when partitioning the data set into train and test data we exclude the target variable
set.seed(1234)
ind <- sample(2, nrow(Data), replace=TRUE, prob=c(0.67, 0.33)) 
trainData <- Data[ind==1, -1]
testData <- Data[ind==2, -1] 

# Storing the target variable separately
trainLabels <- Data[ind==1, 1]
testLabels <- Data[ind==2, 1] 

# using knn() function from FNN package
#install.packages("FNN")

library(FNN)
# For classification problem, we use knn
pred_class <- knn(train = trainData, test = testData, cl = trainLabels, k= 3, prob = T)
pred_class

# For regression problem, we use knn.reg
# pred_reg <- knn.reg(train = ..., test = ..., y = ..., k=3)
# pred_reg

# Finding k closest points to instance 20
indices <- attr(pred_class, "nn.index")
print(indices[20, ])

# Finding the distance of the k closest points to instance 20
dist <- attr(pred_class,"nn.dist")
print(dist[20, ])

# analyze the prediction
table <- table(pred_class ,testLabels)
table

# Cross-validation to obtain the best k
# We first need to split the training data to train and validation sets
set.seed(1234)
indx <- sample(2, nrow(trainData), replace=TRUE, prob=c(0.67, 0.33)) 
trainD <- trainData[indx==1, ]
validD <- trainData[indx==2, ] 

Tlabels <- trainLabels[indx == 1]
Vlabels <- trainLabels[indx == 2]

# We will construct the knn method for different values of k 
# in a for loop (k = 1, ...., 15)


accuracy <- c();

for (i in 1:15)
{
library(FNN)
prc_test_pred <- knn(train = trainD, test = validD, cl =Tlabels, k=i)
ConfusionMatrix <- table(Vlabels, prc_test_pred)
accuracy <- c(accuracy, sum(diag(ConfusionMatrix))/sum(ConfusionMatrix))
}

# Lets look at accuracy
accuracy

plot(accuracy, xlab = "k value", main = "Accuracy of knn model for different values of k")
