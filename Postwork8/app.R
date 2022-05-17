# Postwork 8

library(shiny)
library(shinydashboard)
library(shinythemes)

data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-08/Postwork/match.data.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(

    dashboardPage(
        
        skin = "red",
        
        dashboardHeader(title = "PostWork8"),
        
        dashboardSidebar(
            sidebarMenu(
                menuItem("Gráfico de Barras", tabName = "graph", icon = icon("dashboard")),
                menuItem("Imagenes PW3", tabName = "img", icon = icon("file-picture-o")),
                menuItem("Data Table", tabName = "data_table", icon = icon("table")),
                menuItem("Imagenes", tabName = "img2", icon = icon("file-picture-o"))
            )
        ),
        
        dashboardBody(
            tabItems(
                tabItem(tabName = "graph",
                        fluidRow(
                            titlePanel(h1("Goles a favor y goles en contra por cada equipo")),
                            selectInput("x", "Seleccione la variable a graficar:",
                                        choices = c("home.score", "away.score")),
                            plotOutput("plot1", height = 500, width = 800))
                        ),
                
                tabItem(tabName = "img",
                        fluidRow(
                            titlePanel(h1("Imagenes PW3")),
                            h2(" - Probabilidades marginales de goles de equipos Locales"),
                            img(src = "pw3_1.png", height = 616, width = 1021),
                            h2(" - Probabilidades marginales de goles de equipos de Visitantes"),
                            img(src = "pw3_2.png", height = 613, width = 1022),
                            h2(" - Heatmap"),
                            img(src = "pw3_3.png", height = 612, width = 1022)
                        )),
                
                tabItem(tabName = "data_table",
                        fluidRow(
                            titlePanel(h1("Data Table de 'match.data.csv'")),
                            dataTableOutput("data_table")
                        )),
                
                tabItem(tabName = "img2",
                        fluidRow(
                            titlePanel(h1("Imagenes")),
                            h3(" - Factor de ganancia Máximo"),
                            img(src = "grafico1.png", height = 303 * 1.5),
                            h3(" - Factor de ganancia Promedio"),
                            img(src = "grafico2.png", height = 303 * 1.5)
                        ))
            )
        )
    )
)


# Define server logic required to draw a histogram
server <- function(input, output) {

    library(ggplot2)
    library(plotly)
    
    output$data_table <- renderDataTable(
        {data},
        options = list(aLengthMenu = c(5, 10, 50, 100), iDisplayLength = 5)
    )
    
    output$plot1 <- renderPlot({
        
        ?ifelse
        data <- mutate(data, FTR = ifelse(home.score > away.score, "H", ifelse(home.score < away.score, "A", "E")))
        x <- data[, input$x]
        
        data %>% ggplot(aes(x, fill = FTR)) +
            geom_bar() +
            facet_wrap("away.team") +
            labs(x = input$x, y = "Total Goles") +
            ylim(0, 100) +
            xlim(0, 10)
        
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
