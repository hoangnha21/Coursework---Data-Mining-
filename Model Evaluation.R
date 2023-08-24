'In this session we are going to practice how to draw
evaluation charts (Gain chart, response chart, lift chart, and ROC curve).
We use the dataset "Carseats" from ISLR package to do so.'
library(ISLR)
data("Carseats")
'We just rename the dataset to Data so that it is easier to understand how to modify this code for other 
datasets in the future.'
Data<-Carseats
attach(Data)



'We introduce the variable High to solve a classification problem as opposed to a regression problem.
So the variable High flags Sales to YES if its greater than 8 and to NO otherwise.'
High <- as.factor(ifelse(Sales >= 8, "YES", "No"))
# We add this variable to our dataset
Data <- data.frame(Data,High)
# We remove the variable Sales because Sales and High are highly correlated.
Data <- Data[,-1]
# We rename the target variable to Target
colnames(Data)[11] <- "Target"

# We partition the dataset into training and testing data
set.seed(2)
indx <- sample(2, nrow(Data), replace = TRUE, prob = c(0.8,0.2))
train_data <- Data[indx == 1,]
test_data <- Data[indx == 2 ,]

# Let's look at the evaluation charts for a decision tree model.
# We first construct a decision tree model. 
library(rpart)
mytree <- rpart(Target ~., data = train_data)
library(rpart.plot)
rpart.plot(mytree)
summary(mytree)

'To draw the charts we need predicted probabilities and the true values.
To obtain predicted probabilties we can use the predict() function'
pred_prob <- predict(mytree, newdata = test_data, type = "prob")
# Let's look at the probability of the "YES" class.
score <- pred_prob[,2 ]

# To draw the charts we use ROCR package.
# install.packages("ROCR")
library(ROCR)

# There are two functions in ROCR package that we need to draw charts: prediction() and performance()
# The prediciton() function requires the predicted probabilties (score) and true labels (Target variable)
pred <- prediction(score, test_data$Target)

# The first input of the performance() function is the output of the prediction() function. 
# performance (pred, "y-axis", "x-axis")

# Gain chart
perf <- performance(pred, "tpr", "rpp")
plot(perf)

# Response chart
perf <- performance(pred, "ppv", "rpp")
plot(perf)

# lift Chart
perf <- performance(pred, "lift", "rpp")
plot(perf)

# ROC Curve
perf <- performance(pred, "tpr", "fpr")
plot(perf)

# To obtain the auc (area under the ROC curve) we can use the following code:
auc <- performance(pred, "auc")
auc <- unlist(slot(auc, "y.values"))
auc
