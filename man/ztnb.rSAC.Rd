\name{ztnb.rSAC}
\alias{ztnb.rSAC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimating the expected number of species represented r or more times
}
\description{
The function estimates the expected number of species represented at least 
r times in a random sample based on the initial sample using zero-truncated
negative binomial (ZTNB) model.
}
\usage{
ztnb.rSAC(n, r=1, size=SIZE.INIT, mu=MU.INIT)
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
  \item{r}{
    A positive integer. Default is 1.
  }
  \item{size}{
    A positive double, the initial value of the parameter \code{size} in
    the negative binomial distribution for the EM algorithm. Default value is 1.
  }
  \item{mu}{
    A positive double, the initial value of the parameter \code{mu} in the
    negative binomial distribution for the EM algorithm. Default value is 0.5.
  }
}
\details{
  The statistical assumption is that for each species the number of individuals
  in a sample follows a Poisson distribution. The Poisson rate \code{lambda}
  are numbers generated from a gamma distribution. So the random variable
  \code{X}, which is the number of species represented x (x > 0) times in the
  sample, follows a zero-truncated negative binomial distribution. The
  unknown parameters are estimated by the function \code{preseqR.ztnb.em} based
  on the initial sample. Using the estimated distribution, we calculate the 
  expected number of species represented at least r times in a random sample.
  Details of the estimation procedure can be found in the supplement of 
  Daley T. and Smith AD. (2013).
}
\value{
  The constructed estimator for the number of species represneted at least r
  times in a sample. The input of the estimator is a vector of sampling 
  efforts t, i.e. the relative sample sizes comparing with the initial sample.
  For example, t = 2 means a random sample that is twice the size of the 
  initial sample.
}
\author{
  Chao Deng
}
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{preseqR.ztnb.em}}
}

\references{
Daley, T., & Smith, A. D. (2013). Predicting the molecular complexity of
sequencing libraries. Nature methods, 10(4), 325-327.
}

\examples{
## load library
library(preseqR)

## import data
data(FisherButterflyHist)

## construct the estimator for the number of species represented at least once
## in a random sample
ztnb1 <- ztnb.rSAC(FisherButterflyHist, r=1)
## The number of species represented at least once, when the sample size is 
## 10 or 20 times of the initial sample
ztnb1(c(10, 20))

## construct the estimator for the number of species represented at least twice
## in a random sample
ztnb2 <- ztnb.rSAC(FisherButterflyHist, r=2)
## The number of species represented at least twice, when the sample size is 
## 50 or 100 times of the initial sample
ztnb2(c(50, 100))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Estimator, r-SAC, Parametric }
