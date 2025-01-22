# prepara datos
datos <- data.frame(
    dulzor       = c(0,0,0,.1,1,2,.2,2,4),
    vueltas.cuch = c(0,1,2,0,1,2,0,1,2),
    terrones.az  = c(0,0,0,1,1,1,2,2,2)
)

# así se ven
datos

# añade ruido a DV = dulzor
ruido <- rnorm(9, mean=0, sd=.1)

# así se ve
ruido

datos$dulzor <- datos$dulzor + ruido
datos

mod1 <- lm(dulzor ~ vueltas.cuch, data = datos)
mod2 <- lm(dulzor ~ terrones.az, data = datos)
mod3 <- lm(dulzor ~ vueltas.cuch + terrones.az, data = datos)
summary(mod1)
summary(mod2)
summary(mod3)

mod4 <- lm(dulzor ~ vueltas.cuch + terrones.az + vueltas.cuch*terrones.az, data = datos)
summary(mod4)

# grafica modelos 2 y 3
with(datos, plot(y=dulzor, x=terrones.az))
abline(mod2, lty=2); text(x=1.5,y=1.8,"dul=f(azucar)")
abline(mod3, lty=3); text(x=1.5,y=0.8,"dul=f(azucar,vueltas)")

# nuevos datos para simulaciones
newd0 <- datos; newd0$vueltas.cuch <- 0
newd1 <- datos; newd1$vueltas.cuch <- 1
newd2 <- datos; newd2$vueltas.cuch <- 2

# grafica modelo 4 interactivo
with(datos, plot(y=dulzor, x=terrones.az))
lines(y=predict(mod4, newd2), x=datos$terrones.az); text(x=1.5,y=3.3,"2 vueltas") 
lines(y=predict(mod4, newd1), x=datos$terrones.az); text(x=1.5,y=1.8,"1 vuelta")
lines(y=predict(mod4, newd0), x=datos$terrones.az); text(x=1.5,y=0.3,"sin remover") 

