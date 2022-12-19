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
#To see how the sentiment evolves in each article, I want to create a dataframe in which each
#words is assigned to the corrispondent Article
df_bbc$source <- ifelse(df_bbc$freq > 0, "BBC", df_bbc$source)
df_cnn$source <- ifelse(df_cnn$freq > 0, "CNN", df_cnn$source)
df_grd$source <- ifelse(df_grd$freq > 0, "GRD", df_grd$source)
df_nyt$source <- ifelse(df_nyt$freq > 0, "NYT", df_nyt$source)

#I put them in a single dataframe
complete_dat <- data.frame(
  word = c(df_bbc$word, df_cnn$word, df_grd$word, df_nyt$word), 
  freq = c(df_bbc$freq, df_cnn$freq, df_grd$freq, df_nyt$freq),
  source = c(df_bbc$source, df_cnn$source, df_grd$source, df_nyt$source)
)
complete_dat
view(complete_dat)

install.packages("tidyr")
library(tidyr)

xxxxxxxx <- complete_dat %>%
  inner_join(bing) %>%
  count(word, sentiment, sort = TRUE)

xxxxxxxx %>%
  filter(n >= 2) %>%
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col() +
  coord_flip() +
  labs(y = "Contribution to sentiment")

xxxxxxxx %>%
  group_by(sentiment) %>%
  slice_max(n, n = 2) %>% 
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(n, word, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(x = "Contribution to sentiment",
       y = NULL)

#the following formula I'm still evaluating if it makes sense to analyze it
articlesentiment <- complete_dat %>%
  inner_join(bing) %>%
  count(source, index = freq, sentiment) %>%
  pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>% 
  mutate(sentiment = positive - negative)

ggplot(articlesentiment, aes(index, sentiment, fill = source)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~source, ncol = 2, scales = "free_x")


#-----------------------------------------------------------------------------------------------------
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
