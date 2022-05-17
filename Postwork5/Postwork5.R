#  ---------------------------
# | Postwork 5 - Equipo 15  |
#  --------------------------

#1.-
#filtramos las columnas que necesitamos del dataframe de soccer, retirando X y FTR
SmallData <- select(Soccer, -FTR)
SmallData <- select(SmallData, Date, HomeTeam, FTHG, AwayTeam ,FTAG)
summary(SmallData)
#damos formato a los datos según vamos a requerir en fbRanks
colnames(SmallData) <- c("date", "home.team", "home.score", "away.team", "away.score")

write.csv(SmallData, file = "Soccer.csv", row.names = F)

#2.-
#install.packages("fbRanks")
library(fbRanks)

listasoccer <- create.fbRanks.dataframes(scores.file = "Soccer.csv")
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams

head(listasoccer$scores)

#3.-
#Con ayuda de la función unique crea un vector de fechas  
#que no se repitan y que correspondan a las fechas en las que se jugaron partidos. 

fecha <- unique(SmallData$date)
n <- length(fecha)

#obtenemos los rankings desde el 18/08/2017 al 23/12/2020
#Team Ranks Via Poission Regression: Creates ranks using a dataframe of match records. 
ranking <- rank.teams(anotaciones,equipos, 
                      max.date = max(fecha), min.date = min(fecha))

#4.-
#Predict function for fbRanks Objec  will predict the result (win, loss, tie) 
#and goals for a set of matches between teams.
#Cargamos la lista de ranking y escogemos la posición del vector de fechas para que nos de las predicciones
predict(ranking, date = fecha[n])
