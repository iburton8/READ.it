pkgname <- "classRproj"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "classRproj-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('classRproj')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("s_func")
### * s_func

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: s_func
### Title: Create sampling function This is a function to create a sample
###   of the length n for a given pdf
### Aliases: s_func

### ** Examples

exppdf <- function(x){
exp(x)/(1+exp(x))^2}
s_func(n = 1000, pdf = exppdf, a = -4, b = 4, C= 1)

normpdf <- function(x){
dnorm(x)}
s_func(n = 1000, pdf = normpdf, a = -4, b = 4, C= 1)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("s_func", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("s_func2D")
### * s_func2D

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: s_func2D
### Title: Creating a 2 Dimentional Sampling Function This is a function to
###   create a sample of the length n for a given joint pdf
### Aliases: s_func2D

### ** Examples

jointpdf_a <- function(x,y){
if(0 <= x && x <= 1 && 0 <= y && y <= 1 && 0 <= (x+y) && (x+y) <= 1){
 24*x*y
}else{
  0
}}
s_func2D(100, jointpdf = jointpdf_a, 0, 1, 1)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("s_func2D", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
