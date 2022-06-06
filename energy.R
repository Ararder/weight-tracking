# energy and motivation
library(tidyverse)
library(googlesheets4)
library(googledrive)
library(glue)

id <- drive_get("https://docs.google.com/spreadsheets/d/1SlJ6C_yNY_d_4STjiSYMD2IaDdyi5BmGhO3csmV9Ipk/edit#gid=43585413")
energy <- commandArgs(trailingOnly = TRUE)[1]
motivation  <- commandArgs(trailingOnly = TRUE)[2]
stopifnot(
  !rlang::is_empty(energy))

print(
  glue(
    "Energy: {energy},
     Motivation: {motivation} "
  )
)


read_sheet(id, "energy") %>% 
  add_row(energy=as.numeric(energy), motivation=as.numeric(motivation), time = Sys.time()) %>% 
  write_sheet(id, "energy")


