# Logistic regression

library(ISLR)
data("Carseats")
attach(Carseats)

High <- as.factor(ifelse(Sales >= 8, "YES", "NO"))
Data <- data.frame(Carseats, High)
Data <- Data[, -1]
colnames(Data)[11] <- "Target"

# Specifying the reference class in logistic regression model
# The predict function computes the predicted probabilities for the class that is NOT the reference class
Data$Target <- relevel(Data$Target, ref = "NO")

# Dividing the dataset into train and test data
indx <- sample(2, nrow(Data), replace = TRUE, prob= c(0.8, 0.2))
train <- Data[indx == 1, ]
test <- Data[indx == 2, ]

# We can construct the logistic regression model using glm() function
LogitModel <- glm(Target ~ ., data = train, family = "binomial")
summary(LogitModel)

# we can apply the variable selection techniques to reduce the number of input variables using step() function
null <- glm(Target ~ 1, data = train, family = "binomial")
full <- glm(Target ~ ., data = train, family = "binomial")

step(null, scope = list(lower = null, upper = full), direction = "both")

# To get the predicted probabilities on test instances (or any other datasets)
# we use the predict() function. 
# In logistic regression model the "type" must be "response" which returns the predicted probabilities
pred_prob <- predict(LogitModel , newdata = test, type = "response")

# To get the predicted classes we use ifelse() function.
Class <- ifelse(pred_prob > 0.5, "YES", "NO")
Class <- as.factor(Class)

# You can get the confusion matrix for the logit model using table()
# the table() function requires the true labels and the predicted labels
table(test$Target, Class, dnn = c("Actual", "Predicted"))

# You can also use the confusionMatrix() function from caret package 
# install.packages("caret")
library(caret)
confusionMatrix(data = Class, reference = test$Target, positive = "YES")
