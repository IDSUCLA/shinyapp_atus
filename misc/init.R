num_cols <- which(unlist(lapply(atus, is.numeric)) == T)[-1:-4]
activity<- colnames(atus[num_cols])
category<- colnames(atus[-num_cols])