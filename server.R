bmi <- function(length, weight) round(weight/((length/100)^2), digits=2)

shinyServer(
  function(input, output) {
    bmiValue <- reactive({bmi(input$length,input$weight)})

    output$bmi <- renderPrint({bmiValue()})
    output$bmiLevel <- renderPrint({
      if (bmiValue() < 19) {
        paste("You are underweight (",bmiValue(),")", sep = "")
      } else if (bmiValue() < 26) {
        paste("You have ideal weight (",bmiValue(),")", sep = "")      
      } else if (bmiValue() < 30) {
        paste("You are overweight (",bmiValue(),")", sep = "")       
      } else {
        paste("You are obesity (",bmiValue(),")", sep = "")       
      } 
    })

    output$newHist <- renderPlot({
      plot(c(15,35),rep(0.05,2),ylim=c(0,1),axes=F,xlab="BMI",ylab="",type="l",
           col="purple",lwd=10)
      lines(c(15,30),rep(0.05,2),col="red",lwd=10)
      lines(c(15,25),rep(0.05,2),col="orange",lwd=10)
      lines(c(15,18.5),rep(0.05,2),col="yellow",lwd=10)
      lines(rep(bmiValue(),2),c(0,0.1),lwd=2)
      axis(side=1)
      legend("topright",c("Underweight","Ideal weight","Overweight","Obesity"),
             lty=1, lwd=c(5,5,5,5), col=c("yellow","orange","red","purple"), 
             cex=2, pch=1, pt.cex = 1)
    })
  
  }
)