install.packages("shiny")

setwd("F:\\Documents\\Developing Data Products\\Developing-Data-Products-Project")
library(shiny)
runApp(display.mode='showcase')

plot(c(0,0.8),rep(0.1,2),ylim=c(0,1),axes=F,xlab="",ylab="",type="l",col="red")
lines(c(0,0.6),rep(0.1,2),col="green")
axis(side=1)
