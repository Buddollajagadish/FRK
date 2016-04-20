context("BAUs")

test_that("basic_wrapper",{
    library(sp)
    Z <- data.frame(x = runif(1000), y= runif(1000))
    Z$z <- sin(8*Z$x) + cos(8*Z$y) + 0.5*rnorm(100)
    coordinates(Z) = ~x+y
    Pred <- FRK(f = z~1,
                list(Z),
                cellsize = c(0.02,0.02),
                n_EM = 100)
    spplot(Z,"z")
    spplot(Pred$PredPolys,"mu")
})