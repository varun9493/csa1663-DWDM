age <- c(23, 23, 27, 27, 39, 41, 47, 49, 50, 52, 54, 54, 56, 57, 58, 58, 60, 61)
value_to_normalize <- 35
sd_age <- 12.94
min_age <- min(age)
max_age <- max(age)
min_max_normalized <- (value_to_normalize - min_age) / (max_age - min_age)
cat("Min-Max Normalized Value:", min_max_normalized, "\n")
mean_age <- mean(age)
z_score_normalized <- (value_to_normalize - mean_age) / sd_age
cat("Z-Score Normalized Value:", z_score_normalized, "\n")
max_abs_age <- max(abs(age))
j <- ceiling(log10(max_abs_age))
decimal_scaled_normalized <- value_to_normalize / (10^j)
cat("Decimal Scaled Normalized Value:", decimal_scaled_normalized, "\n")
