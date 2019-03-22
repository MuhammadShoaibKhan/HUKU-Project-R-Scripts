customer <-read.csv(file="CustomerOneMonth.csv",head=TRUE,sep=",")
dataframe <- data.frame(customer$run , customer$id, customer$money, customer$price, customer$money /120)
dataframe
for (i in unique(dataframe$customer.run)){
  price.subset <- subset(dataframe, dataframe$customer.money.120 >0 & dataframe$customer.run == i)
  result <- tapply(price.subset$customer.price, price.subset$customer.id, mean)
  resultAll <- mean(price.subset$customer.price)
  
  IM = paste ("avgPriceRun",i,".png" ,collapse="")
  png(file = IM, bg = "white")
  h = hist(resultAll)
  dev.off()
  F = paste ("avgPriceRun",i,".csv" ,collapse="")
  write.table(resultAll,file=F,sep=",",row.names=T)
}

