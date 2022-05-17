# Postwork 7 - RStudio Cloud - GitHub, conexiones con BDs y lectura de datos externos.
## :dart: Objetivo
- Realizar el alojamiento de un fichero .csv a una base de datos (BDD), en un local host de mongodb a través de R.

## 🔧 Requisitos
* Mongodb Compass
* Librerías mongolite
* Nociones básicas de manejo de BDD

## 🤓 Desarrollo
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
