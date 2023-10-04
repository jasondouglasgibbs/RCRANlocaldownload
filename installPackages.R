##install packages
##Inputs
RVersion<-"3.6.3"


##Libraries.##
library(tools)


packagestoinstall<-list.files(path=file.path(getwd(),"packagedownload",RVersion), full.names = TRUE)
install.packages(packagestoinstall, repos=NULL, dependencies = TRUE, type="win.binary")
