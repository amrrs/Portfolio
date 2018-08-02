# PokerHands.R
# Owen Thompson
# octhompson19@gmail.com

options(max.print = 99999999)
# Poker Hand Dataset
### Initally created by Robert Cattral (cattral@gmail.com) and Franz Oppacher (oppacher@scs.carleton.ca)
### Released Jan 2007
## Taken from the UCI Machine Learning Repository
# ftp://ftp.ics.uci.edu/pub/machine-learning-databases/poker/poker-hand.names
# https://archive.ics.uci.edu/ml/machine-learning-databases/poker/poker-hand-testing.data
# https://archive.ics.uci.edu/ml/machine-learning-databases/poker/poker-hand-training-true.data
### Retrieve dataset from online source
test <- "https://archive.ics.uci.edu/ml/machine-learning-databases/poker/poker-hand-testing.data"
testfile <- read.csv(test, header = FALSE)
train <- "https://archive.ics.uci.edu/ml/machine-learning-databases/poker/poker-hand-training-true.data"
trainfile <- read.csv(train, header = FALSE)
## Add headers, set variable types, and set create dataframe
suit1 <- as.factor(testfile$V1)
suit2 <- as.factor(testfile$V3)
suit3 <- as.factor(testfile$V5)
suit4 <- as.factor(testfile$V7)
suit5 <- as.factor(testfile$V9)
hand <- as.factor(testfile$V11)
value1 <- testfile$V2
value2 <- testfile$V4
value3 <- testfile$V6
value4 <- testfile$V8
value5 <- testfile$V10
test<-data.frame(suit1, value1, suit2, value2, suit3, value3, suit4, value4, suit5, value5, hand)
suit1 <- as.factor(trainfile$V1)
suit2 <- as.factor(trainfile$V3)
suit3 <- as.factor(trainfile$V5)
suit4 <- as.factor(trainfile$V7)
suit5 <- as.factor(trainfile$V9)
hand <- as.factor(trainfile$V11)
value1 <- trainfile$V2
value2 <- trainfile$V4
value3 <- trainfile$V6
value4 <- trainfile$V8
value5 <- trainfile$V10
train<-data.frame(suit1, value1, suit2, value2, suit3, value3, suit4, value4, suit5, value5, hand)
# Investigate Datset
# Number of records and instances for each hand
table(train$hand)
table(test$hand)

summary(test)

y <- test[,11]
x <- test[,1:10]

# Random Forest
install.packages("ggplot2", type = "binary")
library(psych)
install.packages("caret", type="binary")
library(caret)
set.seed(7)
fit.rf <- caret::train(train$hand~.,data=train, method = "rf", metric=metric, trControl=control)
