library(shiny)
library(ggplot2)

shinyServer(function(input, output,session) {           


 output$plot1<-renderPlot({
	plot(mtcars)
  })

 output$plot2<-renderPlot({
	data(diamonds)
	ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar()
 })

 output$tbl1<-renderDataTable({
	as.data.frame(diamonds)
})

})
