library(shiny)

# Define UI for Diamonds application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Diamonds Price Data"),
  
  # Sidebar with controls to select the variable to plot against price
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("variable", "Variable:",
                list("Carat" = "carat", 
                     "Cut" = "cut", 
                     "Clarity" = "clarity")),
    
    checkboxInput("outliers", "Show outliers", FALSE)
  ),
  
  # Show the caption and plot of the requested variable against price
  mainPanel(
    h3(textOutput("caption")),
    
    plotOutput("diamondPlot")
  )
))