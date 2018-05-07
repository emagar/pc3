setwd("/home/eric/Desktop/MXelsCalendGovt/elecReturns/data") # establece directorio

d <- read.csv(file = "aymu1985-present.coalAgg.csv", stringsAsFactors = FALSE) # lee los datos

head(d) # inspecciona
colnames(d)

sel <- which(d$edo=="san")
length(sel)

d2 <- d[sel,] # sólo las observaciones de san luis

table(d2$yr)
d2 <- d2[d2$yr>=1997,] # quita años anteriores a 1997
table(d2$nota)


d2$d2v <- as.numeric(d2$nota=="segunda ronda")
table(d2$d2v)

sel <- which(d2$yr==1997)
data.frame(d2$mun[sel], d2$d2v[sel])

# identifica elecciones que no se resolvieron en la primera vuelta
sel <- which(d2$nota=="segunda ronda")
d2$dballotage <- 0
d2$dballotage[sel-1] <- 1

sel <- which(d2$yr==1997)
data.frame(d2$mun[sel], d2$d2v[sel], d2$dballotage[sel])

d2 <- d2[d2$d2v==0,] # preserva solo primeras vueltas
d2$d2v <- NULL
dim(d2)

# dummy de años con 2 vueltas
d2$d2v <- as.numeric(d2$yr>=1997 & d2$yr<=2003)
d2$d2v



table(d2$ncand)
t <- table(d2$d2v+1, d2$ncand)
t
round(t/rowSums(t),2)

mean(d2$ncand)
mean(d2$ncand[d2$d2v==0])
mean(d2$ncand[d2$d2v==1])

sel <- grep("v[0-9]", colnames(d2))
colnames(d2)[sel]
head(d2[,sel])

which(d2$v2==0)
d2$sf = d2$v03/d2$v02

hist(d2$sf)
hist(d2$sf[d2$d2v==0])
hist(d2$sf[d2$d2v==1])

# controlar margen

setwd("~/Desktop/pc3/parcial/")

