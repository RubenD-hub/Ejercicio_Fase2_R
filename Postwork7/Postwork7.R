
#install.packages("mongolite")

library(mongolite)  

conexion_bd<- mongo(
  collection = "match",
  db="match_games", 
  url = "mongodb+srv://timmitonx:ismael132@cluster0.dmt93.mongodb.net/test",
  verbose = FALSE,
  options = ssl_options()
  )
alldata<- conexion_bd$find('{}')
alldata
class(alldata)

cantidad<- conexion_bd$count('{}')
cantidad

consulta<- conexion_bd$find(
  query = '{"date":"2015-12-20", "home.team":"Real Madrid"}',
  fields = '{"_id":false, "home.team":true, "home.score":true, "away.team":true, "away.score":true}'
)
consulta

rm(conexion_bd)
