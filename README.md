# Fase 2 - Proyecto - Equipo 15
Repositorio de entrega de Postwork para el Proyecto del Curso de BEDU en Data Science. Equipo 15
- Link al Video de Presentación: (https://youtu.be/q0j6G8pe60U)
- Link a las Diapositivas de Presentación: (https://docs.google.com/presentation/d/1PpjG5tlNTJH6VH5f5ygX_0xIQwdQYwqoxqVheDrGfm8/edit?usp=sharing)

## 🚀 Integrantes del Equipo: 
*  Dávila Osorio Javier Ibzan
*  Díaz Lievano Lázaro Raúl
*  García Ruiz Diana Isabel
*  Ortega Estrada Ismael
*  Pizano Ocampo Aranza Nayeli
*  Sánchez Loperena Ruben

## 📂 Postworks
- [Postwork_1](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/tree/main/Postwork1)
- [Postwork_2](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/tree/main/Postwork2)
- [Postwork_3](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/tree/main/Postwork3)
- [Postwork_4](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/tree/main/Postwork4)
- [Postwork_5](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/tree/main/Postwork5)
- [Postwork_6](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/tree/main/Postwork6)
- [Postwork_7](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/tree/main/Postwork7)
- [Postwork_8](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/tree/main/Postwork8)

## :soccer: Desarrollo del Proyecto
#### Se hará un análisis estadístico de un dataset de los juegos de soccer de la primera división española de las temporadas que comprende 2017-2020, enfocándonos en los goles anotados en los partidos de los equipos Locales y Visitantes.

### Postwork 1
El siguiente postwork, te servirá para ir desarrollando habilidades como si se tratara de un proyecto que evidencie el progreso del aprendizaje durante el módulo, sesión a sesión se irá desarrollando. A continuación aparecen una serie de objetivos que deberás cumplir, es un ejemplo real de aplicación y tiene que ver con datos referentes a equipos de la liga española de fútbol (recuerda que los datos provienen siempre de diversas naturalezas), en este caso se cuenta con muchos datos que se pueden aprovechar, explotarlos y generar análisis interesantes que se pueden aplicar a otras áreas. Siendo así damos paso a las instrucciones:

#### 1. Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

Importamos el archivo que contiene los datos mediante la función read.csv y guardamos el data frame como soccer19_20 :

```R
soccer19_20 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
```

A continuación se muestra el data frame obtenido:

```R
head(soccer19_20)
```

![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Head%20soccer19_20.PNG)


#### 2. Del data frame que resulta de importar los datos a R, extrae las columnas que contienen los números de goles anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)

Esto lo hacemos seleccionando las columnas respectivas para:

Goles anotados por equipos de casa

```R
G_Casa <- soccer19_20[, "FTHG"]
```
![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Goles%20casa.PNG)

Y goles anotados por equipos visitantes

```R
G_Visitante <- soccer19_20[, "FTAG"]
```
![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Goles%20visitante.PNG)

#### 3. Consulta cómo funciona la función table en R al ejecutar en la consola ?table

```R
?table
```

![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Consulta%20funci%C3%B3n%20table.PNG)

Tal como su nombre lo indica por medio de esta función convertimos los datos seleccionados a una tabla, en este caso utilizamos como argumentos las columnas extraidas y generamos tablas de frecuencias relativas.

Tabla de frecuencias goles de casa

```R
F_GCasa <- table(G_Casa); 
F_GCasa
```

![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Tabla%20de%20frecuencias%20goles%20casa.PNG)

Tabla de frecuencias goles de visitante

```R
F_GVisitante <- table(G_Visitante); 
F_GVisitante
``` 

![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Tabla%20de%20frecuencias%20goles%20visitante.PNG)

Posteriormente elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:

#### * La probabilidad (marginal) de que el equipo que juega en casa anote X goles (X = 0, 1, 2, ...)

Para obtener la probabilidad marginal utilizamos la funcion prop.table, la cuál nos genera las probabilidades de que los equipos en casa anoten x cantidad de goles de acuerdo a las frecuencias obtenidas anteriormente y la expresamos como porcentaje.                                                                                                     

```R
P_GCasa <- prop.table(F_GCasa)  
paste("La probabilidad (%) de que el equipo de casa anote X goles es: ") 
P_GCasa <- round((P_GCasa * 100), 3); 
P_GCasa
```

La probabilidad (%) de que el equipo de casa anote X goles es:

![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Probabilidad%20goles%20casa.PNG)

#### * La probabilidad (marginal) de que el equipo que juega como visitante anote Y goles (Y = 0, 1, 2, ...)

Realizamos la misma función del punto anterior ahora para las probabilidades de que los equipos visitantes anoten Y cantidad de goles.

```R
P_GVisitante <- prop.table(F_GVisitante)                                                                                                                                   
paste("La probabilidad (%) de que el equipo visitante anote Y goles es: ")                                                                                              
P_GVisitante <- round((P_GVisitante * 100), 3); 
P_GVisitante
```

La probabilidad (%) de que el equipo visitante anote Y goles es:

![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Probabilidad%20goles%20visitante.PNG)
  
#### * La probabilidad (conjunta) de que el equipo que juega en casa anote X goles y el equipo que juega como visitante anote Y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)

En este punto generamos una tabla de frecuencias conjunta, que nos muestra los diferentes casos utilizando como X los goles de los equipos en casa y como Y los goles de los equipos visitantes.

```R
F_GConj <- table(G_Casa,G_Visitante); 
F_GConj
```

![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Tabla%20de%20frecuencias%20conjunta.PNG)

Finalmente utilizando la función prop.table generamos la probabilidad conjunta.

```R
P_Conj <- prop.table(table(G_Casa, G_Visitante))                                                                                                                       
paste("La probabilidad conjunta (%) de que el equipo de casa anote X goles y el equpo visitante anote Y goles: ")                                                             
P_Conj <- round((P_Conj * 100), 3); 
P_Conj
```

La probabilidad conjunta (%) de que el equipo de casa anote X goles y el equpo visitante anote Y goles:

![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork1/Probabilidad%20conjunta.PNG)

Al obtener esta tabla de probabilidades conjunta podemos posteriormente graficar los datos y analizarlos, siendo de utilidad para con base en ellos determinar cuales son los escenarios más probables y hacer proyecciones a futuro; por ejemplo apuestas, entre otras.

### Postwork 2
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

### Postwork 3
Ahora graficaremos probabilidades (estimadas) marginales y conjuntas para el número de goles que anotan en un partido el equipo de casa o el equipo visitante.

#### 1. Con el último data frame obtenido en el postwork de la sesión 2, elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:
La distribución marginal es la distribución de probabilidad de un subconjunto de variables aleatorias de un conjunto de variables aleatorias, así la probabilidad marginal permite obtener probabilidades totales, como veremos en el tercer punto de este inciso.

El término variable marginal se usa para referirse a una variable del subconjunto de retenido y cuyos valores pueden ser conocidos. La distribución de las variables marginales, la distribución marginal, se obtiene marginalizando sobre la distribución de variables descartadas y las variables descartadas se llaman a veces variables marginalizadas.

El caso más simple es el de dos variables aleatorias reales 𝑿 y 𝒀 para la que se conozca su distribución de probabilidad conjunta 𝐅<sub>𝑿,𝒀</sub>(𝒙,𝒚), entonces la distribución marginal de 𝑿 es la distribución de probabilidad 𝐅<sub>𝑿</sub>(𝒙) de 𝑿 haciendo caso omiso de la información referente a 𝒀.

#### Desarrollo de código

Para este postwork comenzamos por llamar a la libreria ggplot2 que se requiere en el segundo inciso
```R
library(ggplot2)
```
Para obtener la probabilidad marginal de que los equipos anoten goles ya sea jugando en casa o de visitante se extraen las columnas que contienen los números de goles anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)
```R
# 1-  
# Se extrae los goles anotados por los equipos
  G_Casa <- Soccer[, "FTHG"]        # Goles anotados por equipos de casa
  G_Visitante <- Soccer[, "FTAG"]   # Goles anotados por equipos visitantes
```
Donde los resultados de goles casa son los siguientes
<p align = "center">
  <img src = "https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork3/GCasa.PNG">
</p>
De la misma manera se despliegan los goles de visitante            
 <p align = "center">
  <img src = "https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork3/GVisitante.PNG">
</p>

Una tabla de frecuencias es una herramienta que permite ordenar los datos de manera que se presentan numéricamente las características de la distribución de un conjunto de datos.

G_casa y G_visitante son vectores por lo que para generar sus tablas de frecuencia se usa el comando `table` y se guarda la tabla en nuevas variables 
```R
# Se realiza las tablas de frecuencia para obtener las sig probabilidades
  F_GCasa <- table(G_Casa); F_GCasa                  # T.Frec. goles de casa
  F_GVisitante <- table(G_Visitante); F_GVisitante   # T.Frec. goles visitantes
```
La tabla obtenida para los goles en casa es:
<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork3/frec_casa.PNG">
</p>
La tabla obtenida para los goles de visita es:
<p align = "center">
  <img src = "https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork3/frec_visitante.PNG">
</p> 

Ahora que tenemos las tablas de frecuencias podemos calcular las probabilidades marginales haciendo uso de la función `prop.table` que expresa las entradas de la tabla como fracción de una tabla marginal

#####  * La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
```R
# La probabilidad (marginal) de que el equipo de casa anote X goles
  P_GCasa <- prop.table(F_GCasa)
  P_GCasa <- round((P_GCasa * 100), 3)
  paste("La probabilidad (%) de que el equipo de casa anote X goles es: "); P_GCasa
```
El resultado de `prop.table` se obtiene en decimales por lo que multiplicamos el resultado por 100 y redondeamos a 3 cifras para ver las probabilidades en razón 1:100.
Probabilidad marginal de anotar gol en casa:
<p align = "center">
  <img src = "https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork3/prob_casa.PNG">
</p>

#####  * La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)

```R
# La probabilidad (marginal) de que el equipo de visitante anote Y goles
  P_GVisitante <- prop.table(F_GVisitante)
  P_GVisitante <- round((P_GVisitante * 100), 3)
  paste("La probabilidad (%) de que el equipo visitante anote Y goles es: "); P_GVisitante
```

El resultado de `prop.table` se obtiene en decimales por lo que multiplicamos el resultado por 100 y redondeamos a 3 cifras para ver las probabilidades en razón 1:100.
Probabilidad marginal de anotar gol de visitante:                                                                                                         
 <p align = "center">
  <img src = "https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork3/prob_visita.PNG">
</p>   

#####  * La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

Para obtener la probabilidad conjunta creamos la tabla de frecuencias de ambos vectores, el de casa y de visitante con `table()` ingresando ambos argumentos y se le genera su tabla de probabilidad a dicha tabla:
```R 
# La probabilidad (conjunta) de que el equipo de casa anote X goles y el 
# equipo que juega como visitante anote Y goles
  P_Conj <- prop.table(table(G_Casa, G_Visitante))
  P_Conj <- round((P_Conj * 100), 3)
  paste("La probabilidad conjunta (%) de que el equipo de casa anote X goles y el equpo visitante anote Y goles: "); P_Conj
```
El resultado de la tabla conjunta es:                                                                                                                               
<p align = "center">
  <img src = "https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork3/prob_conjunta%20p3.PNG">
</p>


#### 2. Realiza lo siguiente:
##### * Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa.
Para realizar las gráficas de las probabilidades marginales, primero estas se almacenan en un dataframe. Se renombran las columnas para tener: "Goles" y "Probabilidad".

```R
Local <- as.data.frame(P_GCasa)
colnames(Local) <- c("Goles","Probabilidad"); Local
```

<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork3/2.1.jpg">
</p>
Una vez hecho esto, se utiliza el paquete de "ggplot2" para graficar nuestro gráfico de barras. A su vez, hacemos uso del paquete "plotly" que nos servirá para hacer a nuestro gráfico de barras más dinámico.

```R
GL <- ggplot(Local, aes(x = Goles, y = Probabilidad)) + 
    geom_col(colour = "black", fill= "yellow") +
    ggtitle("Probabilidades marginales de goles de equipos Locales") + 
    xlab("Goles") +
    ylab("Probabilidades %") +
    theme_light() +
    theme(text = element_text(size = 15, face = "bold"))

ggplotly(GL)
```

Podemos observar el siguiente gráfico:
<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork3/2.4.png">
</p>

##### * Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo visitante.
De igual manera de como hicimos antes, primero, estas probabilidades se almacenan en un dataframe. Se renombran las columnas para tener: "Goles" y "Probabilidad".

```R
Visit <- as.data.frame(P_GVisitante)
colnames(Visit) <- c("Goles","Probabilidad"); Visit
```

<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork3/2.2.jpg">
</p>
Tal y como hicimos en el punto anterior, hacemos uso de los paquetes de "ggplot2" y "plotly" para graficar nuestro gráfico. 

```R
GV <- ggplot(Visit, aes(x = Goles, y = Probabilidad)) + 
    geom_col(colour = "black", fill= "#EB244E") +
    ggtitle("Probabilidades marginales de goles de equipos Visitantes") + 
    xlab("Goles") +
    ylab("Probabilidades %") +
    theme_light() +
    theme(text = element_text(size = 15, face = "bold"))
  
ggplotly(GV)
```

Tenemos como resultado el siguiente gráfico:
<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork3/2.5.2.png">
</p>

##### * Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.
Por último, de igual manera se hace un dataframe con las probabilidades conjuntas tanto de los goles del equipo de casa como de los goles del equipo visitante. Se renombran las columnas para tener: "Goles_Local", "Goles_Visit" y "Probabilidad".

```R
Conj <- as.data.frame(P_Conj)
colnames(Conj) <- c("Goles_Local", "Goles_Visit","Probabilidad"); Conj
```

<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork3/2.3.jpg">
</p>
Para finalizar, hacemos uso de la función "geom_tile()" dentro del paquete "ggplot2" para poder graficar un HeatMap de las probabilidades conjuntas entre los números de goles que anotan el equipo de casa (representado por el eje X) y el equipo visitante en un partido (representado por el eje Y).

```R
G_Conj <- ggplot(Conj, aes(x = Goles_Local, y = Goles_Visit, fill = Probabilidad)) + 
    geom_tile() +
    scale_fill_gradientn(colours = colorspace::heat_hcl(7)) +
    ggtitle("Mapa de calor de la probabilidad conjunta", subtitle = 'Pendiente') +
    labs(x = "Goles locales", y = "Goles visitantes", fill = "Probabilidad %") +
    theme(text = element_text(size = 15, face = "bold"))
  
ggplotly(G_Conj)
```

<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork3/2.6.png">
</p>

### Postwork 4
Ahora investigarás la dependencia o independencia del número de goles anotados por el equipo de casa y el número de goles anotados por el equipo visitante mediante un procedimiento denominado bootstrap, revisa bibliografía en internet para que tengas nociones de este desarrollo.

#### 1. Ya hemos estimado las probabilidades conjuntas de que el equipo de casa anote X=x goles (x=0,1,... ,8), y el equipo visitante anote Y=y goles (y=0,1,... ,6), en un partido. Obtén una tabla de cocientes al dividir estas probabilidades conjuntas por el producto de las probabilidades marginales correspondientes.

Del postwork 3 

Para saber si dos variables son independientes se debe cumplir lo siguiente.

Entonces X y Y son independientes si, para todo x en X, para todo y en Y.

![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork4/formula%201.PNG?raw=true)

 Donde:
 
 f(x) --> La funcion de densidad marginal de la variable X (goles del equipo local).
 
 f(y) --> La funcion de densidad marginal de la variable Y (goles del equipo local).
 
 f(x,y) es la función de densidad conjunta (X,Y) de los goles por partido.
 
Ahora para saber si se cumple, es igual a demostrar que:

![alt_text](https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork4/formula2.PNG?raw=true)

Primero creamos una nueva columna de ceros con la misma longitud que el dataframe Conj, el cual contiene la informacion de goles como local, goles como visitante y la probabilidad conjunta.
```R
Conj[, 4] = rep(0, length(Conj[,1]))
```
Luego llenamos esta columna con el producto de las probabilidades marginales de obtener X goles como local y Y goles como visitante. Por ejemplo, los productos de las probabilidades marginales de obtener 0 goles como visitante y 0, 1, 2, 3, 4, 5 o 6 goles como local.
Para esto empleamos un ciclo anidado tal que para cada elemento de Conj (conjunto de goles local y visitante) cheque si el numero de goles en la columna local y visit de Conj coincide con los que hay en la tabla visit y local, y si lo satisface, que multiplique sus probabilidades marginales y los guarde en su lugar correspondiente dentro de la columna 4 de Conj. 
```R
for(i in 1:length(Conj[,1])){
    for (j in 1:length(Local$Goles)) {
      for (k in 1:length(Visit$Goles)) {
        if((Conj[i,1] == Local[j,1]) & (Conj[i,2] == Visit[k,1])){
          Conj[i,4] = Local[j,2] * Visit[k,2]
        }
      }
    }
  }
```

```R
head(Conj)
```
![alt_text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork4/tabla_conj_prod_marg.png)


Renombramos esta columna llamada V4 como "Prod_Marg" y dividimos entre 100 dado que nosotros mostramos las probabilidades marginales individuales como porcentajes, de esta forma el producto de las probabilidades nos quedaría como porcentaje también.
```R
  Conj <- rename(Conj, Prod_Marg = V4)
  Conj[,"Prod_Marg"] <- Conj[,"Prod_Marg"] / 100
```
y por ultimo definimos la columna cociente como la division entre la probabilidad conjunta y el producto de las probabilidades marginales  
```R
  Conj[, "Cociente"] <- Conj$Probabilidad/Conj$Prod_Marg; head(Conj)
```


![alt_text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork4/tabla_conj_cociente.png)



#### 2. Mediante un procedimiento de bootstrap, obtén más cocientes similares a los obtenidos en la tabla del punto anterior. Esto para tener una idea de las distribuciones de la cual vienen los cocientes en la tabla anterior. Menciona en cuáles casos le parece razonable suponer que los cocientes de la tabla en el punto 1, son iguales a 1 (en tal caso tendríamos independencia de las variables aleatorias X y Y).
##### ¿Qué es Bootstrap?
En lugar de tomar muchas muestras de una población, podemos obtener réplicas (muestras con reemplazamiento) de la muestra original. Todas las réplicas deben tener el mismo tamaño que la muestra original: n.

La distribución bootstrap del estadístico se obtiene a partir de estas muestras y sirve para estimar la distribución del estadístico.

Dado que se nos pide utilizar un procedimiento de bootstrap, investigamos la forma en que este se podía implementar y optamos por utilizar la siguiente libreria llamada "rsample" la cuál contine un función bootstraps( ) que nos regresa un arreglo cuadrangular que incluye una columna con las muestras bootstrap y un identificador del número y tipo de muestra.

Empecemos por cargar nuestra libreria con library(rsample); NOTA: Recuerda que tenemos que instalar previamente la libreria.
Y creando una semilla aleatoria para que obtengamos los mismo resultados después, y declarando una constante n que representará el número de muestras que generaremos.

```R
library(rsample)
  set.seed(1111)
  n = 10000
```

Ahora guardemos en una variable "muestras" nuestras muestras generadas por la función bootstrap que como podremos ver se le pasan como parámetros nuestro dataframe que representa nuestra muestra original y el parámetro n que representa nuestr número de muestras que queremos generar.

```R
muestras <- bootstraps(Conj, times = n)
```

En la variable muestras como bien mencionamos en la explicación de arriba estará compuestá por dos columnas la primera con las muestras y la segunda por un identificador, las muestras se guardan en splits de la siguiente forma:
Ejecutemos un head(muestras) para observar como se estan guardando:
```R
head(muestras)
```
![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork4/muestras.PNG) <br/>
Ahora bien tenemos que sacar la media de cada una de nuestras muestras e irlas almacenando para después gráficarlas por lo que generaremos un vector para ahí irlas guardando, nosotros utilizamos un ciclo para ir recorriendo cada una de nuestras muestras e ir obteniendo la media de cada una de ellas, por lo que para sacar del split cada una de las muestras utilizamos as.data.frame como solución.

```R
  Medias <- c()
  for (i in 1:n) {
    Muest_Prueba <- as.data.frame(muestras$splits[[i]])
    Medias[i] <- mean(Muest_Prueba$Cociente)
  }
```
De igual forma realicemos un head a medias para ver cuales son nuestros resultados y un summary para ver nuestro max y min.
```R
head(Medias)
summary(Medias)
```
![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork4/medias.PNG) <br/>
Como podemos ver todo va a la perfección, ya solo nos queda ver gráficamente como se ven nuestras medias en un histograma, así que gráficando nuestro vector de Medias.

```R
Graph <- ggplot() + 
          geom_histogram(aes(Medias), bins = 50, col="black", fill = "yellow") + 
          geom_vline(aes(xintercept = mean(Medias)), linetype = "dashed", color = "red") +
          ggtitle('Histograma de la distribución de las medias muestrales.')+
          ylab("Frecuencias")
Graph
ggplotly(Graph)
```
![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork4/Graph.png)

Podemos observar que tenemos una distribución normal para nuestro gráfico con el vector de Medias, dado que se puede apreciar la forma de una Camapana de Gauss. 

Para la parte de nuestra hipótesis dada sobre decidir si nuestras Medias obtenidas son independientes o dependientes se propuso de la siguiente forma: <br/>
H<sub>0</sub>: μ = 1 (Las variables son Independientes) vs H<sub>a</sub>: μ ≠  1  (Las variables son Dependientes) <br/>
Empleamos la función t.test para comprobar la hipótesis y estos fueron los resultados
```R
t.test(Medias, alternative = "two.sided", mu = 1)
```
![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork4/test.PNG)

Dado que nos resulto el p-value= 2.2e-16 y esto es menor a 1 podemos rechazar nuestra Hipótesis nula sobre que nuestras variables son independientes y aceptar la Hipótesis alternativa sobre que nuestras variables Goles de Local y Goles de Visita son <strong>Dependientes.</strong> <br/>
De igual forma desde la gráfica obtenida se puede observar que nuestras variables son Dependientes ya que la linea de media gráficada no se encuentra en 1, por lo que confirmamos que nuestro resultado esta correcto.
### Postwork 5

#### 1. A partir del conjunto de datos de soccer de la liga española de las temporadas 2017/2018, 2018/2019 y 2019/2020, crea el data frame `SmallData`, que contenga las columnas `date`, `home.team`, `home.score`, `away.team` y `away.score`; esto lo puede hacer con ayuda de la función `select` del paquete `dplyr`. Luego establece un directorio de trabajo y con ayuda de la función `write.csv` guarda el data frame como un archivo csv con nombre *soccer.csv*. Puedes colocar como argumento `row.names = FALSE` en `write.csv`. 

El conjunto de datos de las temporadas 2017 al 2020 lo tenemos almacenado en `Soccer` por lo que lo mandamos llamar retirando la columna FTR que no será necesaria y asignandolo a `SmallData` para posteriormente ordenar las columnas.
```R
SmallData <- select(Soccer, -FTR)
SmallData <- select(SmallData, Date, HomeTeam, FTHG, AwayTeam ,FTAG)
summary(SmallData)

```
De lo anterior obtenemos el siguiente resumen de `SmallData`
<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork5/smallData_summary.png">
</p>



Verificando que la estructura del data frame es la adecuada usamos la función `colnames` para renombrar las columnas a como lo requiere `fbRanks`, con los datos en el orden y con el nombre que requerimos lo guardamos en un nuevo archivo csv. 
```R
colnames(SmallData) <- c("date", "home.team", "home.score", "away.team", "away.score")

write.csv(SmallData, file = "Soccer.csv", row.names = F)
```

#### 2. Con la función `create.fbRanks.dataframes` del paquete `fbRanks` importe el archivo *soccer.csv* a `R` y al mismo tiempo asignelo a una variable llamada `listasoccer`. Se creará una lista con los elementos `scores` y `teams` que son data frames listos para la función `rank.teams`. Asigna estos data frames a variables llamadas `anotaciones` y `equipos`.

Instalamos el paquete fbRanks y cargamos la librería,  `create.fbRanks.dataframes`  es una función auxiliar que lee archivos .csv para crear las puntuaciones, team.resolver y equipos data.frames. Su estructura es la siguiente:
`create.fbRanks.dataframes(scores.file, team.resolver=NULL, teams.file=NULL, date.format="%Y-%m-%d", na.remove=FALSE) `
El argumento que nos interesa es el de scores.file que es un archivo o vector de nombres de archivo (archivos csv) que tienen los datos de los partidos.
Debe tener columnas denominadas "date", "home.team", "home.score" y "away.team", "away.score".
Se pueden agregar columnas adicionales, p. Ej. "surface" o "attack.adv" (local, visitante, neutral), y estos se pueden utilizar como variables de respuesta.

Esta función devuelve una lista con los elementos `scores` y `teams` que son data frames de datos listos para usarse en la función de `rank.teams`
Estos elementos los asignamos a las variables “anotaciones” y “equipos”..

```R
install.packages("fbRanks")
library(fbRanks)

listaSoccer <- create.fbRanks.dataframes(scores.file = "Soccer.csv")

anotaciones <- listaSoccer$scores
equipos <- listaSoccer$teams

```
El resultado es una lista conformada por 4 dataframes y 2 valores lógicos como podemos ver en la imagen: 
<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork5/listasoccer.png">
</p>


#### 3. Con ayuda de la función `unique` crea un vector de fechas (`fecha`) que no se repitan y que correspondan a las fechas en las que se jugaron partidos. Crea una variable llamada `n` que contenga el número de fechas diferentes. Posteriormente, con la función `rank.teams` y usando como argumentos los data frames `anotaciones` y `equipos`, crea un ranking de equipos usando únicamente datos desde la fecha inicial y hasta la penúltima fecha en la que se jugaron partidos, estas fechas las deberá especificar en `max.date` y `min.date`. Guarda los resultados con el nombre `ranking`.

Con ayuda de la función `unique` creamos un vector de fechas , que no se repitan y que correspondan a las fechas en las que se jugaron partidos, y con `lenght` obtenemos el tamaño del vector lo que posteriormente nos ayudará al seleccionar las fechas como posiciones. 

Como se había comentado los datos de listaSoccer tenían el formato para usarse en `rank.teams` que crea rankings usando dataframes de los registros de partidos a través de la regresión de Poission.

```R
fecha <- unique(SmallData$date)
n <- length(fecha)

ranking <- rank.teams(anotaciones,equipos, 
                      max.date = max(fecha), min.date = min(fecha), 
                      date.format = '%d/%m/%Y')
```
De esto obtenemos los siguientes Rankings para los partidos jugados del 18 de agosto del 2017 al 19 de julio del 2020:
<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork5/ranking.png">
</p>

#### 4. Finalmente estima las probabilidades de los eventos, el equipo de casa gana, el equipo visitante gana o el resultado es un empate para los partidos que se jugaron en la última fecha del vector de fechas `fecha`. Esto lo puedes hacer con ayuda de la función `predict` y usando como argumentos `ranking` y `fecha[n]` que deberá especificar en `date`.

Predict es una función de fbRanks que predice el resultado (ganar, perder o empatar) y los goles para los partidos , se le da como argumento la lista de ranking y como fecha para aprendizaje le damos la última del vector. Los resultados obtenidos son los siguientes:
<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork5/prediction.png">
</p>



### Postwork 6 

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


### Postwork 7

Utilizando el manejador de BDD Mongodb Compass (previamente instalado), deberás de realizar las siguientes acciones:

#### 1.- Alojar el fichero match.data.csv en una base de datos llamada match_games, nombrando la collection como match.
Se descargo el archivo match.data.csv, para después importarlo en MongoDB. Los pasos para poder importar este archivo, primero fue crear nuestra Base de Datos con nombre "match_games" y una colección con nombre "match":

<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork7/Create_Database.JPG">
</p>

Después dentro de nuestra colección "match" importamos nuestro archivo CSV de la siguiente forma:

<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork7/Upload_CSV.JPG">
</p>

Antes de cargar los datos hemos configurado el tipo de dato de cada una de nuestras columnas, tomando en consideración nuestro criterio de que lo mejor es manejar el campo "date" como un String ya que en R es más sencillo crear una consulta de una fecha como un String.

#### 2.- Una vez hecho esto, realizar un count para conocer el número de registros que se tiene en la base.
Una vez cargados los documentos de nuestro archivo CSV, procedemos a conectar con código en RStudio nuestra Base de Datos de Mongo. <br/>
Se investigo sobre la libería "mongolite" para poder hacer la conexión y el resultado fue el siguiente:

```R
# install.packages("mongolite");

library(mongolite)  

conexion_bd<- mongo(
  collection = "match",
  db="match_games", 
  url = "mongodb+srv://timmitonx:<password>@cluster0.dmt93.mongodb.net/test",
  verbose = FALSE,
  options = ssl_options()
  )

```

Básicamnete consiste en cargar nuestra librería "mongolite" y utilizar la función mongo( ) que es la que se va a encargar de hacer la conexión a nuestra Base de Datos, y se le tienen que pasar como parámetros el nombre de nuestra colección (match), el nombre de la base de datos (match_games) y la url de nuestro localhost o nuestro cluster en MongoDB Atlas (nosotros utilizamos la url de el cluster en la nube) y como en la documentación lo pide verbose (FALSE) y options (ssl_options()).

Para comprobar que hemos creado una conexión correcta ejecutamos un class(conexion_bd) y generamos una consulta con find para traer todos los documentos de la base de datos, de esta forma podemos comprobar que al traer todos los objetos se nos genera un data.frame:

```R
class(conexion_bd)
alldata<- conexion_bd$find('{}')
class(alldata)
```

<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork7/class.JPG">
</p>

Por último para responder al problema de este inciso y realizar un count( ) para obtener el total de documentos (registros) obtenidos, se hizo lo siguiente:

```R
cantidad<- conexion_bd$count('{}')
cantidad
```
<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork7/cantidad.JPG">
</p>

Y como podemos observar hemos obtenido 3800 documentos (registros) y corresponde correctamente el número de registro que contiene nuestro archivo CSV.

#### 3.- Realiza una consulta utilizando la sintaxis de Mongodb en la base de datos, para conocer el número de goles que metió el Real Madrid el 20 de Diciembre de 2015 y contra que equipo jugó ¿perdió o fue goleada?

Para obtener esta consulta hicimos uso de un find( ) para insertar nuestra consulta, ya que nosotros guardamos la fecha como un String y necesitamos filtrar el partido del 20 de Diciembre del 2015, en nuestra base de datos este dato se encuentra de la siguiente forma "2015-12-20", y dado que queremos filtrar el partido del Real Madrid como local, entonces nuestro campo "home.team" debe ser igual a "Real Madrid".
La consulta quedo de la siguiente forma:

```R
consulta<- conexion_bd$find(
  query = '{"date":"2015-12-20", "home.team":"Real Madrid"}',
  fields = '{"_id":false, "home.team":true, "home.score":true, "away.team":true, "away.score":true}'
)
consulta
```
Generamos una projection, que en este caso se conoce como fields para solo mostrar el nombre del equipo local, sus goles anotados, el equipo visitante y sus goles anotados, quitando de esta forma el id que viene por defecto en MongoDB.

<p align = "center">
  <img src = "https://github.com/IsmaelOr/BEDU_Proyecto_Equipo15/blob/main/Imagenes/Postwork7/consulta.JPG">
</p>

Y como podemos ver hemos obtenido que el Real Madrid en ese partido jugó contra el Vallecano y que le gano por una goleada de 10 - 2. <br/>

<p align = "center">
  <img src = "https://media.giphy.com/media/7SWQWYqjYF6XtK89EW/giphy.gif">
</p>


#### 4.- Por último, no olvides cerrar la conexión con la BDD.

Por ultimo cerramos la conexión a nuestra Base de Datos, borrando nuestra variable de conexion_bd

```R
rm(conexion_bd)
```


### Postwork 8

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

### Conclusión
En este proyecto nos enfrentamos a varios retos, como la interpretación de los datos, o la elección de un criterio de solución. Aprendimos a documentarnos sobre las diversas funciones de R y gracias al análisis estadístico logramos obtener información relevante por lo que ya estamos listos para apostar a nuestro mejor equipo. 

Como un análisis sobre los datos que obtuvimos en el último Postwork con respecto a las gráficas de Momios, podemos ver que en el mundo de las apuestas debemos de estar dispuestos a tener altas y bajas, ya que se debe de tener un capital bastante grande para empezar a apostar y tener paciencia ya que aproximadamente analizando la gráfica de la apuesta 300 es cuando vamos a tener puras ganancias en subida, pero antes de eso, estaremos subiendo y bajando. 

Una de las habilidades que consideramos más importantes durante este proceso es el de la limpieza de datos así como una buena documentación, desarróllamos el criterio de análisis de nuestros resultados y a jamás asumir que la información recibida o generada es 100% correcta, se requiere tomarse el tiempo para verificar que todos los tipos de dato, formatos o cantidad de información sea la necesaria y en caso de que no sea así contamos con varias herramientas a utilizar según nos convenga.

Es importante resaltar que con estas habilidades desarrolladas tenemos una infinidad de aplicaciones para la vida real, a demás del fútbol pudimos ver ejemplos prácticos de epidemiología, cambios climáticos, poblacionales, toma de decisiones bancarias de acuerdo al perfil del cliente, y si bien siempre se ha sabido que la información es poder ahora más que nunca resaltamos que no solo es tener información el verdadero poder se encuentra en saber trabajar con la información y obtener datos de valor.
<br/>
