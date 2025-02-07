set.seed(1)

n <- 10^4
nb_strates <- 5
valeurs_strates <- seq(0, 1, length.out = nb_strates + 1)
ech_unif <- runif(n)

f <- function(i) {
  return( mean(ech_unif[ech_unif >= valeurs_strates[i]
                        & ech_unif < valeurs_strates[i + 1]]) )
}
g <- function(i) {
  return( mean(ech_unif[ech_unif >= valeurs_strates[i]
                        & ech_unif < valeurs_strates[i + 1]]^2) )
}

mean_strate <- sapply(1:nb_strates, function(i) f(i))
mean_sq_strate <- sapply(1:nb_strates, function(i) g(i))

estimateur_MCC <- sum(ech_unif) / n
estimateur_ST <- sum((1/5) * mean_strate)

variance_MCC <- (integrate(function(u) u^2 * dunif(u, 0, 1), -Inf, Inf)$value - (1/2)^2) / n
variance_ST <- sum((1/5) * (mean_sq_strate - mean_strate^2)) / n
variance_ST_minimale <- sum((1/5) * sqrt(mean_sq_strate - mean_strate^2))^2 / n

cat("Estimateur par MCC :", estimateur_MCC)
cat("Estimateur par ST :", estimateur_ST)
cat("Variance par MCC:", variance_MCC)
cat("Variance par ST :", variance_ST)
cat("Variance minimale par ST :", variance_ST_minimale)
