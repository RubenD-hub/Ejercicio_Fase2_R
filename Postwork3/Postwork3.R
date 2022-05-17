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
