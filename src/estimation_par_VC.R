set.seed(1)

f <- function(u) {
  return(sin(0.5*pi*u))
}

monte_carlo <- function(sample, n) {
  moyenne <- mean(sample)
  variance <- ((n-1)/n) * var(sample)
  return(c(moyenne = moyenne, variance = variance)) 
}

n <- 10^4

sample_U <- runif(n)
sample_MCC <- f(sample_U)
sample_VC1 <- f(sample_U) - (sample_U - 1/2)
sample_VC2 <- f(sample_U) - (log(1 + 2*sample_U) - 0.6479184)

tableau <- data.frame(
  MCC = monte_carlo(sample_MCC, n),
  VC1 = monte_carlo(sample_VC1, n),
  VC2 = monte_carlo(sample_VC2, n)
)

rownames(tableau) <- c("Moyenne", "Variance")
tableau


