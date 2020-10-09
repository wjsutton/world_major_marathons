
library(jsonlite)

first_page <- 'https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=1&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D'
data <- read_json(first_page)
total_results <- data$totalObjectsCount

total_pages <- ceiling(total_results/20)
total_calls_required <- ceiling(total_pages/25)

# Pull 25 pages at a time, so 500 results per call
calls <- 1:714
start_page <- 1 + (calls-1)*25
end_page <- 25*calls

wmm_call_list <- paste0('https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more'
                        ,'&pageStart=',start_page
                        ,'&pageEnd=',end_page
                        ,'&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D')

write.csv(wmm_call_list,"data/wmm_call_list.csv",row.names = F)
