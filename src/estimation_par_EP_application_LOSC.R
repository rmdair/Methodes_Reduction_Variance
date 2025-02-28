set.seed(4)

data <- read.csv2("directory_name/LOSC.csv", header=F, 
       stringsAsFactors = FALSE, na.strings = c(""))
X <- as.vector(as.matrix(data))
X <- X[!is.na(X)]

n <- length(X)
mu <- mean(X)
sigma <- sd(X)
N <- (X - mu) / sigma

exact_value <- 1 - (pnorm(4.663381, 0, 1))

MC_estimator <- mean(ifelse(X >= 8, 1, 0)) 

Y <- rt(n, 2)     
w <- dnorm(Y) / dt(Y, 2)
IS_estimator <- mean(w * ifelse(Y >= 4.663381, 1, 0)) 

ESS <- function(n) {
  sum_1 <- 0
  sum_2 <- 0
  for (i in 1:n) {
    sum_1 <- sum_1 + w[i]
    sum_2 <- sum_2 + w[i]^2
  }
  return(sum_1^2 / sum_2)
}

cat("Monte Carlo Estimation:", MC_estimator)
cat("Importance Sampling Estimation:", IS_estimator)
cat("Effective Sample Size (ESS):", ESS(n))

var_MC <- ((n-1)/n) * var(ifelse(N >= 4.663381, 1, 0))
var_IS <- ((n-1)/n) * var(ifelse(Y >= 4.663381, 1, 0) * w)
cat("Monte Carlo Variance:", var_MC)
cat("Importance Sampling Variance:", var_IS)
