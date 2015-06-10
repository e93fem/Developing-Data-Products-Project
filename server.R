bmi <- function(length, weight) round(weight/((length/100)^2), digits=2)

shinyServer(
  function(input, output) {
    bmiValue <- reactive({bmi(input$length,input$weight)})

    output$bmi <- renderPrint({bmiValue()})
    output$bmiLevel <- renderPrint({
      if (bmiValue() < 19) {
        "You are underweight"
      } else if (bmiValue() < 26) {
        "You have ideal weight"       
      } else if (bmiValue() < 30) {
        "You are overweight"       
      } else {
        "You are obesity"       
      } 
    })

    output$newHist <- renderPlot({
      plot(c(0,0.8),rep(0.1,2),ylim=c(0,1),axes=F,xlab="",ylab="",type="l",col="red")
      lines(c(0,0.6),rep(0.1,2),col="green")
      axis(side=1)
    })
  
  }
)