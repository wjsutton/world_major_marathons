
#library(rvest)
#library(dplyr)
library(jsonlite)
#library(RJSONIO)
#library(stringr)

#hof <- 'https://www.worldmarathonmajors.com/hall-of-fame/'
#hof_html <- read_html(hof)

#first_page <- 'https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=1&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D'
#first_ten_pages <- 'https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=10&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D'


hof_ajax <- 'https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=10&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D'
data <- read_json(hof_ajax)
d1 <- data$objects

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

write.csv(marathon_results,"data/marathon_results_sample.csv", row.names = F)

