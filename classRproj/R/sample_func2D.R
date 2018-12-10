#' This creates a 2 Dimentional Sampling Function
#' The sample created by this function is of the length n for a given joint pdf
#'
#' @param n - is the number elements to be returned buy the function.
#' @param jointpdf - is the user give joint probability density function used to create the sample.
#' @param a - is the lower bound of the value of elements is the sample.
#' @param b - is the upper bound of the value of elements is the sample.
#' @param C - is >= to the max value of the  joint pdf.
#'
#' @return This returns a vector list of 2 by n sample that have been excepted as being valid according to joint pdf
#' of the interval (a, b).
#'
#' @importFrom stats dnorm
#' @importFrom stats runif
#'
#' @examples
#' jointpdf_a <- function(x,y){
#' if(0 <= x && x <= 1 && 0 <= y && y <= 1 && 0 <= (x+y) && (x+y) <= 1){
#'  24*x*y
#' }else{
#'   0
#' }}
#' s_func2D(100, jointpdf = jointpdf_a, 0, 1, 1)
#' @export
s_func2D <- function(n, jointpdf, a, b, C){
  sim_data2 <- data.frame(x = numeric(0),  y = numeric(0))
  while( !(n == nrow(sim_data2))){
    except <- FALSE
    while(!except){
      u <- runif(1, a, b)
      v <- runif(1, a, b)
      joint_dens <- jointpdf(u,v)
      w <- runif( 1, 0, C)
      if ( w > joint_dens) {
        except <- TRUE
      }
    }
    sim_data2 <- rbind(sim_data2, data.frame(u, v))
  }
  return(sim_data2)
}


