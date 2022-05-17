
library(plotly)

#install.packages("plotly")
#  ---------------------------------------------
# |  Postwork 1      |
#  ---------------------------------------------
# 1-
# Se Importa datos de soccer de la temporada 2019/2020 de la primera división
  soccer19_20 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

  
  
# Verificamos las variables y de que tipo son
  str(soccer19_20)
  summary(soccer19_20)

  
# 2-
# Se extrae los goles anotados por los equipos
  G_Casa <- soccer19_20[, "FTHG"]        # Goles anotados por equipos de casa
  G_Visitante <- soccer19_20[, "FTAG"]   # Goles anotados por equipos visitantes

  
# 3-
# Consulta como funciona la funcion "table" (?table)
  ?table

  
# 4-
# Se realiza las tablas de frecuencia para obtener las sig probabilidades
  F_GCasa <- table(G_Casa); F_GCasa                  # T.Frec. goles de casa
  F_GVisitante <- table(G_Visitante); F_GVisitante   # T.Frec. goles visitantes

  
# La probabilidad (marginal) de que el equipo de casa anote X goles
  P_GCasa <- prop.table(F_GCasa)
  paste("La probabilidad (%) de que el equipo de casa anote X goles es: ")
  P_GCasa <- round((P_GCasa * 100), 3); P_GCasa

  
# La probabilidad (marginal) de que el equipo de visitante anote Y goles
  P_GVisitante <- prop.table(F_GVisitante)
  paste("La probabilidad (%) de que el equipo visitante anote Y goles es: ")
  P_GVisitante <- round((P_GVisitante * 100), 3); P_GVisitante

  
# La probabilidad (conjunta) de que el equipo de casa anote X goles y el 
# equipo que juega como visitante anote Y goles
  P_Conj <- prop.table(table(G_Casa, G_Visitante))
  paste("La probabilidad conjunta (%) de que el equipo de casa anote X goles y el equpo visitante anote Y goles: ")
  P_Conj <- round((P_Conj * 100), 3); P_Conj


#  ---------------------------------------------
# | Postwork 2        |
#  ---------------------------------------------
  
library(dplyr)

# 1-
# Se Importa datos de soccer de la temporada 2017/2018, 2018-2019, 2019-2020 de la primera división
  URL_17_18 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
  URL_18_19 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
  URL_19_20 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
  
  setwd(choose.dir(caption = "Select folder"))

  
# Se descarga los dataset
  download.file(url = URL_17_18, destfile = "soccer17_18.csv", mode = "wb")
  download.file(url = URL_18_19, destfile = "soccer18_19.csv", mode = "wb")
  download.file(url = URL_19_20, destfile = "soccer19_20.csv", mode = "wb")

  
# Se lee y guarda en una lista los 3 dataset
  SoccerList <- lapply(dir(), read.csv)

  
# Verifica los tipos de datos que contienen
  str(SoccerList[[1]])
  str(SoccerList[[2]])
  str(SoccerList[[3]])

  
# Se modifica el tipo de variable Date para que pueda ser entendida como variable de 
# fecha, mediante la funcion mutate. Tener en cuenta que los data set no cuenta con la 
# misma codificacion en la fecha como lo es el dataset 2017-2018
  SoccerList[[1]] <- mutate(SoccerList[[1]], Date = as.Date(Date, "%d/%m/%y"))
  SoccerList[[2]] <- mutate(SoccerList[[2]], Date = as.Date(Date, "%d/%m/%Y"))
  SoccerList[[3]] <- mutate(SoccerList[[3]], Date = as.Date(Date, "%d/%m/%Y"))

  
# Ahora se sustrae las columnas que se utilizaran de los dataset
  SoccerList <- lapply(SoccerList, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)


# Se verifica que los datos esten correctos y las columnas elegidas sean las correctas
  str(SoccerList[[1]])
  str(SoccerList[[2]])
  str(SoccerList[[3]])

  
# Se combinan los componentes de la lista en un solo dataFrame
  Soccer <- do.call(rbind, SoccerList)


# Se comprueba que todo este correcto
  str(Soccer); View(Soccer)

  
# Por ultimo se exporta el dataFrame a un archivo csv
  write.csv(Soccer, "Soccer_2017-2020.csv", row.names = FALSE)


#  ---------------------------------------------
# |  Postwork 3       |
#  ---------------------------------------------
  library(ggplot2)

# 1-  
# Se extrae los goles anotados por los equipos
  G_Casa <- Soccer[, "FTHG"]        # Goles anotados por equipos de casa
  G_Visitante <- Soccer[, "FTAG"]   # Goles anotados por equipos visitantes
  

# Se realiza las tablas de frecuencia para obtener las sig probabilidades
  F_GCasa <- table(G_Casa); F_GCasa                  # T.Frec. goles de casa
  F_GVisitante <- table(G_Visitante); F_GVisitante   # T.Frec. goles visitantes


# La probabilidad (marginal) de que el equipo de casa anote X goles
  P_GCasa <- prop.table(F_GCasa)
  paste("La probabilidad (%) de que el equipo de casa anote X goles es: ")
  P_GCasa <- round((P_GCasa * 100), 3); P_GCasa


# La probabilidad (marginal) de que el equipo de visitante anote Y goles
  P_GVisitante <- prop.table(F_GVisitante)
  paste("La probabilidad (%) de que el equipo visitante anote Y goles es: ")
  P_GVisitante <- round((P_GVisitante * 100), 3); P_GVisitante


# La probabilidad (conjunta) de que el equipo de casa anote X goles y el 
# equipo que juega como visitante anote Y goles
  P_Conj <- prop.table(table(G_Casa, G_Visitante))
  paste("La probabilidad conjunta (%) de que el equipo de casa anote X goles y el equpo visitante anote Y goles: ")
  P_Conj <- round((P_Conj * 100), 3); P_Conj


# 2-
# Para realizar las graficas de la probalidades marginales, primero estas se
# almacenan en un dataFrame
  Local <- as.data.frame(P_GCasa)
  colnames(Local) <- c("Goles","Probabilidad"); Local
  
  Visit <- as.data.frame(P_GVisitante)
  colnames(Visit) <- c("Goles","Probabilidad"); Visit
  
  Conj <- as.data.frame(P_Conj)
  colnames(Conj) <- c("Goles_Local", "Goles_Visit","Probabilidad"); Conj

  

# Grafico de barras para las prob. marginales del numero de goles del equipo Local  
  GL <- ggplot(Local, aes(x = Goles, y = Probabilidad)) + 
    geom_col(colour = "black", fill= "yellow") +
    ggtitle("Probabilidades marginales de goles de equipos Locales") + 
    xlab("Goles") +
    ylab("Probabilidades %") +
    theme_light()
  GL
  ggplotly(GL)

# Grafico de barras para las prob. marginales del numero de goles del equipo Visitante
  GV <- ggplot(Visit, aes(x = Goles, y = Probabilidad)) + 
    geom_col(colour = "black", fill= "#EB244E") +
    ggtitle("Probabilidades marginales de goles de equipos Visitantes") + 
    xlab("Goles") +
    ylab("Probabilidades %") +
    theme_light()
  
  GV
  ggplotly(GV)

# Grafico de mapa de calor (HeatMap) para las prop. conjuntas de los goles anotados por 
# el equipo Local y el equipo Visitante en un partido
  G_Conj <- ggplot(Conj, aes(x = Goles_Local, y = Goles_Visit, fill = Probabilidad)) + 
    geom_tile() +
    scale_fill_gradientn(colours = colorspace::heat_hcl(7)) +
    ggtitle("Mapa de calor de la probabilidad conjunta", subtitle = 'Pendiente') +
    labs(x = "Goles locales", y = "Goles visitantes", fill = "Probabilidad %")
  
  G_Conj
  ggplotly(G_Conj)

#  ---------------------------------------------
# |  Postwork 4       |
#  ---------------------------------------------
  
# Ahora investigarás la dependencia o independencia del número de goles anotados por el 
# equipo de casa y el número de goles anotados por el equipo visitante mediante un 
# procedimiento denominado bootstrap, revisa bibliografía en internet para que tengas 
# nociones de este desarrollo.


# 1.
# Ya hemos estimado las probabilidades conjuntas de que el equipo de casa anote X=x 
# goles (x=0,1,... ,8), y el equipo visitante anote Y=y goles (y=0,1,... ,6), en un 
# partido. Obtén una tabla de cocientes al dividir estas probabilidades conjuntas por 
# el producto de las probabilidades marginales correspondientes.

  Conj[, 4] = rep(0, length(Conj[,1]))
  for(i in 1:length(Conj[,1])){
    for (j in 1:length(Local$Goles)) {
      for (k in 1:length(Visit$Goles)) {
        if((Conj[i,1] == Local[j,1]) & (Conj[i,2] == Visit[k,1])){
          Conj[i,4] = Local[j,2] * Visit[k,2]
        }
        
      }
      
    }
  }
  
  Conj <- rename(Conj, Prod_Marg = V4)
  Conj[,"Prod_Marg"] <- Conj[,"Prod_Marg"] / 100
  Conj[, "Cociente"] <- Conj$Probabilidad/Conj$Prod_Marg
  
  length(Conj[, 1])


# 2.
# Mediante un procedimiento de boostrap, obtén más cocientes similares a los obtenidos 
# en la tabla del punto anterior. Esto para tener una idea de las distribuciones de la 
# cual vienen los cocientes en la tabla anterior. Menciona en cuáles casos le parece 
# razonable suponer que los cocientes de la tabla en el punto 1, son iguales a 1 
# (en tal caso tendríamos independencia de las variables aleatorias X y Y).


  library(rsample)

  set.seed(1111)
  n = 10000
  muestras <- bootstraps(Conj, times = n)

  head(muestras)
  
  Medias <- c()

  for (i in 1:n) {
    Muest_Prueba <- as.data.frame(muestras$splits[[i]])
    Medias[i] <- mean(Muest_Prueba$Cociente)
    
  }
  
  head(Medias)
  
  summary(Medias)
  
Graph <- ggplot() + 
          geom_histogram(aes(Medias), bins = 50, col="black", fill = "yellow") + 
          geom_vline(aes(xintercept = mean(Medias)), linetype = "dashed", color = "red") +
          ggtitle('Histograma de la distribuci�n de las medias muestrales.')+
          ylab("Frecuencias")

Graph


t.test(Medias, alternative = "two.sided", mu = 1)
