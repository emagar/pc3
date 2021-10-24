#################################################
## ejemplos para el análisis del trabajo final ##
#################################################

options(stringsAsFactors=FALSE)
setwd("/home/eric/Downloads/Desktop/pc3/final/data/") # ruta a donde radican los datos

# lee los datos municipales
ce.mu <- read.csv(file = "censo2020-mu.csv")
ph.mu <- read.csv(file = "phys-mu.csv")

# explora
str(ce.mu)
str(ph.mu)

# consolida los datos
dat <- merge(x = ph.mu[, -grep("edon?", colnames(ph.mu))], y = ce.mu, by = "inegi", all = TRUE)
dim(ce.mu); dim(ph.mu); dim(dat)

png("../graph/pyr1.png")
plot(    dat$di.pyram,  dat$mean.rwi)
dev.off()
plot(log(dat$di.pyram), dat$mean.rwi)

sel <- which(dat$di.pyram < 500)
plot(dat$di.pyram[sel], dat$mean.rwi[sel])


plot(dat$lon, dat$mean.rwi)
plot(dat$lat, dat$mean.rwi)

dat$norte <- dat$lat
dat$occid <- -dat$lon

#sel <- which(dat$ed %in% c("bc", "bcs", "coa", "cua", "dgo", "nl", "sin", "son", "tam")
sel <- which(dat$edo %in% c("bc", "bcs", "coa", "cua", "nl", "son", "tam"))
plot(dat$lat[-sel], dat$mean.rwi[-sel])
reg <- lm(dat$mean.rwi[-sel] ~ dat$lat[-sel])
abline(reg)

plot(dat$tri, dat$mean.rwi)
reg <- lm(dat$mean.rwi ~ dat$tri)
abline(reg)

cor(dat$mean.rwi, dat$tri, method = "pearson", use = "complete.obs")
cor.test(dat$mean.rwi, dat$tri, method = "pearson", use = "complete.obs")

reg <- lm(dat$mean.rwi ~ dat$tri + dat$norte + dat$occid)
summary(reg)


