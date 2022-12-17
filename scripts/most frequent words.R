#MOST FREQUENT WORDS

install.packages("RColorBrewer")
library(RColorBrewer)
install.packages("tm")
library(tm)

docs <- Corpus(VectorSource(vector))

docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("english"))

dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words) #data frame with words and frequency


install.packages("wordcloud2")
library(wordcloud2)

wordcloud2(data=df, size=0.4, color='random-dark')

