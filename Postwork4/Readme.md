# Postwork 4 - Algunas distribuciones, teorema central del límite y contraste de hipótesis
## :dart: Objetivo
- Investigar la dependencia o independecia de las variables aleatorias X y Y, el número de goles anotados por el equipo de casa y el número de goles anotados por el equipo visitante.

## 🔧 Requisitos
* R, RStudio
* Haber trabajado con el prework y el work

## 🤓 Desarrollo
Ahora investigarás la dependencia o independencia del número de goles anotados por el equipo de casa y el número de goles anotados por el equipo visitante mediante un procedimiento denominado bootstrap, revisa bibliografía en internet para que tengas nociones de este desarrollo.

#### 1. Ya hemos estimado las probabilidades conjuntas de que el equipo de casa anote X=x goles (x=0,1,... ,8), y el equipo visitante anote Y=y goles (y=0,1,... ,6), en un partido. Obtén una tabla de cocientes al dividir estas probabilidades conjuntas por el producto de las probabilidades marginales correspondientes.

Primero creamos una nueva columna de ceros con la misma longitud que el dataframe Conj, el cual contiene la informacion de goles como local, goles como visitante y la probabilidad conjunta.
```R
Conj[, 4] = rep(0, length(Conj[,1]))
```
Luego llenamos esta columna con el producto de las probabilidades marginales de obtener X goles como local y Y goles como visitante. Por ejemplo, los productos de las probabilidades marginales de obtener 0 goles como visitante y 0, 1, 2, 3, 4, 5 o 6 goles como local.
Así, queremos estudiar si se cumple que la probabilidad conjunta sea igual al producto de las probabilidades marginales, es decir, si    
- <img src="https://latex.codecogs.com/gif.latex?f(x,y)=f(x)*f(y). " /> 

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

Ahora guardemos en una variable "muestras" nuestras muestras generadas por la función bootstrap que como podremos ver se le pasan como parámetros nuestro dataframe que representa nuestra muestra original y el parámetro n que representa nuestro número de muestras que queremos generar.

```R
muestras <- bootstraps(Conj, times = n)
```

En la variable muestras como bien mencionamos en la explicación de arriba estará compuesta por dos columnas, la primera con las muestras y la segunda por un identificador, las muestras se guardan en splits de la siguiente forma:
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

Podemos observar que tenemos una distribución normal para nuestro gráfico con el vector de Medias, dado que se puede apreciar la forma de una Campana de Gauss. 

Para la parte de nuestra hipótesis dada sobre decidir si nuestras Medias obtenidas son independientes o dependientes se propuso de la siguiente forma: <br/>
H<sub>0</sub>: μ = 1 (Las variables son Independientes) vs H<sub>a</sub>: μ ≠  1  (Las variables son Dependientes) <br/>
Empleamos la función t.test para comprobar la hipótesis y estos fueron los resultados
```R
t.test(Medias, alternative = "two.sided", mu = 1)
```
![alt text](https://raw.githubusercontent.com/IsmaelOr/BEDU_Proyecto_Equipo15/main/Imagenes/Postwork4/test.PNG)

Dado que nos resulto el p-value= 2.2e-16 y esto es menor a 1 podemos rechazar nuestra Hipótesis nula sobre que nuestras variables son independientes y aceptar la Hipótesis alternativa sobre que nuestras variables Goles de Local y Goles de Visita son <strong>Dependientes.</strong>

##### Nota.Para más información y ejemplos sobre las funciones empleadas se puede consultar las siguientes ligas:
* https://biocosas.github.io/R/100_bootstrap.html
* https://tereom.github.io/est-computacional-2018/bootstrap-en-r.html
