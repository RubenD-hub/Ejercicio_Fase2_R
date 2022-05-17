# Postwork sesión 8. Dashboard 

#### OBJETIVO
 
- Observar el resultado de la toma de desiciones consecutivas, cuando estas se basan en datos históricos 

#### DESARROLLO

Para este postwork se generara un dasboard del modo que solo se genero un solo archivo de codigo `app.R`

#### 1. Se ejecuta el código `momios.R`
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/Captura1.PNG)

#### 2. Almacena los gráficos resultantes en formato `png` 
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/grafico1.png?raw=true)
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/grafico2.png?raw=true)


#### 3. Crea un dashboard donde se muestren los resultados con 4 pestañas:

##### Importamos las librerias
```R
library(shiny)
library(shinydashboard)
library(shinythemes)
```
##### Se realiza la lectura del dataset `match.data.csv` el cual se utilizara para elaborar las graficas de barras.
```R
data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-08/Postwork/match.data.csv")
```

##### Se empieza elaborando la parte de diseño del dashboard y almacenandolo en la variable `ui`. Despues de iniciar la funcion `dashboardPage`, se utiliza el parametro `skin` cual cambiara el color del dashboard. 
```R
# Define UI for application that draws a histogram
ui <- fluidPage(

    dashboardPage(
        
        skin = "red",
```
##### La parte del dashboard esta compuesta por elementos importantes los cuales no pueden faltar: `dashboardHeader`, `dashboardSidebar` y `dashboardBody`. El dashboardheader ayuda a la creacion de un encabezado donde se pueden colocal titulos o algunas ayudas como botones
```R
        dashboardHeader(title = "PostWork8"),
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/header.PNG?raw=true)

##### La seccion de dashboardsidebar, ayuda a la creacion de una lista de opciones (sidebar) que se pueden selceionar para mostra una pestaña nueva, que en su interior tendra una funcion. En este caso se crearan 4 opciones:
 - 1.- Grafico de barras 
 - 2.- Imagenes de los resultados del Postwork 3
 - 3.- Datatable que representa algunas variables del dataset `match.data.csv`
 - 4.- Imagenes de resultado del codigo `momios.R`
```R        
        dashboardSidebar(
            sidebarMenu(
                menuItem("Gráfico de Barras", tabName = "graph", icon = icon("dashboard")),
                menuItem("Imagenes PW3", tabName = "img", icon = icon("file-picture-o")),
                menuItem("Data Table", tabName = "data_table", icon = icon("table")),
                menuItem("Imagenes", tabName = "img2", icon = icon("file-picture-o"))
            )
        ),
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/silderbar.PNG?raw=true)

##### En el dasboard se coloca el contenido que tendra cada una de las opciones anteriores, mediante la funcion de `tabItems`
```R
        dashboardBody(        
            tabItems(
```
#### 4.- Una pestaña con gráficas de barras, donde en el eje de las _X_ se muestren los goles de local y visitante, con un menu de selección (en _choices_ deben aparecer éstas variables), utiliza la geometría de tipo _barras_, además de hacer un facet_wrap con la variable de el _equipo visitante_

##### En el primer `tabItem` se coloca el contenido para que se miuestren lo que es un grafico de barras, tener en cuenta que solo esta parte es la representacion de lo que se vera ya que no hace la graficacion, por lo que hay que enlazar las variables y con la parte de `server`
```R
                tabItem(tabName = "graph",
                        fluidRow(
                            titlePanel(h1("Goles a favor y goles en contra por cada equipo")),
                            selectInput("x", "Seleccione la variable a graficar:",
                                        choices = c("home.score", "away.score")),
                            plotOutput("plot1", height = 500, width = 800))
                        ),
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/barrasLocal.PNG?raw=true)
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/barrasVisitante.PNG?raw=true)

#### 5.- Realiza una pestaña donde agregues las imágenes de las gráficas del postwork 3

##### En el segundo `tabItem` se mostraran las imagenes de resultado del postwork 3 por lo que solo las mandamos a llamar  y se les coloca un pequeño titulo a cada una. Tener en cuenta que las imagenes deben estar en una capeta llamda `www` guardada en la misma direcion donde se encuentra este codigo.
```R   
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
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/imagenesPW3.PNG?raw=true)

#### 5.- En otra pestaña coloca el data table del fichero `match.data.csv` 

##### En el tercer `tabItem` se plasmara lo que es una tabla con algunas columnas del dataset de `match.data.csv`
```R                
                tabItem(tabName = "data_table",
                        fluidRow(
                            titlePanel(h1("Data Table de 'match.data.csv'")),
                            dataTableOutput("data_table")
                        )),
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/datatable.PNG?raw=true)

#### 6.- En una pestaña agrega las imágenes de las gráficas de los factores de ganancia promedio y máximo

##### El ultimo `tabItem` mostrara las imagenes de resultado del codigo `momios.R`, y se mandaran a llamar igual que en el segundo tabItem. 
```R
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
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork8/Pesta%C3%B1amomios.PNG?raw=true)

##### Y con esto se finaliza con la parte de codigo para la visualizacion del dashboard

#### Ahora se elavora la parte del `server` el cual realiza las funciones logicas, calculos, graficaciones, etc.
```R
# Define server logic required to draw a histogram
server <- function(input, output) {
```
##### Cargamos las librerias que se utilizaran en el server
```R
    library(ggplot2)
    library(plotly)
```
##### Se asigna a la variable que se creo para el datatable, la renderizacion del csv del `match.data.csv`
```R
    output$data_table <- renderDataTable(
        {data},
        options = list(aLengthMenu = c(5, 10, 50, 100), iDisplayLength = 5)
    )
```

##### Se realiza la graficacion de los goles anotados por los partidos locales y visitantes, ademas de realizarce una funcion logica que determiina si el partido jugado termino en empate, victoria para local o victoria para visitante, La cual tambien se hara visible en la grafica.
```R    
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
```

#### Por ultimo con la funcion `shinyApp` que logra hacer que corran ambos procesos de `ui` y `server` juntos, parapoder hacer uso del el dasboard.
```R
# Run the application 
shinyApp(ui = ui, server = server)
```
