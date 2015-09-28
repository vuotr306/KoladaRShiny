library(shiny)
library(ggplot2)
library(KoladaR)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  output$distPlot <- renderPlot({
    x <- GetKolada(kpi_id = input$kpi, municipalities = input$municipality, years = input$checkGroup)
    
    #     p1 <- ggplot(data=x) + aes(x=year,y=female) + geom_line(color="red")+
    #       ggtitle("Line plot") + labs(x="Year", y="Value") + geom_line(data=x, aes(x=year, y=male), color="blue")
    
    
    p1 <- ggplot(data=x) + aes(x=year,y=total) + geom_line(color=input$colour1)+geom_point(color=input$colour2)+
      ggtitle("Line plot") + labs(x="Year", y="Value") 
    
    plot(p1)
    
    
  })
})
