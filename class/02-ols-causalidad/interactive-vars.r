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

