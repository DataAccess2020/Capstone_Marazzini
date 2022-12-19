#MOST FREQUENT WORDS

install.packages("RColorBrewer")
library(RColorBrewer)
install.packages("tm")
library(tm)

#create a dataframe eliminating the useless words and putting the frequency
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
head(df)

#wordcloud for all articles
install.packages("wordcloud2")
library(wordcloud2)
install.packages("wordcloud")
library(wordcloud)

wordcloud2(data=df, size=0.4, color='random-dark')


#FREQUENCY BBC
docs_bbc <- Corpus(VectorSource(BBC))

docs_bbc <- docs_bbc %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs_bbc <- tm_map(docs_bbc, content_transformer(tolower))
docs_bbc <- tm_map(docs_bbc, removeWords, stopwords("english"))

dtm_bbc <- TermDocumentMatrix(docs_bbc) 
matrix_bbc <- as.matrix(dtm_bbc) 
words_bbc <- sort(rowSums(matrix_bbc),decreasing=TRUE) 
df_bbc <- data.frame(word = names(words_bbc),freq=words_bbc)

#MOST FREQUENT WORDS NYT
docs_nyt <- Corpus(VectorSource(NYT))

docs_nyt <- docs_nyt %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs_nyt <- tm_map(docs_nyt, content_transformer(tolower))
docs_nyt <- tm_map(docs_nyt, removeWords, stopwords("english"))

dtm_nyt <- TermDocumentMatrix(docs_nyt) 
matrix_nyt <- as.matrix(dtm_nyt) 
words_nyt <- sort(rowSums(matrix_nyt),decreasing=TRUE) 
df_nyt <- data.frame(word = names(words_nyt),freq=words_nyt)

#MOST FREQUENT WORDS CNN
docs_cnn <- Corpus(VectorSource(CNN))

docs_cnn <- docs_cnn %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs_cnn <- tm_map(docs_cnn, content_transformer(tolower))
docs_cnn <- tm_map(docs_cnn, removeWords, stopwords("english"))

dtm_cnn <- TermDocumentMatrix(docs_cnn) 
matrix_cnn <- as.matrix(dtm_cnn) 
words_cnn <- sort(rowSums(matrix_cnn),decreasing=TRUE) 
df_cnn <- data.frame(word = names(words_cnn),freq=words_cnn)


#MOST FREQUENT WORDS GUARDIAN
docs_grd <- Corpus(VectorSource(Grd))

docs_grd <- docs_grd %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs_grd <- tm_map(docs_grd, content_transformer(tolower))
docs_grd <- tm_map(docs_grd, removeWords, stopwords("english"))

dtm_grd <- TermDocumentMatrix(docs_grd) 
matrix_grd <- as.matrix(dtm_grd) 
words_grd <- sort(rowSums(matrix_grd),decreasing=TRUE) 
df_grd <- data.frame(word = names(words_grd),freq=words_grd)

#COMPARING THE MOST FREQUENT WORDS IN EACH ARTICLE
wordcloud(words = df_bbc$word, freq = df_bbc$freq, min.freq = 4,           max.words=200, random.order=FALSE, rot.per=0.35,            colors=brewer.pal(8, "Dark2"))
wordcloud(words = df_cnn$word, freq = df_cnn$freq, min.freq = 6,           max.words=200, random.order=FALSE, rot.per=0.35,            colors=brewer.pal(8, "Dark2"), scale=c(2.0,0.20))
wordcloud(words = df_nyt$word, freq = df_nyt$freq, min.freq = 8,           max.words=200, random.order=FALSE, rot.per=0.35,            colors=brewer.pal(8, "Dark2"), scale=c(2.0,0.20))
wordcloud(words = df_grd$word, freq = df_grd$freq, min.freq = 5,           max.words=200, random.order=FALSE, rot.per=0.35,            colors=brewer.pal(8, "Dark2"), scale=c(2.0,0.20))
#I wanted to create a VennDiagram to see the overlap of the most frequent words
#but with the package VennDiagram you can only make diagram that are numeric
