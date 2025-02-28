set.seed(1)

f <- function(u) {
  return(sin(0.5*pi*u))
}

monte_carlo <- function(sample, n) {
  mean_value <- mean(sample)
  variance_value <- ((n-1)/n) * var(sample)
  return(c(mean = mean_value, variance = variance_value)) 
}

n <- 10^4

sample_U <- runif(n)

sample_MC <- f(sample_U)
sample_CV1 <- f(sample_U) - (sample_U - 1/2)
sample_CV2 <- f(sample_U) - (log(1 + 2*sample_U) - 0.6479184)

result_table <- data.frame(
  MC = monte_carlo(sample_MC, n),
  CV1 = monte_carlo(sample_CV1, n),
  CV2 = monte_carlo(sample_CV2, n)
)

rownames(result_table) <- c("Mean", "Variance")
result_table
