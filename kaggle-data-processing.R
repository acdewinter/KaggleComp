library(dplyr)
orig_data <- read.csv("application_train.csv")
submit_data <- read.csv("application_test.csv")
preprocessdata <- function(df) { df %>% mutate(
  income_credit_ratio = AMT_INCOME_TOTAL / AMT_CREDIT
)
}
orig_data <- preprocessdata(orig_data)
submit_data <- preprocessdata(submit_data)


orig_data <- orig_data %>% mutate(
TARGET = factor(TARGET, levels = c(1,0), labels = c("yes", "no"))
)
