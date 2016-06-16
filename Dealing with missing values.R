library(stringr)
library(dplyr)
df <- read.csv("titanic_original.csv", stringsAsFactors = FALSE)
glimpse(df)

sum(df$embarked == '')
sum(is.na(df$age))
sum(df$boat == '')

df$embarked[df$embarked == ''] = "S"
df$age[is.na(df$age)] = mean(df$age, na.rm = TRUE)
df$boat[df$boat == ''] = "None"

sum(df$embarked == '')
sum(is.na(df$age))
sum(df$boat == '')

df <- mutate(df, has_cabin_number = as.numeric(cabin != ''))

write.csv(df,"titanic_clean.csv")
