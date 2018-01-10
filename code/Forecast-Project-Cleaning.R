
date.seq <- as.Date("01-01-2012", "%d-%m-%Y"):as.Date("01-01-2017", "%d-%m-%Y")
date <- data.frame(AllDate = as.Date(date.seq, origin = "1970-01-01"))
date$AllDate <- format(date$AllDate, format = "%d/%m/%Y")

PM10 <- read.csv("F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/code/data/PM10.csv", sep = "\t")
str(PM10)
PM10$Date <- as.Date(PM10$Date, format = "%d/%m/%Y")

PM10$Date <- as.POSIXct(PM10$Date, format = "%d/%m/%Y")


M <- merge(x = PM10, y = date, by.x = "Date", by.y = "AllDate", all = T)

M2 <- merge(x = PM10, y = M, by.x = "Concentration.PM10", by.y = "Concentration.PM10", all.x = TRUE)


str(df)
df$Date <- as.Date(df$Date, format = "%d-%m-%Y")
