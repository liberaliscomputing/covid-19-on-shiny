library(shiny)
library(shinythemes)


shinyUI(
  navbarPage(
    "COVID-19 on Shiny",
    tabPanel(
      "Resources",
      sidebarLayout(
        sidebarPanel(
          uiOutput("select"),

          uiOutput("check"),

          downloadButton("download", "Download as TSV"),
          width = 3
        ),

        mainPanel(dataTableOutput("resources"), width = 9)
      )
    ),
    shinythemes::themeSelector()
  )
)
