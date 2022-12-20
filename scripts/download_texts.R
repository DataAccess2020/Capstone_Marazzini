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
library(dplyr)
library(tidytext)
library(ggplot2)

#download text BBC----
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

#I unify all the split senteces into one text
uni_BBC <- str_c(BBC[1], BBC[3], BBC[4], BBC[5], BBC[6], BBC[7], BBC[8], BBC[9], BBC[10], BBC[11], BBC[12], BBC[13], BBC[14], BBC[15], BBC[16], BBC[17], BBC[18], BBC[19], BBC[20], BBC[21], BBC[22], BBC[23], BBC[24], BBC[25], BBC[26], BBC[27], BBC[28], BBC[29], BBC[30], BBC[31], sep = "", collapse = NULL)
view(uni_BBC)



#download text NYT----
y <- read_html("https://www.nytimes.com/2022/09/25/world/europe/italy-meloni-prime-minister.html") %>%
  html_elements(css = ".evys1bk0 , .css-by6x3t , .e1h9rw200")
html_text()

NYT <- html_text(y, trim = FALSE)
view(NYT)

#I unified the split senteces into one text
uni_NYT <- str_c(NYT[1], NYT[3], NYT[4], NYT[5], NYT[6], NYT[7], NYT[8], NYT[9], NYT[10], NYT[11], NYT[12], NYT[13], NYT[14], NYT[15], NYT[16], NYT[17], NYT[18], NYT[19], NYT[20], NYT[21], NYT[22], NYT[23], NYT[24], NYT[25], NYT[26], NYT[27], NYT[28], NYT[29], NYT[30], NYT[31], NYT[32], NYT[33], NYT[34], NYT[35], NYT[36], NYT[37], sep = "", collapse = NULL)
view(uni_NYT)

#download text CNN-----
z <- read_html("https://edition.cnn.com/2022/09/25/europe/italy-election-results-intl/index.html") %>%
  html_elements(css = ".inline-placeholder")
html_text()

CNN <- html_text(z, trim = FALSE)
view(CNN)

#I unified all the split senteces into one text
uni_CNN <- str_c(CNN[1], CNN[4], CNN[5], CNN[6], CNN[7], CNN[8], CNN[9], CNN[10], CNN[11], CNN[12], CNN[13], CNN[14], CNN[15], CNN[16], CNN[17], CNN[18], CNN[19], CNN[20], CNN[21], CNN[22], CNN[23], CNN[24], CNN[25], CNN[26], CNN[27], CNN[28], CNN[29], CNN[30], CNN[31], CNN[32], CNN[33], CNN[34], CNN[35], CNN[36], sep = "", collapse = NULL)
view(uni_CNN)


#download text Guardian----
r <- read_html("https://www.theguardian.com/world/2022/sep/25/italy-elections-exit-polls-point-to-victory-for-coalition-led-by-far-right-giorgia-meloni") %>%
  html_elements(css = ".dcr-2v2zi4 , .dcr-ai6lo6 p , .dcr-6rhr0p")

Grd <- html_text(r, trim = FALSE)
view(Grd)

#unify in one text
uni_Grd <- str_c(Grd[1], Grd[2], Grd[3], Grd[4], Grd[5], Grd[6], Grd[7], Grd[8], Grd[9], Grd[10], Grd[11], Grd[12], Grd[13], Grd[14], Grd[15], Grd[16], Grd[17], Grd[18], Grd[19], Grd[20], Grd[21], Grd[22], Grd[23], Grd[24], Grd[25], Grd[26], Grd[27], Grd[28], Grd[29], Grd[30], Grd[31], Grd[32], Grd[33], Grd[34], sep = "", collapse = NULL)
view(uni_Grd)
#I know it's not the most elegant or useful way to do so, but my forloop didn't
#work and I had to find a way otherwise I would be stucked


#create a dataframe
 dat <- data.frame(
  var1 = c("BBC", "NYT", "CNN", "Guardian"), 
  var2 = c(uni_BBC, uni_NYT, uni_CNN, uni_Grd)
)
dat
view(dat)

#create a vector
vector <- c(uni_BBC, uni_CNN, uni_Grd, uni_NYT)