\name{ds.rSAC}
\alias{ds.rSAC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimating the expected number of species represented r or more times
}
\description{
The function estimates the expected number of species represented at least 
r times in a random sample based on the initial sample.
}
\usage{
ds.rSAC(n, r=1, mt=20)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
    A two-column matrix.  
    The first column is the frequency \eqn{j = 1,2,\dots}; and the second column
    is \eqn{n_j}, the number of species with each species represented \eqn{j}
    times in the initial sample. The first column must be sorted in an
    ascending order.
  }
  \item{mt}{
    An positive integer constraining possible rational function
    approximations. Default is 20.
  }
  \item{r}{
    A positive integer. Default is 1.
  }
}
\details{
  Under a mixture of Poisson models, the expected number of
  species represented at least r times in a random sample 
  can be expressed as higher derivatives
  of the expected number of species represented at least once per unit of 
  sampling effort. 
  We first use rational function approximations to the 
  modified Good and Toulmin's (1956) non-parametric empirical Bayes power 
  series to estimate the average discovery rate. By differentiating the
  rational function approximation, we obtain an estimator 
  for the number of species represented at least r times in a random
  sample.

  This function is the fast version of \code{\link{ds.rSAC.bootstrap}}.
  The function does not provide an estimate for the confidence interval.
  If one needs the confidence interval, please use 
  \code{\link{ds.rSAC.bootstrap}} instead.
}
\value{
  The estimator for the number of species represented at least r times in 
  a random sample. The input of the estimator is a vector of sampling 
  efforts t, i.e. the relative sample sizes comparing with the initial sample.
  For example, t = 2 means a random sample that is twice the size of the 
  initial sample.
}
\references{
Kalinin V (1965). Functionals related to the poisson distribution and
statistical structure of a text. Articles on Mathematical Statistics and
the Theory of Probability pp. 202-220.

Daley, T and Smith, AD. (2013). Predicting the molecular complexity of
sequencing libraries. Nature methods, 10(4), 325-327.

Deng, C., Daley, T., & Smith, A. (2015). Applications of species accumulation
curves in large-scale biological data analysis. Quantitative Biology, 3(3),
135-144.

Deng, C and Smith, AD (2016). Estimating the number of species to attain 
sufficient representation in a random sample. arXiv preprint arXiv:1607.02804
}
\author{
  Chao Deng
}

\examples{
## load library
library(preseqR)

## import data
data(FisherButterflyHist)

## construct the estimator for the number of species represented at least once
## in a random sample
ds1 <- ds.rSAC(FisherButterflyHist, r=1)
## The number of species represented at least once, when the sample size is 
## 10 or 20 times of the initial sample
ds1(c(10, 20))

## construct the estimator for the number of species represented at least twice
## in a random sample
ds2 <- ds.rSAC(FisherButterflyHist, r=2)
## The number of species represented at least twice, when the sample size is 
## 50 or 100 times of the initial sample
ds2(c(50, 100))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Estimator, r-SAC, RFA, Nonparametric}
