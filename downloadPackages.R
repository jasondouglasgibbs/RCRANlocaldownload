##Script that downloads packages. Useful for downloading packages##
##that will work with older versions of R or if you don't have connectivity.##

##Inputs
RVersion<-"3.6.3"


##Libraries.##
library(tools)
dir.create(file.path(getwd(), "packagedownload"), showWarnings = FALSE)
dir.create(file.path(getwd(), "packagedownload",RVersion), showWarnings = FALSE)

##Function that reaches out to the CRAN and creates a list of packages and their##
##dependencies.##
##Found on StackOverflow @ https://stackoverflow.com/questions/6281322/only-download-sources-of-a-package-and-all-dependencies##

getPackages <- function(packs){
  packages <- unlist(
    tools::package_dependencies(packs, available.packages(type="win.binary", method="libcurl"),
                                which=c("Depends", "Imports"), recursive=TRUE)
  )
  packages <- union(packs, packages)
  packages
}

##This is where you list the packages you need. The getPackages() function##
##will automatically list out the dependencies.##
packages <- getPackages(c("tidyverse", "rmarkdown", "flexdashboard", "shiny", "shinydashboard", "bookdown",
                          "foreach", "doParallel", "janitor", "conflicted","iterators", "openxlsx","plotly",
                          "scales", "writexl", "readxl", "RJOSNIO", "leaflet","knitr",
                          "likert"))


download.packages(packages, destdir = file.path(getwd(),"packagedownload",RVersion), type = "win.binary", method = "libcurl")

