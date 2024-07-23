age_intervals <- c("1-5", "5-15", "15-20", "20-50", "50-80", "80-110")
frequencies <- c(200, 450, 300, 1500, 700, 44)


age_data <- data.frame(
  lower_bound = c(1, 5, 15, 20, 50, 80),
  upper_bound = c(5, 15, 20, 50, 80, 110),
  frequency = frequencies
)

age_data$cumulative_frequency <- cumsum(age_data$frequency)

total_frequency <- sum(frequencies)

median_class_index <- which(age_data$cumulative_frequency >= total_frequency / 2)[1]

L <- age_data$lower_bound[median_class_index]
F <- age_data$frequency[median_class_index]
Cf <- ifelse(median_class_index == 1, 0, age_data$cumulative_frequency[median_class_index - 1])
h <- age_data$upper_bound[median_class_index] - age_data$lower_bound[median_class_index]

median <- L + ((total_frequency / 2 - Cf) / F) * h

print(paste("The approximate median is:", median))
