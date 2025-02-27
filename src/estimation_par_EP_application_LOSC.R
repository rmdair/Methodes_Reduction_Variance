set.seed(4)

data <- read.csv2("https://rmdair.com/data/LOSC.csv", header=F, stringsAsFactors = FALSE, na.strings = c(""))
X <- as.vector(as.matrix(data))
X <- X[!is.na(X)]

n <- length(X)
mu <- mean(X)
sigma <- sd(X)
N <- (X-mu) / sigma

valeur_exacte <- 1-(pnorm(4.663381, 0, 1))

MCC <- mean(ifelse(X >= 8, 1, 0))

Y <- rt(n, 2)
w <- dnorm(Y) / dt(Y,2)
EP <- mean(w * ifelse(Y >= 4.663381, 1, 0))

ESS <- function(n) {
  sum_1 <- 0
  sum_2 <- 0
  for (i in 1:n) {
    sum_1 <- sum_1 + w[i]
    sum_2 <- sum_2 + w[i]^2
  }
  return(sum_1^2 / sum_2)
}

cat("Estimation par MCC:", MCC)
cat("Estimation par EP:", EP)
cat("Taille effective ESS:", ESS(n))

var_MCC <- ((n-1)/n) * var(ifelse(N >= 4.663381, 1, 0))
var_EP <- ((n-1)/n) * var(ifelse(Y >= 4.663381, 1, 0) * w)
cat( "Variance par MCC:", var_MCC )
cat( "Variance par EP:", var_EP )
