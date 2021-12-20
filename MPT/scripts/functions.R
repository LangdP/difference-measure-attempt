#FUNCTIONS
find_highest_rank <- function(rank, df){
  # This function takes the rank of one word (ie. its row in the ordered version of a dataframe)
  # as well as its dataframe of origin and give the 'highest compatible rank', that is
  # the rank of the word that has the highest mean cosine similarity within the confidence
  # interval of the cosine similarity of the word signified by the rank provided
 interval <- c(df[rank,]$ci95_lo, df[rank,]$ci95_hi) #define the interval using 95%ci
 compatible_values <- subset(df, mean>interval[1] & mean<interval[2]) #check which words are compatible
 max_mean <- max(compatible_values$mean) #isolate the one with the highest mean cosine similarity
 max_rank <- which(max_mean == df$mean) #find which word it is in the ordered df and its rank/row
 return(max_rank)
}
newfind_rank <- function(missing_word, df){
  # This function finds a word's highest compatible rank from
  # a dataframe.
    rank <- which(missing_word == df$X)
    newrank <- find_highest_rank(rank, df)
    return(newrank[1])
}
newcompare_ranks <- function(list_a, list_b, df_b){
  #This is the updated comparison function, see RMarkdown for details
  missing_words <- unique(list_a[! list_a %in% list_b])
  ranks_in_b <- unlist(lapply(missing_words, FUN=newfind_rank, df=df_b))
  newranks_in_b <- lapply(ranks_in_b, FUN=find_highest_rank, df=df_b)
  
  newavg_rank <- sum(as.numeric(newranks_in_b))/length(missing_words)
  return(newavg_rank)
}
detailed_comparison <- function(list_a, list_b, df_b){
  missing_words <- unique(list_a[! list_a %in% list_b])
  return(list(missing_words, unlist(lapply(missing_words, newfind_rank, df=df_b))))
}