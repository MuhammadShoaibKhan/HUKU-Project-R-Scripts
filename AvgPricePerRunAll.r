customer <-read.csv(file="CustomerOneMonth.csv",head=TRUE,sep=",")
dataframe <- data.frame(customer$run , customer$id, customer$money, customer$price, customer$money /120)
dataframe
  price.subset <- subset(dataframe, dataframe$customer.money.120 >0 & dataframe$customer.run == 1)
  result <- tapply(price.subset$customer.price, price.subset$customer.id, mean)
  IM = paste ("avgPriceRun",".png" ,collapse="")
  png(file = IM, bg = "white")
  h = hist(price.subset$customer.price)
  dev.off()
  F = paste ("avgPriceRun",".csv" ,collapse="")
  write.table(price.subset$customer.price,file=F,sep=",",row.names=T)
                                                                           
