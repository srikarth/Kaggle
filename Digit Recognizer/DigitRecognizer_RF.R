library(randomForest)
library(readr)
set.seed(0)
train <- read.csv("./train.csv")
test <- read.csv("./test.csv")

set.seed(0)

numTrain <- 10000
numTrees <- 25

rows <- sample(1:nrow(train), numTrain)
#labels <- as.factor(train[rows,1])
labels = as.factor(train[rows,]$label)
train <- train[rows,-1]

rf <- randomForest(train, labels, xtest=test, ntree=numTrees)
predictions <- data.frame(ImageId=1:nrow(test), Label=levels(labels)[rf$test$predicted])
head(predictions)

write_csv(predictions, "rf_predictions.csv") 


data <- read.csv("rf_predictions.csv")
head(data)
data
