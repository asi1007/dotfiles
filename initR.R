options(CRAN="http://cran.md.tsukuba.ac.jp/")
options(repos="http://cran.md.tsukuba.ac.jp/")

# fasten

# optimization
install.packages("quadprog")

# data arrangement
install.packages("tidyr")
install.packages("dplyr")
install.packages("plyr")
install.packages("reshape2")
install.packages("data.table")

# IO
install.packages("RODBC")
install.packages("readr")
install.packages("Rmysql")
install.packages("Rpostgres")

# extend basic functionality
install.packages("magrittr")
install.packages("useful")
install.packages("lubridate")
install.packages("pryr")

# visualize
install.packages("ggplot2")
install.packages("coefplot")
install.packages("VIM")

# dev
install.packages("devtools")
install.packages("packrat")

# interface for other language
install.packages("rcpp")

# distributed 
install.packages("snow")
install.packages("foreach")

# analyze
install.packages("arules")
install.packages("survival")
install.packages("rpart")
install.packages("randomForest")
install.packages("e1071")
install.packages("kernlab2")
install.packages("sgd")
install.packages("elasticnet")
install.packages("lars")
install.packages("liblinearR")
install.packages("caret", dependencies = c("Depends", "Suggests"))
install.packages("Metrics")

