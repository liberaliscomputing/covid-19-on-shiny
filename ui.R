library(shiny)


shinyUI(
  fluidPage(
    # Application title
    titlePanel("COVID-19 on Shiny"),

    sidebarLayout(
      sidebarPanel(
        uiOutput("select"),

        uiOutput("check"),

        downloadButton("download", "Download as TSV")
      ),

      mainPanel(
        dataTableOutput("resources")
      )
    )
  )
)
