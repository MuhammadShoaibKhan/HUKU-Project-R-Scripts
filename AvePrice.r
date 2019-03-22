customer <-read.csv(file="C:/Users/sadaf/Desktop/CustomerOneMonth.csv",head=TRUE,sep=",")
dataframe <- data.frame(customer$run , customer$id, customer$money, customer$price, customer$money /120)
dataframe
for (i in unique(dataframe$customer.run)){
  price.subset <- subset(dataframe, dataframe$customer.money.120 >0 & dataframe$customer.run == i)
  
  price.subset <- sort(price.suset)
  result <- tapply(price.subset$customer.price, price.subset$customer.id, mean)
  result.T <- as.data.frame(t(result))
  result.T
  if( i == 1) {
    final <- result.T
  }
  else  {
    final <- rbind(final ,result.T)
  }
  A = "C:/Users/sadaf/Desktop/avgPriceRun"
  B = ".csv"
  F = paste (A,i,B, collapse="")
  write.table(result,file=F,sep=",",row.names=T)
}
  write.table(final,file="C:/Users/sadaf/Desktop/avgPricefinal.csv" ,sep=",",row.names=T)

