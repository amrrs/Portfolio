# WineQuality.R
# Methods: Machine Learning
# Owen Thompson
# octhompson19@gmail.com
#
# Dataset Citation:
# P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. 
# Modeling wine preferences by data mining from physicochemical properties.
# In Decision Support Systems, Elsevier, 47(4):547-553. ISSN: 0167-9236.

library(readr)
qual_white_csv <- read_delim("~/Dropbox/Data/winequality-white.csv", 
                         ";", escape_double = FALSE, trim_ws = TRUE)
qual_red_csv <- read_delim("~/Dropbox/Data/winequality-red.csv", 
                         ";", escape_double = FALSE, trim_ws = TRUE)
qual_red <- data.frame(qual_red_csv)
qual_white <- data.frame(qual_white_csv)

# There are 1599 instances of red wine and 4898 instances of white wine.
# Author noted: it is likely that several of the attributes are correlated and feature selection is recommended.

# Investigating the datasets
summary(qual_red)

# SPLOM
pairs(qual_red,
      lower.panel = NULL,
      cex.labels=1, pch=19, cex = .5)


install.packages("dendextend")
d_qual_red <- dist(qual_red) # method="man" # is a bit better
hc_qual_red <- hclust(d_qual_red, method = "complete")
red_qual <- rev(levels(qual_red[,12]))
plot(dend)
x_red <- qual_red[,1:11]
y_red <- qual_red[,12]
x_white <- qual_white[,1:11]
y_white <- qual_white[,12]

# Histogram Matrices

par(mfrow=c(2,6))     # Red
for(i in 1:12) {
  hist(qual_red[,i], main=names(qual_red)[i])
}

par(mfrow=c(2,6))     # White
for(i in 1:12) {
  hist(qual_white[,i], main=names(qual_white)[i])
}

#
library(ggplot2)
library(psych)
library(caret)
install.packages("ellipse")

pairs(qual_red, lower.panel = NULL, cex = .5, pch = 19)

#scales <- list(x=list(relation="free"), y=list(relation="free"))
#featurePlot(x= qual_red, y= y_red, pch = 19, cex = .5, plot = "density", scales=scales)
#featurePlot(x = x_red, y = y_red, plot = "density", scales=scales)
#
#
# Select 80% of each wine to train quality; remaining 20% will test the model.
#
# Red:
# Select 80% of the rows in the original dataset for training
red_val_index <- createDataPartition(qual_red$quality, p=0.80, list=FALSE)
# Select remaining 20% of the data for validation
red_val <- qual_red[-red_val_index,]
# Use the remaining 80% of data to training and testing the models
red <- qual_red[red_val_index,]
#
#
# White:
# Select 80% of the rows in the original dataset for training
white_val_index <- createDataPartition(qual_white$quality, p=0.80, list=FALSE)
# Select remaining 20% of the data for validation
white_val <- qual_white[-white_val_index,]
# Use the remaining 80% of data to training and testing the models
white <- qual_white[white_val_index,]

# Use cross-validation to test accuracy. Dataset will be split into 20 groups: 9 trained, 1 tested.
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"
