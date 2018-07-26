library(grid)
randomKandinsky <- function(n = 10) {
  grid.newpage()
  
  grid.rect(gp=gpar(fill=rgb(runif(1),
                             runif(1),
                             runif(1),
                             runif(1))))
  
  for (i in 1:n) {
    grid.rect(x = runif(1), y = runif(1), width = runif(1), height = runif(1),
              gp = gpar(col = NA,
                        fill=rgb(runif(1),
                                 runif(1),
                                 runif(1),
                                 runif(1))))
    grid.circle(x = runif(1), y = runif(1), r = runif(1),
                gp = gpar(
                  lwd = runif(1, 0, 100),
                  col = rgb(runif(1),
                            runif(1),
                            runif(1),
                            runif(1)),
                  fill=rgb(runif(1),
                           runif(1),
                           runif(1),
                           runif(1))))
    grid.polygon(x = runif(3), y = runif(3),
                 gp = gpar(col = NA,
                           fill=rgb(runif(1),
                                    runif(1),
                                    runif(1),
                                    runif(1))))
    
    grid.curve(runif(1), runif(1), runif(1), runif(1),
               curvature = runif(1, -1, 1), square = FALSE, ncp = sample(100, 1),
               gp = gpar(lwd = runif(1, 0, 10),
                         col = rgb(runif(1),
                                   runif(1),
                                   runif(1),
                                   1)))
    
    vp1 <- viewport(x = runif(1), y = runif(1), width = runif(1), height = runif(1), angle = runif(1) * 360)
    grid.rect(x = runif(1), y = runif(1), width = runif(1), height = runif(1),
              vp = vp1,
              gp = gpar(col = NA,
                        fill=rgb(runif(1),
                                 runif(1),
                                 runif(1),
                                 runif(1))))
    
    vp2 <- viewport(x = runif(1), y = runif(1), width = runif(1), height = runif(1), angle = runif(1) * 360)
    gCurve(sin(x)/(x), sample(5, 1), sample(10:50, 1), vp = vp2,
           gp = gpar(lwd = runif(1, 0, 10),
                     col = rgb(runif(1),
                               runif(1),
                               runif(1),
                               1)))
  }
  vp3 <- viewport(x = runif(1), y = runif(1), width = runif(1), height = runif(1), clip = "off")
  gCrissCross(vp = vp3,
              gp = gpar(lwd = runif(1, 0, 10),
                        col = rgb(runif(1),
                                  runif(1),
                                  runif(1),
                                  1)))
  
}

randomKandinsky()
