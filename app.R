library(grDevices)
library(tidyverse)
library(plotly)
library(shiny)
source("misc/palette_albert.R")
source("misc/init.R")

ui <- fluidPage(
  titlePanel(title = "Visualizing Americans' Time Use"),
  fluidRow(
    sidebarPanel(selectInput("ycol", "Activity", activity, selected = "food"),
                 selectInput("xcol", "Grouping Variable", category, selected = "household_child"))),
    mainPanel(plotlyOutput("boxPlot"))
)

server <- function(input, output) {
  output$boxPlot<- renderPlotly({
    ggplot(atus, aes_string(x = input$xcol, y = input$ycol, fill = input$xcol)) +
      geom_violin(trim = TRUE)+
      theme_bw()+
      scale_fill_albert()+
      stat_summary(fun=median, geom="point", size=2, color="red")
  })
}
shinyApp(ui, server)





