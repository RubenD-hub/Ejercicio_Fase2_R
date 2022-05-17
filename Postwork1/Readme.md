# Postwork 1 - Introducción a R y Software
## :dart: Objetivo
- Tiene como objetivo que practiques los comandos básicos aprendidos durante la sesión, de tal modo que sirvan para reafirmar el conocimiento. Recuerda que la programación es como un deporte en el que se debe practicar, habrá caídas, pero lo importante es levantarse y seguir adelante.

## 🔧 Requisitos
* Concluir los retos
* Haber estudiado los ejemplos durante la sesión

## 🤓 Desarrollo
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

##### Nota. Para más información y ejemplos sobre las funciones table y prop.table se puede consultar la siguiente liga: https://fhernanb.github.io/Manual-de-R/tablas.html
