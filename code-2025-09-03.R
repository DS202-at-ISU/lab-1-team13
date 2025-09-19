library(classdata)
fbi

crime_counts <- fbi[fbi$type == "homicide", "count"]
mean(crime_counts, na.rm = TRUE)
sd(crime_counts, na.rm = TRUE)

compute_mean_sd <- function(crime_type){
  crime_counts <- fbi[fbi$type == crime_type, "count"]
  mean_result <- mean(crime_counts, na.rm = TRUE)
  sd_result <- sd(crime_counts, na.rm = TRUE)
  
  result <- data.frame(
    type = crime_type, 
    mean = mean_result, 
    sd_result = sd_result
  )
  
  return(result)
}

compute_mean_sd("homicide")

crime_types <- unique(fbi$type)

compute_all_mean_sd <- function(typeList){
  results <- lapply(typeList, compute_mean_sd)
  do.call(rbind, results)
}

compute_all_mean_sd(crime_types)
