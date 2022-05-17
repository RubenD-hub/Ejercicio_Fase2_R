# Postwork 6 - Series de tiempo
## :dart: Objetivo
Aprender a crear una serie de tiempo en R.

## 🔧 Requisitos
* Tener instalado R y RStudio
* Haber trabajado con el prework y el work

## 🤓 Desarrollo

**Importa el conjunto de datos match.data.csv a R y realiza lo siguiente:**

Definimos el dataframe *match.data* usando el url del archivo csv
```R
match.data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-06/Postwork/match.data.csv")
```
**Agrega una nueva columna sumagoles que contenga la suma de goles por partido.**

Creamos la columna *sumagoles* como la suma de las columnas 3 y 5, goles como local y goles como visitante, respectivamente.
```R
match.data[,'sumagoles'] <- match.data[, 3] + match.data[,5]
head(match.data)
```

<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork6/head_matchdata.png?raw=true">
</p>

**Obtén el promedio por mes de la suma de goles.**

Antes de crear la columna de promedio por mes, tenemos que arreglar el formato de las fechas
```R
match.data <- mutate(match.data, date = as.Date(date,'%Y-%m-%d'))
```

Y creamos las columna year y month
```R
match.data[, 'year'] <- year(match.data$date)
match.data[,'month'] <- month(match.data$date)
```

Ya con esto hecho podemos crear el dataframe *datos* que almacena el promedio de la suma de goles por mes de cada año
```R
datos <- match.data %>% group_by(year, month) %>% summarize(promedio_goles = mean(sumagoles))
datos <- as.data.frame(datos);
head(datos)
```
<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork6/head_datos.png?raw=true">
</p>

**Crea la serie de tiempo del promedio por mes de la suma de goles hasta diciembre de 2019.**

Ahora bien, antes de crear la serie de tiempo tenemos que hacer nuestro df regular, dado que los meses junio y julio de nuestros datos no tienen temporada de soccer, por lo tanto no hay goles en esos meses. Para esto crearemos un dataframe...
```R
fech <- paste(toString(datos$year[1]),"/8/1", sep = ""); #fecha inicial de los datos
fechf <- paste(toString(datos$year[length(datos[,1])]),"/12/1", sep = "") #fecha final de los datos
```
Creamos una secuencia de fechas %Y-%m-%d con todos los meses, incluidos junio y julio donde no hay temporadas de soccer, esta secuencia empieza en la fecha inicial *fech* y termina en la fecha final *fechf*. 
```R
Meses <- seq(as.Date(fech), as.Date(fechf), by = "month")
```
y creamos el dataframe *ft*, el cual contiene las columnas year,años desde 2010 hasta 2020, y month, el cual contiene los meses del 1 al 12, con frecuencia de 12, empezando por el mes 8 y terminando por el mes 12.
```R
ft <- data.frame('year' = year(Meses), 'month' = month(Meses)); 
head(ft,13)
 ```
 <p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork6/ft.png?raw=true">
</p>

A continuacion uniremos los dataframes *ft* y *datos* en un nuevo df llamado *final*, de modo que para cada mes por año dentro de *ft* le corresponda el promedio de goles por mes dentro de *datos*, note que en los meses donde no hay temporada, junio y julio, devolverá un *NA*. 
Todo este proceso fue hecho para que nuestro dataframe *final* tenga todos los meses por año con su correspondiente promedio de goles por mes y así poder hacer una serie de tiempo regular. 
```R
final <- merge(x = datos, y = ft, by = c("month","year"), all = TRUE)
final <- final[order(final$year),] #ordenamos por año
final
```

 <p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork6/final.png?raw=true">
</p>

Rellenamos estos NA's con 0 
```R
final[is.na(final)] <- 0
```

 <p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork6/final_0.png?raw=true">
</p>

Y creamos la serie de tiempo de los goles promedios por mes con la función [ts()], con intervalo desde la fecha inicial "2010/08" hasta la final "2020/12" y con frecuencia de 12, por la cantidad de meses por año.
```R
Promedio_goles.ts <- ts(final$promedio_goles, start = c(2010,8), end = c(2019, 12), fr = 12)
Promedio_goles.ts
```

**Grafica la serie de tiempo.**

Por último, usamos la funcion plot para graficar la serie de tiempo
```R
plot(Promedio_goles.ts, xlab = "Tiempo", ylab = "Promedio de goles por mes", main = "Serie de Goles Promedio",
     sub = "Serie mensual: Agosto de 2010 a Diciembre de 2019")
```

 <p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork6/ts_golespermonth.jpg?raw=true">
</p>

Cabe mencionar que no se utilizó la serie de tiempo ts con un intervalo de 12 o 10 debido a que si bien, la mayoría de las temporadas duraron 10 meses (agosto a mayo), en el año 2013 la temporada duró 11 meses, es decir hasta el mes de junio, por lo que la serie debía ajustarse a que tuviera intervalos regulares.

**Solución con función Zoo (Z's Ordered Observations) de R**

Otra forma de realizar la serie de tiempo es con el paquete Zoo de R, instalandolo previamente en caso de ser necesario, el cuál  está diseñado para crear series de tiempo irregulares, en este caso utilizamos un código similar para obtener la suma de goles y las columnas de mes y año. 

```R
install.packages("lubridate")
install.packages("zoo")
library(zoo)
library(dplyr)
library(lubridate)
library(ggplot2)

match<- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-06/Postwork/match.data.csv")
match[,"sumagoles"]<- match$home.score+match$away.score
match[,"mes"]<- month(match$date) 
match[,"anio"]<- year(match$date)
``` 

Sin embargo, antes de obtener el promedio tenemos que generar una nueva columna para agrupar que tenga formato de fecha (utilizando la librería "lubridate"), misma que filtramos desde el mes de agosto 2010 a diciembre 2019

```R
match <- match %>% 
  mutate(mes_anio = my(paste(mes, anio)))%>%
  filter(date >= "2010-08-28",
         date <= "2019-12-22")
```
Después obtenemos el promedio de goles mensual de manera similar con esta columna, utilizando la función group_by.

```R
promediomensual <-match %>%
  group_by(mes_anio) %>%
  summarise (promedio_goles = mean(sumagoles))
  ```
  <p align = "center">
  <img src = "https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork6/Promedio%20mensual%20goles.PNG?raw=true">
</p>
  
Utilizamos la función zoo para obtener la serie de tiempo.
```R
Promedio_goles.zoo=zoo(promediomensual$promedio_goles, order.by=promediomensual$mes_anio) 
```
 <p align = "center">
  <img src = "https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork6/Promedio%20goles%20zoo.PNG?raw=true">
</p>

Y finalmente la graficamos.
```R
plot(Promedio_goles.zoo, xlab = "Tiempo", ylab = "Promedio de goles por mes", main = "Serie de goles Promedio", 
     sub= "Serie mensual:Agosto de 2010 a Diciembre de 2019", col = "blue")
``` 
<p align = "center">
  <img src = "https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork6/Serie%20tiempo%20zoo.png?raw=true">
</p>

La diferencia con la serie de tiempo anterior es que esta no muestra los meses donde no hubo partidos; sin embargo, ambas series nos permiten identificar la tendencia a lo largo del tiempo la cual mantiene un promedio de 2 a 3 goles por partido y que a pesar de que hay años donde el promedio es mayor o menor podemos predecir que esta tendencia continuará en un futuro.

*****Nota. Para mayor información sobre las series de tiempo ts y zoo consultar: https://estadistica-dma.ulpgc.es/cursoR4ULPGC/14-seriesTemporales.html*****
