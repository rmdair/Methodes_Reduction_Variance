# Variance Reduction Methods

## Overview  
Monte Carlo simulations are powerful tools for estimating complex probabilistic quantities, but they often suffer from **high variance**, which can limit their efficiency, particularly in the study of **rare events**. This project explores three major **variance reduction methods** to improve estimation accuracy while reducing computational cost:

1. **Importance Sampling (IS)**: Adjusts the sampling distribution to better capture rare events.
2. **Control Variates (CV)**: Exploits correlations between random variables to reduce the variance of the estimator.
3. **Stratification (ST)**: Segments the sampling space into homogeneous groups to refine estimations.

The theoretical approach is complemented by a **real-world application in sports analytics**, where we evaluate the probability of an exceptional score in a match involving LOSC (Lille Olympique Sporting Club).

## Report Contents  
The report covers the following aspects:
- **Theoretical foundations of Monte Carlo simulations**.
- **Detailed presentation of variance reduction methods**.
- **Mathematical demonstrations of key properties**.
- **Performance comparison of the methods in practical cases**.
- **Application to LOSC match data to estimate the probability of winning by at least 8 goals**.

**Access the full report in English:**  
➡️ [Variance Reduction Methods (PDF)](Variance_Reduction_Methods.pdf)

## Code and Data  
This project includes several **R** implementations (accessible via [this link](./data/)):
- Estimation using **Control Variates**.
- Estimation using **Stratification**.
- Application to LOSC performance analysis using **Importance Sampling**.

The variances obtained from these methods are compared with the standard Monte Carlo approach.

**Dataset Used:**  
Match data from LOSC over the last 20 seasons is available here:  
➡️ [Check CSV Data](./data/LOSC.csv)

## References  
- Rasmussen & Glynn, *Stochastic Simulation: Algorithms and Analysis*, Springer, 2009.  
- Christian P. Robert & George Casella, *Monte Carlo Statistical Methods*, Springer, 2004.  
- Rubinstein & Kroese, *Simulation and the Monte Carlo Method*, Wiley, 2016.  
- *Pour la Science*, n°385, *Hasard et incertitude, les défis qu’ils posent*, November 2009.  

