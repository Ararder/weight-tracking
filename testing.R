#testing
library(tidyverse)
library(glue)

print(
  "Enter:
    1: Todays weight.
    2: Tiredness.
    3. Time until i left home"
)


args <- commandArgs(trailingOnly = TRUE)
