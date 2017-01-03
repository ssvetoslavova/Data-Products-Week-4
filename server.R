library(shiny)
library(datasets)
data <- read.csv("./Data/diamonds.csv")

# Define server logic required to plot various variables against price
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$diamondPlot expressions
  formulaText <- reactive({
    paste("price ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against price and only 
  # include outliers if requested
  output$diamondPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data,
            outline = input$outliers)
    
  })
})