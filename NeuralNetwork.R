# Neural network model

library(ISLR)
data("Carseats")
?Carseats
attach(Carseats)



library(dplyr)

myscale <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}
data <- Carseats %>% mutate_if(is.numeric, myscale)
summary(data)


set.seed(123)
indx <- sample(2, nrow(data), replace = T, prob = c(0.8, 0.2))
train <- data[indx == 1, ]
test <- data[indx == 2, ]

library(nnet)
nn  <- nnet(Sales ~ ., data = train, linout=T, size=10, decay=0.01)
#linout stands for linear out-put and is used to determine whether the target variable is continuous or not
#size sets the number of units in hidden layer
#decay is the regularization parameter. You can use any value between between zero and one

#Neural network model out put
summary(nn) #Summary gives you the number units in each layer in addition to all the weights

#To plot the neural network using nnet we need to use devtools
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')
plot.nnet(nn)
# The darker lines are associated to the higher weights and gray lines are for small weights

nn$wts #if you only want to look at weights you can use wts
nn$fitted.values # This will provide the predicted values for each instance for regression problem
                 # or predicted probabilities for the classification problems.
nn$residuals


# Using nnet model on the test data:
nn.preds <- predict(nn, test)
nn.preds
MSE <- mean((nn.preds - test$Sales)^2)
MSE
