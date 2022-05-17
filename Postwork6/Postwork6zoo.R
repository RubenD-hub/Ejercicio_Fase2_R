install.packages("lubridate")
install.packages("zoo")
library(zoo)
library(dplyr)
library(lubridate)
library(ggplot2)

#leer el dataset
match<- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-06/Postwork/match.data.csv")

#crear columna sumagoles
match[,"sumagoles"]<- match$home.score+match$away.score
View(match)

#extraer mes y año como columnas nuevas
match[,"mes"]<- month(match$date) 
match[,"anio"]<- year(match$date)

#juntar las columnas creadas en una nueva columna en formato fecha
#filtrando las fechas de agosto 2010 a diciembre 2019
match <- match %>% 
  mutate(mes_anio = my(paste(mes, anio)))%>%
  filter(date >= "2010-08-28",
         date <= "2019-12-22")
View(match)

#obtener el promedio de goles por mes
promediomensual <-match %>%
  group_by(mes_anio) %>%
  summarise (promedio_goles = mean(sumagoles))
View(promediomensual)

#usar la funcion zoo para series de tiempo irregulares ya que faltan datos en junio y julio
Promedio_goles.zoo=zoo(promediomensual$promedio_goles, order.by=promediomensual$mes_anio) 
Promedio_goles.zoo

#hacer la gráfica de serie de tiempo
plot(Promedio_goles.zoo, xlab = "Tiempo", ylab = "Promedio de goles por mes", main = "Serie de goles Promedio", 
     sub= "Serie mensual:Agosto de 2010 a Diciembre de 2019", col = "blue")


  
  
          

