# This is the script for the implementation of the difference measurement presented in the R Markdown file of that project.
# For more info on this, please read the RMarkdown file, this explains very little and is just the implementation 
# over all words of interest (the RMD only covers 4 of our words).

#LOAD DATA only load if necessary, it is a bit long (first launch)
source("scripts/data_cleaning.R")

#LOAD FUNCTIONS
source("scripts/functions.R")

#COMPARISONS
#SANITY WORDS
# First we do the ranks of missing anti words in pro similar words

sanity_anti_in_pro.compavg <- list()
for (i in 1:length(SANITY_WORDS)) {
 sanity_anti_in_pro.compavg[[SANITY_WORDS[i]]] <- newcompare_ranks(anti_sanity_most_similar[[i]], 
                                                                   pro_sanity_most_similar[[i]], 
                                                                   pro_sanity_tables[[i]]) 
}

sanity_anti_in_pro.compdet <- list()
for (i in 1:length(SANITY_WORDS)) {
  sanity_anti_in_pro.compdet[[SANITY_WORDS[i]]] <- detailed_comparison(anti_sanity_most_similar[[i]],
                                                                       pro_sanity_most_similar[[i]],
                                                                       pro_sanity_tables[[i]])
}

# Then we do the ranks of missing pro words in anti similar words

sanity_pro_in_anti.compavg <- list()
for (i in 1:length(SANITY_WORDS)) {
 sanity_pro_in_anti.compavg[[SANITY_WORDS[i]]] <- newcompare_ranks(pro_sanity_most_similar[[i]], 
                                                                   anti_sanity_most_similar[[i]], 
                                                                   anti_sanity_tables[[i]]) 
}

sanity_pro_in_anti.compdet <- list()
for (i in 1:length(SANITY_WORDS)) {
  sanity_pro_in_anti.compdet[[SANITY_WORDS[i]]] <- detailed_comparison(pro_sanity_most_similar[[i]],
                                                                       anti_sanity_most_similar[[i]],
                                                                       anti_sanity_tables[[i]])
}

# TEST WORDS

# First we do the ranks of missing anti words in pro similar words

test_anti_in_pro.compavg <- list()
for (i in 1:length(TEST_WORDS)) {
 test_anti_in_pro.compavg[[TEST_WORDS[i]]] <- newcompare_ranks(anti_test_most_similar[[i]], 
                                                                   pro_test_most_similar[[i]], 
                                                                   pro_test_tables[[i]]) 
}

test_anti_in_pro.compdet <- list()
for (i in 1:length(TEST_WORDS)) {
  test_anti_in_pro.compdet[[TEST_WORDS[i]]] <- detailed_comparison(anti_test_most_similar[[i]],
                                                                       pro_test_most_similar[[i]],
                                                                       pro_test_tables[[i]])
}

# Then we do the ranks of missing pro words in anti similar words

test_pro_in_anti.compavg <- list()
for (i in 1:length(TEST_WORDS)) {
 test_pro_in_anti.compavg[[TEST_WORDS[i]]] <- newcompare_ranks(pro_test_most_similar[[i]], 
                                                                   anti_test_most_similar[[i]], 
                                                                   anti_test_tables[[i]]) 
}

test_pro_in_anti.compdet <- list()
for (i in 1:length(TEST_WORDS)) {
  test_pro_in_anti.compdet[[TEST_WORDS[i]]] <- detailed_comparison(pro_test_most_similar[[i]],
                                                                       anti_test_most_similar[[i]],
                                                                       anti_test_tables[[i]])
}

