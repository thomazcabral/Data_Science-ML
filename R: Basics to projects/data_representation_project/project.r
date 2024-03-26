library(shiny)
library(shinydashboard)

dataset <- read.csv("C:\Users\lucas\Downloads\Dataset\DailyDelhiClimateTrain.csv") # Importante mudar o local do arquivo do dataset

ui <- dashboardPage(
  dashboardHeader(title = "DASHBOARD TITLE"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("MEDIAS", tabName = "MEDIAS"),
      menuItem("GRAFICO EM LINHA", tabName = "GRAFICOEMLINHA"), #É importante que o tabName não tenha espaços
      menuItem("HISTOGRAMA", tabName = "HISTOGRAMA"),
      menuItem("BOXPLOT", tabName = "BOXPLOT")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "MEDIAS",
              fluidRow(
                box(
                  tableOutput('medias')
                ),
                
                box(
                  dateRangeInput("date_range", "Date range:", start = min(dataset$date), end = max(dataset$date)),
                  selectInput("column_select", "Select Column:", choices = c("Mean Temperature" = "meantemp", "Humidity" = "humidity", "Wind Speed" = "wind_speed", "Mean Pressure" = "meanpressure"))
                )
              )
      ),
      tabItem(tabName = "GRAFICOEMLINHA",
              fluidRow(
                box(plotOutput("graficolinha", height = 500)),
                
                box(
                  dateRangeInput("date_range_graph", "Date range:", start = min(dataset$date), end = max(dataset$date)),
                  selectInput("column_select_graph", "Select Column:", choices = c("Mean Temperature" = "meantemp", "Humidity" = "humidity", "Wind Speed" = "wind_speed", "Mean Pressure" = "meanpressure"))
                )
              )
      ),
      tabItem(tabName = "HISTOGRAMA",
              fluidRow(
                box(plotOutput("histogram", height = 500)),
                
                box(
                  dateRangeInput("date_range_histogram", "Date range:", start = min(dataset$date), end = max(dataset$date)),
                  selectInput("column_select_histogram", "Select Column:", choices = c("Mean Temperature" = "meantemp", "Humidity" = "humidity", "Wind Speed" = "wind_speed", "Mean Pressure" = "meanpressure"))
                )
              )
      ),
      tabItem(tabName = "BOXPLOT",
              fluidRow(
                box(plotOutput("boxplot", height = 500)),
                
                box(
                  dateRangeInput("date_range_boxplot", "Date range:", start = min(dataset$date), end = max(dataset$date)),
                  selectInput("column_select_boxplot", "Select Column:", choices = c("Mean Temperature" = "meantemp", "Humidity" = "humidity", "Wind Speed" = "wind_speed", "Mean Pressure" = "meanpressure"))
                )
              )
      )  
    )
  )
)

find_mode <- function(x) {
  # Remove empty values (NA)
  x <- x[!is.na(x)]
  
  # Use table() to get the frequency of each value
  freq <- table(x)
  
  # Find the maximum frequency
  max_freq <- max(freq)
  
  # Return the values with the maximum frequency (mode)
  return(head(names(freq)[freq == max_freq], 1))
}

server <- function(input, output) {
  
  #Tabela de Medias
  output$medias <- renderTable({
    if (input$column_select == "meantemp") {
      filtered_data = dataset$meantemp[(dataset$date >= input$date_range[1]) & 
                                         (dataset$date <= input$date_range[2])]
    } else if (input$column_select == "humidity") {
      filtered_data = dataset$humidity[(dataset$date >= input$date_range[1]) & 
                                         (dataset$date <= input$date_range[2])]
    } else if (input$column_select == "wind_speed") {
      filtered_data = dataset$wind_speed[(dataset$date >= input$date_range[1]) & 
                                           (dataset$date <= input$date_range[2])]
    } else {
      filtered_data = dataset$meanpressure[(dataset$date >= input$date_range[1]) & 
                                             (dataset$date <= input$date_range[2])]
    }
    
    if (input$date_range[2] >= input$date_range[1]) {
      data.frame(
        Metrica = c("Media", "Mediana", "Moda", "Desvio Padrão"),
        Valor = c(mean(filtered_data), median(filtered_data), find_mode(filtered_data), sd(filtered_data))
      )
    } else {
      data.frame(
        Metrica = c("Media", "Mediana", "Moda", "Desvio Padrão"),
        Valor = c("ERRO", "ERRO", "ERRO", "ERRO")
      )
    }
  })
  
  
  #Plot do Histograma
  output$histogram <- renderPlot({
    if(is.null(input$date_range_histogram)) return()
    filtered_data <- dataset[dataset$date >= input$date_range_histogram[1] & dataset$date <= input$date_range_histogram[2], ]
    hist(filtered_data[[input$column_select_histogram]], main = paste("Histogram of", input$column_select_histogram), xlab = input$column_select_histogram)
  })
  
  #Plot do Boxplot
  output$boxplot <- renderPlot({
    if(is.null(input$date_range_boxplot)) return()
    filtered_data <- dataset[dataset$date >= input$date_range_boxplot[1] & dataset$date <= input$date_range_boxplot[2], ]
    boxplot(filtered_data[[input$column_select_boxplot]], main = paste("Boxplot of", input$column_select_boxplot), xlab = input$column_select_boxplot, col = "pink")
  })
}

shinyApp(ui, server)
