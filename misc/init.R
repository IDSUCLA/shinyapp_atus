load("data/atus.rda")
num_cols<- c(3, 5,6,7, 18, seq(20, 42, 1))
activity<- colnames(atus[,num_cols])
category<- colnames(atus[,-num_cols])


