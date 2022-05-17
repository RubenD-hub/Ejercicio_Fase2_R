#  ---------------------------------------------
# |  Postwork 1      |
#  ---------------------------------------------
# 1-
# Se Importa datos de soccer de la temporada 2019/2020 de la primera divisiÃ³n
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

