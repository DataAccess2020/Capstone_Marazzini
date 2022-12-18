#SENTIMENT ANALYSIS

#POSITIVE/NEGATIVE ------
install.packages("tidytext")
library(tidytext)

#first I need to create one word per row
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
df <- data.frame(word = names(words),freq=words) #1 word per word and their frequency

#GET THE POSITIVE
positive <- get_sentiments("bing") %>%
  filter(sentiment == "positive")

pos_text <- df %>%
  semi_join(positive) %>%
  count(word, sort = TRUE)
#84 words (but some are linked with the words win, won, victory)

#GET THE NEGATIVE
negative <- get_sentiments("bing") %>%
  filter(sentiment == "negative")

neg_text <- df %>%
  semi_join(negative) %>%
  count(word, sort = TRUE)
#80 words 

#COMPARISON POSITIVE/NEGATIVE
bing <- get_sentiments("bing")

pos_neg <- df %>%
  inner_join(bing) %>%
  count(word, sentiment, sort = TRUE)

pos_neg

pos_neg %>%
  filter(n >= 1) %>%
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col() +
  coord_flip() +
  labs(y = "Contribution to sentiment")
#It doesn't make sense to use this graph because each words that is in the dictionary
#and in the articles appears just one time

install.packages("transforEmotion")
library(transforEmotion)

#EMOTIONS IN EACH TEXT ------
ref <- data("emotions")
view(data)
vector <- c(uni_BBC, uni_CNN, uni_Grd, uni_NYT)
emotions <- emoxicon_scores(text = vector, lexicon = emotions)
#Now I can see the emotions associated with each text

#SEMATIC DISTANCE -------
data("neo_ipip_extraversion")
sematic_distance <- nlp_scores(
  text = vector,
  classes = c(
    "friendly", "gregarious", "assertive",
    "active", "excitement", "cheerful"),
  semantic_space = c("baroni", "cbow", "cbow_ukwac", "en100", "glove", "tasa"),
  preprocess = TRUE,
  remove_stop = TRUE,
  keep_in_env = TRUE,
  envir = 1
)
