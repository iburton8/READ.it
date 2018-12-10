#' This creates a sampling function.
#' The sample created by this function is of the length n for a given pdf
#'
#' @param n - is the number elements to be returned buy the function
#' @param pdf - is the user give probability density function used to create the sample
#' @param a - is the lower bound of the value of elements is the sample
#' @param b - is the upper bound of the value of elements is the sample
#' @param C - is >= to the max value of the pdf
#'
#' @return This returns a vector of n sample that have been excepted as being valid according to pdf of the
#' interval (a, b)
#'
#' @importFrom stats dnorm
#' @importFrom stats runif
#'
#' @examples
#' exppdf <- function(x){
#' exp(x)/(1+exp(x))^2}
#' s_func(n = 1000, pdf = exppdf, a = -4, b = 4, C= 1)
#'
#'normpdf <- function(x){
#'dnorm(x)}
#' s_func(n = 1000, pdf = normpdf, a = -4, b = 4, C= 1)
#' @export
s_func <- function(n, pdf, a, b, C){
  sim_data <- numeric(0)
  while(length(sim_data) < n){
      u <- runif(1,a,b)
      v <- runif(1,0,C)
      if(v < pdf(u)) {#then accept else reject
        sim_data <- c(sim_data, u)
      }
    }
  return(sim_data)
}





