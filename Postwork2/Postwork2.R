#  ---------------------------------------------
# | Postwork 2        |
#  ---------------------------------------------

library(dplyr)

# 1-
# Se Importa datos de soccer de la temporada 2017/2018, 2018-2019, 2019-2020 de la primera divisiÃ³n
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

