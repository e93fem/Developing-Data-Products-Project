library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Calculate BMI"),
    
    sidebarPanel(
      numericInput(inputId="length", label = "Input length in cm", 175),
      numericInput(inputId="weight", label = "Input weight in kg", 70)
    ),
    mainPanel(
      h3('Your BMI'),
      textOutput("bmi"),
      textOutput("bmiLevel"),
      
      plotOutput('newHist')
    )
  )
)
