#SENTIMENT ANALYSIS FOREIGN PRESS ABOUT FDI
#check all the robots.txt on the websites

#preparation
library(tidyverse)
library(rvest)
library(httr)
library(curl)
library(here)
library(stringr)
library(RCurl)

#download page BBC
url <- "https://www.bbc.com/news/world-europe-63029909"
email <- "marazzinimatilde@gmail.com"
ua <- R.Version()$version.string
sitedwl <- RCurl::getURL(url, 
                         httpheader = c(From = email, `User-Agent` = ua))

download.file(url, destfile = here::here("BCC.html"))

x <- read_html("https://www.bbc.com/news/world-europe-63029909") %>%
  html_elements(css = ".eq5iqo00 , #main-heading")
  html_text()
  
BBC <- html_text(x, trim = FALSE)
