# Capstone_Marazzini
The following project aims at analyzing the sentiment of the articles published by the forign press about the victory of Giorgia Meloni at the Italian Election. The objective is to see how the foreing press depicts Fratelli Di Italia and its leader, formulating the hypothesis that the sentiment will be negative.

## Tasks
To accomplish this, here a list of the task needed:
- Scarping the text of the articles from the internet
- Organizing and cleaning the data
- Analyze the texts
- Visualize the results

## Results
The results partially met my initial expectation. In fact the analysis show a neutral sentiment, since the negative and positive words are quite balanced in quantity. But if we have a deeper look, we can see that most of the positive words are ripetitions and synonyms, moreover most of the positive words are linked the the victory, which are inevitable when you write an article about the victory of a party in the election. Instead, the negative words have a wider spectrum and there are less ripetions and synonyms, using words that probably would not have been used for other Italian parties (like "fascism").

## Note
Sometimes happens that you can not manage to scrape the text from the internet, even if the previous time you could. This is because some journals allow you to see the text only one time on the internet and the second time you need to subribe to the online journal to be able to see it. If you are not able to see the article on the web, R will not allow you to scrape the text. The solution is to subscribe to the journal so that you can see the article on the web and R can scrape it. The subscription of the chosen journal is free.  

## References
J. Silge, D. Robinson, "Text Mining with R: a Tidy Approach", O'Reilley, 1st edition

## Folders
`scripts` with the scripts of the project. Must be opened in the following oreder: 
 - download_texts
 - most frequent words
 - sentiment analysis
 
`output` with the report
