
library(jsonlite)

#calls <- read.csv('data/wmm_call_list.csv',stringsAsFactors = F)
calls <- read.csv('data/wmm_six_star_call_list.csv',stringsAsFactors = F)


for(a in seq_along(calls$x)){
  hof_ajax <- calls$x[a]
  Sys.sleep(30)
  data <- read_json(hof_ajax)
  d1 <- data$objects
  
  if(a == 1){
    output <- d1
  }
  if(a != 1){
    output <- c(output,d1)
  }
  print(paste0(a," done!"))
}

#saveRDS(output,"data/raw_data_output.RDS")
saveRDS(output,"data/raw_six_star_data_output.RDS")
