setwd("/home/eric/Desktop/MXelsCalendGovt/elecReturns/data")

d <- read.csv(file = "aymu1985-present.coalAgg.csv", stringsAsFactors = FALSE)
dim(d)

# elimina antes de 2000
sel <- which(d$yr < 2000)
d <- d[-sel,]
dim(d)

# quitar casos sin contendiente o sin datos
table(d$ncand)
sel <- which(d$ncand==1 | d$ncand==0)
d <- d[-sel,]

# quitar casos con 2 contendientes
sel <- which(d$ncand==2)
d <- d[-sel,]




# margen, cociente sf, 3+ etc
d$mg <- (d$v01 - d$v02)/d$efec
d$sf <- d$v03/d$v02
d$s3on <- (d$efec - d$v01 - d$v02)/d$efec
d$dmaj <- as.numeric( d$v01/d$efec > .5 )

hist(x = d$sf, breaks = 2)
hist(x = d$sf, breaks = 5)
hist(x = d$sf, breaks = 10)
hist(x = d$sf, breaks = 20)

# selecciona morelos
d2 <- d # duplica
sel <- which(d$edon==17)
d <- d[sel,]
table(d$yr)


sel <- which(d$mg<.1)
hist(x = d$sf[sel], breaks = 20)

sel <- which(d$mg>.2)
hist(x = d$sf[sel], breaks = 20)

# 







