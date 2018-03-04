# Written with the guidance of Machine Learning Mastery
# https://machinelearningmastery.com/machine-learning-in-r-step-by-step/
install.packages("caret")
library(caret)
install.packages('e1071', dependencies=TRUE)
#
#
# Section 1: Load Data
#     Use famous Iris dataset
#     Load data and define two groups: testing, validation.
# Load dataset
data("iris")
dataset <- iris
# Select 80% of the rows in the original dataset for training
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
# Select remaining 20% of the data for validation
validation <- dataset[-validation_index,]
# Use the remaining 80% of data to training and testing the models
dataset <- dataset[validation_index,]
#
#
# Section 2: Summarize the Data
str(dataset)
# Summarize the Species distribution
table(dataset$Species)
summary(dataset)          # Note: Numeric variables have the same scale and similar ranges [0,8](cm).
#
#
#Section 3: Visualize Dataset
# Separte the input attributes from the output attribute 
x <- dataset[,1:4]        # Sepal Length, Sepal Width, Petal Length, Petal Width
y <- dataset[,5]          # Species
# View boxplot for each attribute
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(x[,i], main=names(iris)[i])
}
# Scatterplot Matrix
library(ggplot2)
library(psych)
my_cols <- c("#00AFBB", "#E7B800", "#FC4E07")     #Select colors
pairs(x, col = my_cols[dataset$Species], lower.panel = NULL)
# Box and wisker plot for each attribute
featurePlot(x=x, y=y, plot="box")
# Density plots for each attribute by species
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, pch = 19, cex = .5, plot="density", scales=scales)
#
#
# Section 4: Create models
# To test accuracy, use crossvalidation. Split dataset into 10 groups: train 9 and test on 1.
# Repeat process 3 times for each algorithm with different splits of data to insure accuracy.
# Run algorithms using 10-fold cross validation using 5 different models - a combination of linear, non-linear, and complex models.
# 1.) Linear Discriminant Analysis (LDA)
# 2.) Classification and Regression Trees (CART)
# 3.) k-Nearest Neighbors (kNN)
# 4.) Support Vector Machines (SVM) with linear kernal
# 5.) Random Forest (RF)
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"
# a.) Linear algorithm
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)
#
# b.) Nonlinear algorithms
# CART
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)
# kNN
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)
#
# c.) Complex algorithms
# SVM
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)
#
#
# View estimations and compare 5 models to determine the most accurate.
# Create list of models and summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)
dotplot(results)
#
#
# LDA appears to be the most accurate model.
# Summarize Best Model: Linear Discriminant Analysis
print(fit.lda)
#
#
# Section 6: Make Predictions
# Estimate LDA quality on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species) # 96.67% accuracy
