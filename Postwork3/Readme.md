# Postwork 3 - Análisis Exploratorio de Datos (AED o EDA) con R
## :dart: Objetivos
- Realizar descarga de archivos desde internet
- Generar nuevos data frames
- Visualizar probabilidades estimadas con la ayuda de gráficas

## 🔧 Requisitos
* R, RStudio
* Haber realizado el prework y seguir el curso de los ejemplos de la sesión
* Curiosidad por investigar nuevos tópicos y funciones de R

## 🤓 Desarrollo
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
