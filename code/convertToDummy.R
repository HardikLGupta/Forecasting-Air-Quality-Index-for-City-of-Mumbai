df <- read.csv("F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/models/PM10-Dummy.csv")
df$date <- as.character(df$date)


for(i in 1:nrow(df)){
  
  if(substr(df$date[i],4,5) == '01'){
    df$D1[i] <- 1
  }else{
    df$D1[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '02'){
    df$D2[i] <- 1
  }else{
    df$D2[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '03'){
    df$D3[i] <- 1
  }else{
    df$D3[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '04'){
    df$D4[i] <- 1
  }else{
    df$D4[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '05'){
    df$D5[i] <- 1
  }else{
    df$D5[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '06'){
    df$D6[i] <- 1
  }else{
    df$D6[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '07'){
    df$D7[i] <- 1
  }else{
    df$D7[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '08'){
    df$D8[i] <- 1
  }else{
    df$D8[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '09'){
    df$D9[i] <- 1
  }else{
    df$D9[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '10'){
    df$D10[i] <- 1
  }else{
    df$D10[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '11'){
    df$D11[i] <- 1
  }else{
    df$D11[i] <- 0
  }
  
  if(substr(df$date[i],4,5) == '12'){
    df$D12[i] <- 1
  }else{
    df$D12[i] <- 0
  }
  
  
  
}

head(df)
write.csv(file = "F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/models/PM10-DummyCorrected.csv", x = df, row.names = F)
