target_predictions <- predict(fit, submit_data, type = "prob")[,1]

submit_data$TARGET <- target_predictions

submit_data %>%
  select(SK_ID_CURR, TARGET) %>%
  write.csv("submission-file.csv", quote = FALSE, row.names = FALSE)

# Kaggle submission code.
#
# - Generate predictions, ask for probabilities and retain only "yes" probability.
#
target_predictions <- predict(fit, submit_data, type = "prob")[,1]
#
# Add a TARGET column to the submit data.
#
submit_data$TARGET <- target_predictions
#
# Create a CSV file in the correct format.
#
submit_data %>%
  select(SK_ID_CURR, TARGET) %>%
  write.csv("submission-file.csv", quote = FALSE, row.names = FALSE)
