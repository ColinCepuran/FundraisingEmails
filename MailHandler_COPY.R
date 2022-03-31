rm(list=ls())

library(tidyverse)
library(magrittr)
library(mboxr)
library(foreach)

setwd("E:\\Dropbox\\emails")

#read in the key to ID specific members
key <- read.csv("Key.csv") 
  
write.csv(key, "FundraisingEmails\\Key.csv", row.names = FALSE)

#read in the data and clean it
df <- read_mbox("Data\\Inbox.mbox")

df %<>% #keep only columns of interest
  select(date,
         in_reply_to,
         from,
         to,
         subject,
         content,
         weekday)

df %<>%
  separate("from", into = c("fromname", "from.address"), sep = " <") %>%
  mutate(from.address = str_replace(from.address, ">", "")) %>%
  filter(grepl("Google", fromname)==FALSE)

df$subject[df$subject==""] <- NA
key$idtext[key$idtext==""] <- NA



# joining data --NEED TO CHECK
key %<>%
  filter(is.na(idtext)==FALSE) 


matched <- merge(key,df)
matched$match <- NA

# keeping only rows that have emails that include IDing text associated with the candidate

foreach(i=1:dim(matched)[1]) %do% {
matched$match[[i]] <- grepl(matched$idtext[[i]],matched$content[[i]])
}

matched %<>%
  filter(match==TRUE)

saveRDS(df, "Data\\UnmatchedUncleaned.rds")

matched %>% dplyr::select(-match) %>%
write.csv("FundraisingEmails\\Raw Data\\MatchedUncleaned.csv", row.names = FALSE)

matched %>% dplyr::select(-match) %>%
saveRDS("Data\\MatchedUncleaned.rds")



