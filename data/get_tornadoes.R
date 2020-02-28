url <- "http://www.tornadohistoryproject.com/custom/27175080/table"
library(rvest)
library(tidyverse)
tornadoes <- read_html(url)

table <- tornadoes %>%
  html_nodes('#results') %>%
    html_table(header = TRUE) %>%
      .[[1]] %>%
      janitor::clean_names() %>%
      select(spc_number:lift_lon)
table
saveRDS(table,file="data/get_tornadoes.rds")
