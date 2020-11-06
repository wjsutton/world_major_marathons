
library(dplyr)

six_star <- read.csv('data/six_star_marathon_results.csv', stringsAsFactors = F)
five_star <- read.csv('data/five_star_marathon_results.csv', stringsAsFactors = F)

six_star$stars <- 6
five_star$stars <- 5

wmm_df <- rbind(six_star,five_star)

tokyo <- cbind(wmm_df[,1:4]
              ,stars = wmm_df$stars
              ,marathon = 'Tokyo'
              ,marathon_year = wmm_df$toyko_year
              ,marathon_time = wmm_df$toyko_time)

chicago <- cbind(wmm_df[,1:4]
                ,stars = wmm_df$stars
                ,marathon = 'Chicago'
                ,marathon_year = wmm_df$chicago_year
                ,marathon_time = wmm_df$chicago_time)

berlin <- cbind(wmm_df[,1:4]
               ,stars = wmm_df$stars
               ,marathon = 'Berlin'
               ,marathon_year = wmm_df$berlin_year
               ,marathon_time = wmm_df$berlin_time)

newyorkcity <- cbind(wmm_df[,1:4]
                    ,stars = wmm_df$stars
                    ,marathon = 'New York City'
                    ,marathon_year = wmm_df$newyorkcity_year
                    ,marathon_time = wmm_df$newyorkcity_time)

boston <- cbind(wmm_df[,1:4]
               ,stars = wmm_df$stars
               ,marathon = 'Boston'
               ,marathon_year = wmm_df$boston_year
               ,marathon_time = wmm_df$boston_time)

london <- cbind(wmm_df[,1:4]
               ,stars = wmm_df$stars
               ,marathon = 'London'
               ,marathon_year = wmm_df$london_year
               ,marathon_time = wmm_df$london_time)


pivot <- rbind(tokyo,chicago,berlin,newyorkcity,boston,london)
pivot$marathon_time <- substr(pivot$marathon_time,1,7)

pivot$marathon_time_in_seconds <- as.integer(substr(pivot$marathon_time,1,1))*60*60 + as.integer(substr(pivot$marathon_time,3,4))*60 + as.integer(substr(pivot$marathon_time,6,7))
runners_under_2_hours <- unique((pivot %>% filter(marathon_time_in_seconds <= 7200))$runner_id)
pivot_marathon_only <-  subset(pivot, !(runner_id %in% runners_under_2_hours))

write.csv(pivot_marathon_only,"data/wmm_marathon_results_pivot.csv", row.names = F)

