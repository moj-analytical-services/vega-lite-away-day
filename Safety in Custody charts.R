## Instal packages

library(tidyverse)

devtools::install_github("rstudio/reticulate")
devtools::install_github("vegawidget/altair")

library(reticulate)
library(altair)

#Prepare data
assaults <- read_csv("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/729048/assaults-data-tool-data-2018-Q1.csv")
assaults$type <- rep('assault', 57819)

selfharm <- read_csv("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/729046/self-harm-data-tool-data-2018-Q1.csv")
selfharm$type <- rep('selfharm', 29429)

assaults$Year <- as.numeric(assaults$Year)

data <- rbind(assaults %>% 
                filter(Year %in% 2007:2017) %>%
                group_by(Year, Month, YearMonth, Prison, type) %>%
                summarise(count = n()),
              selfharm %>% 
                filter(Year %in% 2007:2017) %>%
                group_by(Year, Month, YearMonth, Prison, type) %>%
                summarise(count = n()))


alt$data_transformers$enable('json')

chart <-
  alt$Chart(r_to_py(data))$
  encode(
    x = "Year:Q",
    y = "count:Q",
    color='type'
  )$
  mark_point()

chart
