
library(jsonlite)

first_page <- 'https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=1&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D'

five_star_finishers <- 'https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=1&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%225%22%7D'
six_star_finishers <- 'https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=1&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%226%22%7D'


fs_data <- read_json(five_star_finishers)
fs_total_results <- fs_data$totalObjectsCount

fs_total_pages <- ceiling(fs_total_results/20)
fs_total_calls_required <- ceiling(fs_total_pages/25)

# Pull 25 pages at a time, so 500 results per call
fs_calls <- 1:fs_total_calls_required
fs_start_page <- 1 + (fs_calls-1)*25
fs_end_page <- 25*fs_calls

ss_data <- read_json(six_star_finishers)
ss_total_results <- ss_data$totalObjectsCount

ss_total_pages <- ceiling(ss_total_results/20)
ss_total_calls_required <- ceiling(ss_total_pages/25)

# Pull 25 pages at a time, so 500 results per call
ss_calls <- 1:ss_total_calls_required
ss_start_page <- 1 + (ss_calls-1)*25
ss_end_page <- 25*ss_calls

#wmm_call_list <- paste0('https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more'
#                        ,'&pageStart=',start_page
#                        ,'&pageEnd=',end_page
#                        ,'&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D')

five_star_call_list <- paste0('https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more'
                             ,'&pageStart=',fs_start_page
                             ,'&pageEnd=',fs_end_page
                             ,'&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%225%22%7D')


six_star_call_list <- paste0('https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more'
                        ,'&pageStart=',ss_start_page
                        ,'&pageEnd=',ss_end_page
                        ,'&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%226%22%7D')


#write.csv(wmm_call_list,"data/wmm_call_list.csv",row.names = F)
write.csv(five_star_call_list,"data/wmm_five_star_call_list.csv",row.names = F)
write.csv(six_star_call_list,"data/wmm_six_star_call_list.csv",row.names = F)
