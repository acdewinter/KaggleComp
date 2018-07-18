# =====================================================================================================================
# = Kaggle: Home Credit Default Risk                                                                                  =
# =                                                                                                                   =
# = Author: Andrew B. Collier <andrew@exegetic.biz> | @datawookie                                                     =
# =====================================================================================================================

#Competition page: https://www.kaggle.com/c/home-credit-default-risk

# STAGE 1 -------------------------------------------------------------------------------------------------------------

#- Download the data.
#- Create a simple model using the data from application_train.csv
#- Generate a submission using application_test.csv
library(readr)
library(ISLR)
library(ROCR)
library(Epi)
library(vcdExtra)
library(MASS)
library(mlbench)
library(ggplot2)
library(dplyr)
library(exegetic)
set.seed(42)


## TRAIN TEST SPLIT ##

index <- sample(c("train", "test"), nrow(orig_data), replace = TRUE, prob = c(0.8,0.2))
orig_data.split <- split(orig_data, index)
train_data <- orig_data.split$train
test_data <- orig_data.split$test


## BUILD MODEL ##

fit <- glm(TARGET ~ NAME_CONTRACT_TYPE + CODE_GENDER + FLAG_OWN_CAR + CNT_CHILDREN + AMT_CREDIT + income_credit_ratio, data = train_data, family = binomial)
summary(fit)

## VALIDATE MODEL ##

test_data.predictions <- predict(fit, test_data, type = "response")

pred <- prediction(test_data.predictions, test_data$TARGET) 
perf <- performance(pred, measure = "auc")
print(paste("AUC: ", perf@y.values[[1]]))

