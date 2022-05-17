
library(dplyr)
library(ggplot2)
library(fbRanks)
library(lubridate)
library(tidyverse)

#  ---------------------------------------------
# | Postwork 6 - Rubén Sánchez Loperena         |
#  ---------------------------------------------

# Importa el conjunto de datos match.data.csv a R y realiza lo siguiente:

# 1- Agrega una nueva columna sumagoles que contenga la suma de goles por partido.

  setwd(choose.dir(caption = "Select folder"))
  match.data <- read.csv("match.data.csv")

  match.data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-06/Postwork/match.data.csv")

  match.data[,'sumagoles'] <- match.data[, 3] + match.data[,5]
  head(match.data)
  str(match.data)
  
  
# Obt?n el promedio por mes de la suma de goles.
  
  match.data <- mutate(match.data, date = as.Date(date,'%Y-%m-%d'))
  
  #creamos las columnas year y month dentro del df match.data 
  match.data[, 'year'] <- year(match.data$date)
  match.data[,'month'] <- month(match.data$date)
  
 #agrupar por mes y sacar la media de goles por mes 
  datos <- match.data %>% group_by(year, month) %>% summarize(promedio_goles = mean(sumagoles))
  datos <- as.data.frame(datos)
  
  
  #fecha inicial
  fech <- paste(toString(datos$year[1]),"/8/1", sep = "")
  
  #fecha final
  fechf <- paste(toString(datos$year[length(datos[,1])]),"/12/1", sep = "")
  
  #Creamos una secuencia de fechas %Y-%m-%d con todos los meses, incluidos junio y julio donde no hay temporadas de soccer
  #la secuencia empieza en la fecha inicial fech y termina en fechf. 
  Meses <- seq(as.Date(fech), as.Date(fechf), by = "month")
  
  #creamos un dataframe con las columnas year y month
  ft <- data.frame('year' = year(Meses), 'month' = month(Meses))
  
  
  #unimos los dos dataframes datos y ft, de modo que a cada fecha se le asigne el valor de promedio_goles (por mes) correspondiente 
  #en los meses donde no hay temporada devuelve un NA
  ?merge
  final <- merge(x = datos, y = ft, by = c("month","year"), all = TRUE)
  
  #rellenamos estos NA's con 0
  final[is.na(final)] <- 0
  
  
  #y ordenamos el df por anio
  final <- final[order(final$year),]
  
  str(final)
  
  #por ultimo realizamos la serie de tiempo 
  Promedio_goles.ts <- ts(final$promedio_goles, start = c(2010,8), end = c(2019, 12), fr = 12)
  Promedio_goles.ts
  
  #y graficamos
  plot(Promedio_goles.ts, xlab = "Tiempo", ylab = "Promedio de goles por mes", main = "Serie de Goles Promedio",
       sub = "Serie mensual: Agosto de 2010 a Diciembre de 2019")
  
  
  
  
  