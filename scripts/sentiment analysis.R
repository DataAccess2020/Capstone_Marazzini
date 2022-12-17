#SENTIMENT ANALYSIS
install.packages("transforEmotion")
library(transforEmotion)

ref <- data("emotions")
view(data)
vector <- c(uni_BBC, uni_CNN, uni_Grd, uni_NYT)
emotions <- emoxicon_scores(text = vector, lexicon = emotions)
#Now I can see the emotions associated with each text

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
