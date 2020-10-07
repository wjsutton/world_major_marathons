
library(rvest)
library(dplyr)
library(jsonlite)
library(RJSONIO)
#library(stringr)

hof <- 'https://www.worldmarathonmajors.com/hall-of-fame/'
hof_html <- read_html(hof)

hof_ajax <- 'https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=1&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D'
data <- read_json(hof_ajax)

first_ten_pages <- 'https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=10&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D'
