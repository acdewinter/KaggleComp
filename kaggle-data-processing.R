library(dplyr)
orig_data <- read.csv("application_train.csv")
submit_data <- read.csv("application_test.csv")
orig_data <- orig_data %>% mutate(
  income_credit_ratio = AMT_INCOME_TOTAL / AMT_CREDIT
)
