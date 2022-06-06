# visualise weight
library(tidyverse)
library(googlesheets4)
library(googledrive)
library(glue)
theme_set(theme_classic())


id <- drive_get("https://docs.google.com/spreadsheets/d/1SlJ6C_yNY_d_4STjiSYMD2IaDdyi5BmGhO3csmV9Ipk/edit#gid=835390872")

df <- read_sheet(id, "automatic") %>% 
  filter(!is.na(Weight)) %>% 
  arrange(desc(Date)) 

df %>% 
  ggplot(aes(Date,Weight)) +
  geom_line(size=0.8)




