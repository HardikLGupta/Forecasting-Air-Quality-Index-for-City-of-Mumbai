d <- rep(x = seq(1:52), times = 3)
D <- seq(1:52)

m <- sapply(FUN = grepl, x = d, X = D, fixed=F)
m[] <- as.integer(m)
m

write.csv(file = "F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/models/PM10.weekDummy.csv", x = m, row.names = F)

d <- rep(x = seq(1:52), times = 3)
df <- data.frame(d)

df$d <- as.factor(df$d)

m <- cbind(df, model.matrix( ~ 0 + d, df))
write.csv(file = "F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/models/PM10.weekDummy.csv", x = m, row.names = F)
