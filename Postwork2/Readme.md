# Postwork 2 - Programación y Manipulación de datos en R
## :dart: Objetivos
- Importar múltiples archivos csv a R
- Observar algunas características y manipular los datos frames
- Combinar múltiples data frames en un único data frame

## 🔧 Requisitos
* Tener instalado R y RStudio
* Haber realziado el prework y estudiado los ejemplos de la sesión

## 🤓 Desarrollo
Ahora vamos a generar un cúmulo de datos mayor al que se tenía, esta es una situación habitual que se puede presentar para complementar un análisis, siempre es importante estar revisando las características o tipos de datos que tenemos, por si es necesario realizar alguna transformación en las variables y poder hacer operaciones aritméticas si es el caso, además de sólo tener presente algunas de las variables, no siempre se requiere el uso de todas para ciertos procesamientos.

#### 1. Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

##### Importamos la libreria `dplyr`
```R
  library(dplyr)
```
##### Almacenamos los `URL` de los dataset de las temporadas de soccer de primera division del 2017 al 2020.
```R
  URL_17_18 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
  URL_18_19 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
  URL_19_20 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
```
##### Escogemos la carpeta donde se guardan los archivos `csv`.
```R
  setwd(choose.dir(caption = "Select folder"))
```
##### Descargamos los dataset de las temporadas de soccer y les asiganmos un nombre con extencion `csv`.
```R
  download.file(url = URL_17_18, destfile = "soccer17_18.csv", mode = "wb")
  download.file(url = URL_18_19, destfile = "soccer18_19.csv", mode = "wb")
  download.file(url = URL_19_20, destfile = "soccer19_20.csv", mode = "wb")
```
##### Leemos cojuntamente todos los archivos `csv` mediante la funcion `lapply()` y los guardamos en una lista.
```R
  SoccerList <- lapply(dir(), read.csv)
```

#### 2. Revisa la estructura de de los data frames al usar las funciones: `str`, `head`, `View` ó `summary`.
```R
  str(SoccerList[[1]]); head(SoccerList[[1]]); View(SoccerList[[1]])
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/SoccerList1.PNG?raw=true)
```R
  str(SoccerList[[2]]); head(SoccerList[[2]]); View(SoccerList[[2]])
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/SoccerList2.PNG?raw=true)
```R
  str(SoccerList[[3]]); head(SoccerList[[3]]); View(SoccerList[[3]])
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/SoccerList3.PNG?raw=true)
##### Como se pudo checar en la revision de los dataset cada uno posee casi la misma cantidad de variables y hay algunas que se deben modificar. Hay que convertir la variable Date en una variable de tipo fecha (`as.Date`), mediante la funcion `mutate()` de la libreria de `dplyr`.
##### Se asigna la codificacion con la que se muestra en el data set por ejemplo si la fecha aparece como 20/03/17 la codificacion debe ser `%d/%m/%y` y para una fecha de este modo 20/03/2017 corresponde la codificacion `%d/%m/%Y`.
```R
  SoccerList[[1]] <- mutate(SoccerList[[1]], Date = as.Date(Date, "%d/%m/%y")) 
  SoccerList[[2]] <- mutate(SoccerList[[2]], Date = as.Date(Date, "%d/%m/%Y"))
  SoccerList[[3]] <- mutate(SoccerList[[3]], Date = as.Date(Date, "%d/%m/%Y"))
```
##### Al verificar de nuevo los datos se confirma que la codificacion y tipo de variable para `Date` son la misma para todos los componentes de la lista.
```R
  str(SoccerList[[1]])
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/SoccerList1-1.PNG?raw=true)
```R
  str(SoccerList[[2]])
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/SoccerList2-1.PNG?raw=true)
```R
  str(SoccerList[[3]])
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/SoccerList3-1.PNG?raw=true)
#### 3. Con la función `select()` del paquete dplyr selecciona únicamente las columnas `Date`, `HomeTeam`, `AwayTeam`, `FTHG`, `FTAG` y `FTR`; esto para cada uno de los data frames. Mediante la funcion `lapply()` para poder aplicar el selec a todos los componentes de la lista.
```R
  SoccerList <- lapply(SoccerList, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
```
##### Al momento de hacer la verificacion nuevamente se puede observar que los dataframe de la lista ahora solo cuenta con 6 variables.
```R
  str(SoccerList[[1]])
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/SoccerList1-2.PNG?raw=true)
```R
  str(SoccerList[[2]])
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/SoccerList2-2.PNG?raw=true)
```R
  str(SoccerList[[3]])
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/SoccerList3-2.PNG?raw=true)
#### 4. Asegúrate de que los elementos de las columnas correspondientes de los nuevos data frames sean del mismo tipo. Con ayuda de la función `rbind` forma un único data frame que contenga las seis columnas mencionadas en el punto 3, la función `do.call()` podría ser utilizada
```R
  Soccer <- do.call(rbind, SoccerList)
```
##### Comprobamos que se hallan juntado todos datos de la lista en un dataframe. Debe aparecer un dataframe con 1140 observaciones y 6 variables.
```R
  str(Soccer); View(Soccer)
```
![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork2/total.PNG?raw=true)
##### Por ultimo se exporta el dataFrame a un archivo csv
```R
  write.csv(Soccer, "Soccer_2017-2020.csv", row.names = FALSE)
```
