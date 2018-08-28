devtools::install_github("rstudio/reticulate")
devtools::install_github("vegawidget/altair") 

library(reticulate)
library(altair)

chart <-
  alt$Chart(r_to_py(mtcars))$
  encode(
    x = "hp:Q",
    y = "mpg:Q",
    color='carb:N'
  )$
  mark_point()

chart
