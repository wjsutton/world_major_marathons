
#d1 <- readRDS("data/raw_data_output.RDS")
d1 <- readRDS("data/raw_six_star_data_output.RDS")

for(i in seq_along(d1)){
  print(i)
  
  runner_id <- d1[[i]]$id
  name <- d1[[i]]$name
  profile_url <- d1[[i]]$url
  nationality <- d1[[i]]$nationality_iaaf
  
  toyko_time <- ifelse(length(d1[[i]]$stars[[1]])==2,
                       gsub('&nbsp;','',d1[[i]]$stars[[1]]$finish_time),
                       NA)
  
  chicago_time <- ifelse(length(d1[[i]]$stars[[2]])==2,
                         gsub('&nbsp;','',d1[[i]]$stars[[2]]$finish_time),
                         NA)
  
  berlin_time <- ifelse(length(d1[[i]]$stars[[3]])==2,
                        gsub('&nbsp;','',d1[[i]]$stars[[3]]$finish_time),
                        NA)
  
  newyorkcity_time <- ifelse(length(d1[[i]]$stars[[4]])==2,
                             gsub('&nbsp;','',d1[[i]]$stars[[4]]$finish_time),
                             NA)
  
  boston_time <- ifelse(length(d1[[i]]$stars[[5]])==2,
                        gsub('&nbsp;','',d1[[i]]$stars[[5]]$finish_time),
                        NA)
  
  london_time <- ifelse(length(d1[[i]]$stars[[6]])==2,
                        gsub('&nbsp;','',d1[[i]]$stars[[6]]$finish_time),
                        NA)
  
  
  toyko_year <- ifelse(length(d1[[i]]$stars[[1]])==2,
                       d1[[i]]$stars[[1]]$year,
                       NA)
  
  chicago_year <- ifelse(length(d1[[i]]$stars[[2]])==2,
                         d1[[i]]$stars[[2]]$year,
                         NA)
  berlin_year <- ifelse(length(d1[[i]]$stars[[3]])==2,
                        d1[[i]]$stars[[3]]$year,
                        NA)
  newyorkcity_year <- ifelse(length(d1[[i]]$stars[[4]])==2,
                             d1[[i]]$stars[[4]]$year,
                             NA)
  
  boston_year <- ifelse(length(d1[[i]]$stars[[5]])==2,
                        d1[[i]]$stars[[5]]$year,
                        NA)
  
  london_year <- ifelse(length(d1[[i]]$stars[[6]])==2,
                        d1[[i]]$stars[[6]]$year,
                        NA)
  
  df <- data.frame(
    runner_id,
    name,
    profile_url,
    nationality,
    toyko_time,
    chicago_time,
    berlin_time,
    newyorkcity_time,
    boston_time,
    london_time,
    toyko_year,
    chicago_year,
    berlin_year,
    newyorkcity_year,
    boston_year,
    london_year,
    stringsAsFactors = F
  )
  
  if(i == 1){
    marathon_results <- df
  }
  if(i != 1){
    marathon_results <- rbind(marathon_results,df)
  }
}

marathon_results <- unique(marathon_results)
#write.csv(marathon_results,"data/marathon_results.csv", row.names = F)
write.csv(marathon_results,"data/six_star_marathon_results.csv", row.names = F)
