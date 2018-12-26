library(shiny)
library(cranlogs)
library(ggplot2)
library(stringr)

ui <- fluidPage(
  titlePanel(title = "CRAN Trends"),
  wellPanel(
    textInput(inputId = "packages", label = "Packages:", value = "dplyr, caret")
    ),
  plotOutput(outputId = "downloadsPlot"),
  textOutput(outputId = "list")
)

server <- function(input, output) {
  
  pkgs <- reactive({input$packages %>% str_replace_all("\\s+", "") %>% str_split(., pattern = ",") %>% unlist()})
  
  output$downloadsPlot <- renderPlot({
    print(pkgs())
    ggplot(cran_downloads(packages = pkgs(), from = "2015-01-01"),
           aes(x = date, y = count, color = package)) + 
      geom_line()
  })
}

shinyApp(ui = ui, server = server)