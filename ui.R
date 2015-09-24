library(shiny)

m2 <- munic_code[order(munic_code[,2]),]
sel_kmn <- list()
for(i in 1:290){
  sel_kmn[i] <- m2[i,1]
  names(sel_kmn)[i] <- m2[i,2]
}
sel_kmn


sel_yr <- list()
for(i in 2000:2015){
  sel_yr[i-1999] <- i
  names(sel_yr)[i-1999] <- i
}
sel_yr



# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Data from Kolada!"),
  
  # Sidebar with a slider input for the number of bins
  fluidRow(
    column(3,checkboxGroupInput("checkGroup",label=h3("Display years"),
                                choices = sel_yr,selected=2000:2015))
  ,
  column(2,
          selectInput("kpi", label = h3("Choose key indicator"), 
                      choices = list("Tax rate" = "N00041", "Sick leave" = "N00090",
                                     "Standard cost of public transport" = "N00105"), selected = "kpi")),
  
  
  column(2,
         selectInput("municipality", label = h3("Choose municipality"), 
                     choices = sel_kmn, selected = "Ale")),
  
  column(2,
         selectInput("colour1", label = h3("Choose line color"), 
                     choices = list("Red"="red", "Blue"="blue", "Yellow"="yellow", "Black"="black", "Green"="green"), selected = "red")),
  
  column(2,
         selectInput("colour2", label = h3("Choose point color"), 
                     choices = list("Red"="red", "Blue"="blue", "Yellow"="yellow", "Black"="black", "Green"="green"), selected = "red")),
  
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
