library(tidyverse)
library(googlesheets4)
library(googledrive)
library(glue)


id <- drive_get("https://docs.google.com/spreadsheets/d/1SlJ6C_yNY_d_4STjiSYMD2IaDdyi5BmGhO3csmV9Ipk/edit#gid=835390872")
weight <- commandArgs(trailingOnly = TRUE)
stopifnot(!rlang::is_empty(weight))

print(
  glue(
    "Saving todays weight as {weight}"
  )
)


read_sheet(id)  %>%
  mutate(time = NA) %>% 
  add_row(Date = Sys.Date(), Weight=as.numeric(weight), time = Sys.time()) %>%
  filter(!is.na(Weight)) %>% 
  arrange(desc(Date)) %>% 
  write_sheet(id,sheet = "automatic")



