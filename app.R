load("data/atus.rda")
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
      geom_boxplot()+
      theme_bw()+
      scale_fill_albert()
  })
}
shinyApp(ui, server)





