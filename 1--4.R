data_values <- c(11, 13, 13, 15, 15, 16, 19, 20, 20, 20, 21, 21, 22, 23, 24, 30, 40, 45, 45, 45, 71, 72, 73, 75)
num_bins <- 4
bin_means <- function(data, num_bins) {
  bins <- split(data, cut(data, num_bins, include.lowest = TRUE))
  smoothed_data <- unlist(lapply(bins, function(bin) rep(mean(bin), length(bin))))
  return(smoothed_data)
}
bin_medians <- function(data, num_bins) {
  bins <- split(data, cut(data, num_bins, include.lowest = TRUE))
  smoothed_data <- unlist(lapply(bins, function(bin) rep(median(bin), length(bin))))
  return(smoothed_data)
}
bin_boundaries <- function(data, num_bins) {
  bins <- split(data, cut(data, num_bins, include.lowest = TRUE))
  smoothed_data <- unlist(lapply(bins, function(bin) {
    bin_min <- min(bin)
    bin_max <- max(bin)
    sapply(bin, function(x) ifelse(abs(x - bin_min) < abs(x - bin_max), bin_min, bin_max))
  }))
  return(smoothed_data)
}
smoothed_by_mean <- bin_means(data_values, num_bins)
print("Smoothing by Bin Mean:")
print(smoothed_by_mean)
smoothed_by_median <- bin_medians(data_values, num_bins)
print("Smoothing by Bin Median:")
print(smoothed_by_median)
smoothed_by_boundaries <- bin_boundaries(data_values, num_bins)
print("Smoothing by Bin Boundaries:")
print(smoothed_by_boundaries)
