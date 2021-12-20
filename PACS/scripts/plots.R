# This script contains the functions that generate the kinds of plots that we have
# in the accompanying markdown document, to be generated if needed

# LOAD PACKAGES
library(ggplot2)
library(hrbrthemes)

# LOAD DATA only if needed (first launch)
#source("scripts/data_cleaning.R")

# PLOT GENERATING FUNCTIONS
# Set colors
# The blue from the LLF logo, which we used for the antis
# in the paper
LLF_Blue <- "#112b4c"
# The yellow from the LLF logo, which we used for the pros
# in the paper
LLF_Yellow <- "#d68738"

simranks <- function(df){
  df$X <- factor(df$X, levels=df$X[order(-df$mean)])
  df <- df %>%
    mutate(simranks = 1:n())
  return(df)
}

#This first one will output the general shape of the cosine evolution
cosine_evolution.plot <- function(df, df_name, alignment) {
  plots_df <- simranks(df)
  if (alignment == "pro"){
    colortheme <- LLF_Yellow
  } else if (alignment == "anti"){
    colortheme <- LLF_Blue
  }
  
  plot <- ggplot(plots_df, aes(x=simranks, y=mean)) +
  geom_point(color = colortheme) + 
  geom_line(aes(x = simranks, y = mean), color = colortheme) +
  geom_ribbon(aes(ymin=ci95_lo, ymax=ci95_hi), alpha = 0.2) +
  labs(title = "Cosine similarities evolution",
       subtitle = paste(alignment, "corpus ", df_name, sep=" "),
       x = "similarity rank",
       y = "cosine similarity") +
  theme_ipsum() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))
return(plot)
}

cosine_evolution_detail.plot <- function(df, df_name, alignment, limit=100){
  plots_df <- simranks(df)[1:limit,]
  plot <- cosine_evolution.plot(plots_df, df_name, alignment)
  return(plot)
}
  
