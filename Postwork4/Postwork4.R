#  ---------------------------------------------
# |  Postwork 4       |
#  ---------------------------------------------

# Ahora investigarÃ¡s la dependencia o independencia del nÃºmero de goles anotados por el 
# equipo de casa y el nÃºmero de goles anotados por el equipo visitante mediante un 
# procedimiento denominado bootstrap, revisa bibliografÃ­a en internet para que tengas 
# nociones de este desarrollo.


# 1.
# Ya hemos estimado las probabilidades conjuntas de que el equipo de casa anote X=x 
# goles (x=0,1,... ,8), y el equipo visitante anote Y=y goles (y=0,1,... ,6), en un 
# partido. ObtÃ©n una tabla de cocientes al dividir estas probabilidades conjuntas por 
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
# Mediante un procedimiento de boostrap, obtÃ©n mÃ¡s cocientes similares a los obtenidos 
# en la tabla del punto anterior. Esto para tener una idea de las distribuciones de la 
# cual vienen los cocientes en la tabla anterior. Menciona en cuÃ¡les casos le parece 
# razonable suponer que los cocientes de la tabla en el punto 1, son iguales a 1 
# (en tal caso tendrÃ­amos independencia de las variables aleatorias X y Y).


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
  ggtitle('Histograma de la distribución de las medias muestrales.')+
  ylab("Frecuencias")

Graph


t.test(Medias, alternative = "two.sided", mu = 1)
