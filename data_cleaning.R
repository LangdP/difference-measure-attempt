# LOAD PACKAGES
library(dplyr)

#SANITY
pro_sanity_file_list <- list.files("data/pro/SANITY", full.names=TRUE)
anti_sanity_file_list <- list.files("data/anti/SANITY", full.names=TRUE)

SANITY_WORDS <- c('amendement', #IS THE SAME AS THE ORDER OF FILES
                 'article',
                 'assemblée',
                 'député',
                 'hier',
                 'ici',
                 'loi',
                 'président',
                 'rapporteur',
                 'vote'
                 )
pro_sanity_tables <- lapply(pro_sanity_file_list, read.csv, header=TRUE)
names(pro_sanity_tables) <- SANITY_WORDS

anti_sanity_tables <- lapply(anti_sanity_file_list, read.csv, header=TRUE)
names(anti_sanity_tables) <- SANITY_WORDS

# CLEAN/ARANGE DATA
# SANITY
# We put the data in the right order, which is decreasing order of means
for (i in 1:length(pro_sanity_tables)) {
  pro_sanity_tables[[i]] <- pro_sanity_tables[[i]][order(-pro_sanity_tables[[i]]$mean), , drop = FALSE]
  pro_sanity_tables[[i]] <- pro_sanity_tables[[i]][-1,]
  
}

for (i in 1:length(anti_sanity_tables)) {
  anti_sanity_tables[[i]] <- anti_sanity_tables[[i]][order(-anti_sanity_tables[[i]]$mean), , drop = FALSE]
  anti_sanity_tables[[i]] <- anti_sanity_tables[[i]][-1,]
  
}

# We make another list with the most similar words to each word
pro_sanity_most_similar <- list()
for (i in 1:length(pro_sanity_tables)) {
  pro_sanity_most_similar[[i]] <- pro_sanity_tables[[i]]$X[1:12]
}
names(pro_sanity_most_similar) <- SANITY_WORDS

anti_sanity_most_similar <- list()
for (i in 1:length(anti_sanity_tables)) {
  anti_sanity_most_similar[[i]] <- anti_sanity_tables[[i]]$X[1:12]
}
names(anti_sanity_most_similar) <- SANITY_WORDS

#TEST
pro_test_file_list <- list.files("data/pro/TEST", full.names=TRUE)
anti_test_file_list <- list.files("data/anti/TEST", full.names=TRUE)

TEST_WORDS <- c('adopter', #IS THE SAME AS THE ORDER OF FILES
                 'adoption',
                 'civilisation',
                 'droit',
                 'enfance',
                 'enfant',
                 'famille',
                 'fier',
                 'fraternité',
                 'gpa',
                 'homosexuel',
                 'hétérosexuel',
                 'institution',
                 'liberté',
                 'mariage',
                 'nature',
                 'naturel',
                 'pacs',
                 'pma',
                 'progrès',
                 'religieux',
                 'religion',
                 'sacré',
                 'égalité',
                 'église'
                 )
pro_test_tables <- lapply(pro_test_file_list, read.csv, header=TRUE)
names(pro_test_tables) <- TEST_WORDS

anti_test_tables <- lapply(anti_test_file_list, read.csv, header=TRUE)
names(anti_test_tables) <- TEST_WORDS

# CLEAN/ARANGE DATA
# TEST
# We put the data in the right order, which is decreasing order of means
for (i in 1:length(pro_test_tables)) {
  pro_test_tables[[i]] <- pro_test_tables[[i]][order(-pro_test_tables[[i]]$mean), , drop = FALSE]
  pro_test_tables[[i]] <- pro_test_tables[[i]][-1,]
  
}

for (i in 1:length(anti_test_tables)) {
  anti_test_tables[[i]] <- anti_test_tables[[i]][order(-anti_test_tables[[i]]$mean), , drop = FALSE]
  anti_test_tables[[i]] <- anti_test_tables[[i]][-1,]
  
}

# We make another list with the most similar words to each word
pro_test_most_similar <- list()
for (i in 1:length(pro_test_tables)) {
  pro_test_most_similar[[i]] <- pro_test_tables[[i]]$X[1:12]
}
names(pro_test_most_similar) <- TEST_WORDS

anti_test_most_similar <- list()
for (i in 1:length(anti_test_tables)) {
  anti_test_most_similar[[i]] <- anti_test_tables[[i]]$X[1:12]
}
names(anti_test_most_similar) <- TEST_WORDS