kandinsky <- function(df = NULL, rv = runif(1000)) {

  library(grid)
  library(purrr)

  
  if (!is.null(df)) {
    rv <- normalizeAndVectorize(df)
  }
  
  grid.newpage()
  
  i <<- 0
  
  grid.rect(gp = gpar(fill = rgb(nex(rv), nex(rv), nex(rv), nex(rv))))
  
  nRectangles <- floor(nex(rv) * 10) + 3
  nCircles <- floor(nex(rv) * 10) + 3
  nTriangles <- floor(nex(rv) * 10) + 3
  nArchs <- floor(nex(rv) * 10) + 3
  nTiltedRectangles <- floor(nex(rv) * 10) + 3
  nWaves <- floor(nex(rv) * 10) + 3
  nCrissCross <- floor(nex(rv) * 3) + 1
  
  walk(1:nRectangles, drawRectangle, rv)
  walk(1:nCircles, drawCircle, rv)
  walk(1:nTriangles, drawTriangle, rv)
  walk(1:nArchs, drawArch, rv)
  walk(1:nTiltedRectangles, drawTiltedRectangle, rv)
  walk(1:nWaves, drawWave, rv)
  walk(1:nCrissCross, drawCrissCross, rv)
}
kandinsky()
