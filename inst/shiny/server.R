
#max upload 300mb
options(shiny.maxRequestSize = 300*1024^2)
options(future.globals.maxSize = 10 * 1024 ^ 3)
library(future)
plan("multiprocess", workers = 10)

server <- function(input, output, session) {

  source("server-initInputData.R",local = TRUE)

  source("server-qcfilter.R",local = TRUE)

  source("server-vln.R",local = TRUE)

  source("server-normSelect.R",local = TRUE)

  source("server-dispersion.R",local = TRUE)

  source("server-runPca.R",local = TRUE)

  source("server-pcaPlots.R",local = TRUE)

  source("server-jackStraw.R",local = TRUE)

  source("server-clusterCells.R",local = TRUE)

  #source("server-tsne.R",local = TRUE)
  source("server-nonLinReduction.R", local = TRUE)

  source("server-download.R",local = TRUE)

  source("server-findMarkers.R",local = TRUE)

  GotoTab <- function(name){
    #updateTabItems(session, "tabs", name)
    
    shinyjs::show(selector = paste0("a[data-value=\"",name,"\"]"))
    
    shinyjs::runjs("window.scrollTo(0, 0)")
  }
}
