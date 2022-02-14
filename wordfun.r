#!/usr/bin/env Rscript
# A simple R script to generate a word cloud from a text file.
# Pull in the Wikipedia page for the word "Drunk" and generate a word cloud.

# Load the Wikipedia page for the word "Drunk"
# from the internet: https://en.wikipedia.org/wiki/Drunk
drunk <- readLines("https://en.wikipedia.org/wiki/Drunk")

# print for debugging
# print(drunk)

# parse out the text from the page
# and remove all the HTML tags
drunk_text <- gsub("<[^>]+>", "", drunk)

# now remove all the newlines
drunk_text <- gsub("\n", " ", drunk_text)

# and remove all the punctuation
drunk_text <- gsub("[^a-zA-Z]", " ", drunk_text)

# now split the text into words
# drunk_words <- strsplit(drunk_text, " ")


# # and remove all the stop words
# # we will use the stop words from the R stopwords package
# # https://cran.r-project.org/web/packages/stopwords/stopwords.pdf
stopwords <- stopwords::stopwords("en")
# # replace the stop words with a space
# # create regex by joining the stop words with a pipe
# # and then use the regex to replace the stop words with a space
# drunk_text <- gsub(paste0("(", paste(stopwords, collapse="|"), ")", sep=""), " ", drunk_text)

# # and finally, remove all the whitespace
# drunk_text <- gsub("\\s+", " ", drunk_text)

# oops, wordcloud does it all for us

# now we can generate the word cloud
# we will use the wordcloud package
# https://cran.r-project.org/web/packages/wordcloud/wordcloud.pdf
wordcloud::wordcloud(drunk_text,
          width = 800,
          height = 600,
          min_font_size = 10,
          max_font_size = 100,
          min_word_length = 3,
          stopwords = stopwords,
          scale = c(0, 1),
          random_state = 1,
          col = "red",
          background = "white",
          max_words = 100,
          prefer_horizontal = TRUE,
          random_state = 1,
          show_words = FALSE,
          show_legend = FALSE,
          show_axis = FALSE,
          show_perc = FALSE,
          show_random_state = FALSE,
          save = "drunk.png")
