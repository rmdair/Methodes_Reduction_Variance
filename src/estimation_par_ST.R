set.seed(1) 

n <- 10^4
num_strata <- 5
strata_values <- seq(0, 1, length.out = num_strata + 1)

sample_unif <- runif(n)

compute_mean <- function(i) {
  return(mean(sample_unif[sample_unif >= strata_values[i] 
           & sample_unif < strata_values[i + 1]]))
}
compute_mean_sq <- function(i) {
  return(mean(sample_unif[sample_unif >= strata_values[i] 
         & sample_unif < strata_values[i + 1]]^2))
}

mean_stratum <- sapply(1:num_strata, function(i) compute_mean(i))
mean_sq_stratum <- sapply(1:num_strata, function(i) compute_mean_sq(i))

estimator_MC <- sum(sample_unif) / n
estimator_ST <- sum((1/5) * mean_stratum)

variance_MC <- (integrate(function(u) u^2 * 
        dunif(u, 0, 1), -Inf, Inf)$value - (1/2)^2) / n
variance_ST <- sum((1/5) * (mean_sq_stratum - mean_stratum^2)) / n
variance_ST_min <- sum((1/5) * sqrt(mean_sq_stratum - mean_stratum^2))^2 / n

cat("Monte Carlo Estimator:", estimator_MC)
cat("Stratified Sampling Estimator:", estimator_ST)

cat("Monte Carlo Variance:", variance_MC)
cat("Stratified Sampling Variance:", variance_ST)
cat("Minimum Stratified Sampling Variance:", variance_ST_min)
