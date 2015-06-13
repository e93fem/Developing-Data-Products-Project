install.packages("shiny")

setwd("F:\\Documents\\Developing Data Products\\Developing-Data-Products-Project")
library(shiny)
runApp(display.mode='showcase')

devtools::install_github('rstudio/shinyapps')
library(shinyapps)

deployApp()