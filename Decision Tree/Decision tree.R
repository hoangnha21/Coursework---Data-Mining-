# We use the Carseats data from ISLR package to build a decision tree model
library(ISLR)
data("Carseats")
attach(Carseats)
View(Carseats)

# The target variable in Carseats data ("Sales") is numerical
# To construct a calssification model we introduce a new variable "High"
# that indicates where Sales in high (higher than 8) or not. So "High" is a binary variable.
# Please keep this in mind, you do not have to follow this step for other data sets.
High <- ifelse(Sales >8, "Yes", "No")
Carseats$High <- as.factor(High)
data <- Carseats[-1]

# Partitioning data into train and test data
indx <- sample(2, nrow(data), replace= TRUE, prob = c(0.8, 0.2))
train <- data[indx == 1,  ]
nrow(train)
test <- data[indx == 2, ]

# To build a decision tree model we use the "rpart" function from "rpart" package.
# The first and second arguments to the rpart function are respectively the formula and training data.
# Formula (Target ~ Inputs) determines which variable is the target variable and which variables are input variables.
# install.packages("rpart")
library(rpart)
tree_model <- rpart(High ~ ., train)

# We can access the decision rules in the decision tree model using the print() functions.
print(tree_model)

# To plot an rpart decision tree we can use the "rpart.plot()" function from "rpart.plot" package.
library(rpart.plot)
rpart.plot(tree_model)

# To obtain the predicted classes or predicted probabilities we can use the "predict" function.
tree_pred_prob <- predict(tree_model, train)
tree_pred_prob <- predict(tree_model, train, type = "prob")
tree_pred_class <- predict(tree_model, train, type = "class")

# Error rate of the decision tree model on training data
mean(tree_pred_class != train$High)

# Error rate of the decision tree model on test data
tree_pred_test <- predict(tree_model, test, type = "class")
mean(tree_pred_test != test$High)

# Changing the parameters of rpart
# We can choose the type of the tree (c5 or c&R) by setting the type of the split in the "parms" argument
# parms = list(split = "information") or parms = list(split = "gini")
# We can also modify the pre-pruning options in the rpart.control
tree_model2 <- rpart(High ~ ., train, parms = list(split = "information"), control = rpart.control(minbucket = 0, minsplit = 0, cp = -1))
rpart.plot(tree_model2)



