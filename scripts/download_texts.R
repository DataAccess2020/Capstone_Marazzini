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

#download text BBC
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

#download text NYT
y <- read_html("https://www.nytimes.com/2022/09/25/world/europe/italy-meloni-prime-minister.html") %>%
  html_elements(css = ".evys1bk0 , .css-by6x3t , .e1h9rw200")
html_text()

NYT <- html_text(y, trim = FALSE)

view(NYT)

#download text CNN
z <- read_html("https://edition.cnn.com/2022/09/25/europe/italy-election-results-intl/index.html") %>%
  html_elements(css = ".inline-placeholder")
html_text()

CNN <- html_text(z, trim = FALSE)

#download text Guardian
r <- read_html("https://www.theguardian.com/world/2022/sep/25/italy-elections-exit-polls-point-to-victory-for-coalition-led-by-far-right-giorgia-meloni") %>%
  html_elements(css = ".dcr-2v2zi4 , .dcr-ai6lo6 p , .dcr-6rhr0p")


Grd <- html_text(r, trim = FALSE)

#download text WashingtonPost
w <- read_html("https://www.washingtonpost.com/world/2022/09/25/italy-election-results-meloni-right/")
   html_elements(css = ".font-copy , #main-content span")

wp <- html_text(w, trim = FALSE)
view(wp)
