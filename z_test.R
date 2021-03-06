z.test <- function(sample, mu, sigma, alternative='two.sided') {
  n <- length(sample)
  xbar <- mean(sample, nc.rm=T)
  z <- (zbar - mu)/(sigma/sqrt(n))
  
  if (alternative == 'two.sided'){
    p.value <- 2*pnorm(-abs(z))
    alt <- 'not equal '
    err <- -qnorm((1-conf.lvl)/2)*sigma/sqrt(n)
    a <- xbar - err
    b <- xbar + err
  }
  else if(alternative == 'greater'){
    p.value <- pnorm(z, lower.tail = F)
    alt <- 'greater than '
    err <- -qnorm((1-conf.lvl)/2)*sigma/sqrt(n)
    a <- xbar - err
    b <- 'Inf'
  }
  else if(alternative == 'less'){
    p.value <- pnorm(z)
    alt <- 'less than '
    err <- -qnorm((1-conf.lvl)/2)*sigma/sqrt(n)
    a <- '-Inf'
    b <- xbar + err
  }
  else{stop('alternative is misspecified, accepted values are \'two.sided\',\'greater\' or \'less\'\n')}
  
  cat('z = ', z, ' obs. = ', n, ' p-value = ', p.value, '\n')
  cat('alternative hypothesis: true mean is ', alt , mu, '\n')
  cat(a,' ',b, '\n')
  cat('mean of x/n', xbar, '\n')
}