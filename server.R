library(shiny)

# Read in data
data_dir <- "./data"
for (file_path in list.files(data_dir, full.names = TRUE)) {
  # Extract a profile name
  file_name <- basename(file_path)
  profile <- strsplit(file_name, ".", fixed = TRUE)[[1]][1]

  # Assign data in memory
  data <- read.table(file_path, header = TRUE, sep = "\t", check.names = FALSE)
  assign(profile, data)
}


shinyServer(
  function(input, output) {
    resources_input <- reactive({
      get(input$profile)[, input$attributes]
    })

    output$select <- renderUI({
      selectInput(
        "profile",
        "Select a Profile:",
        choices = c("Patient", "Encounter", "Condition", "Procedure")
      )
    })

    output$check <- renderUI({
      attributes <- names(get(input$profile))
      checkboxGroupInput(
        "attributes",
        "Choose an Attribute(s):",
        choices = attributes,
        selected = attributes,
      )
    })

    output$download <- downloadHandler(
      filen_ame <- function() {
        paste(input$profile, ".tsv", sep = "")
      },
      content <- function(file) {
        write.table(resources_input(), file, sep = "\t", row.names = FALSE)
      }
    )

    output$resources <- renderDataTable({
      resources_input()
    }, options = list(pageLength = 25))
  }
)
