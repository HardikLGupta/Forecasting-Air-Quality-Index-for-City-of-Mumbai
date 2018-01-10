#----------------------------------------------------
# INITIALISATIONS
#----------------------------------------------------
#library(mice)

#-----------------------------------------------
# GENERATING DATE FROM 1ST JAN 2012 TO 1ST JAN 2017
#-----------------------------------------------
date.seq <- as.Date("01-01-2012", "%d-%m-%Y"):as.Date("01-01-2017", "%d-%m-%Y")
date <- data.frame(AllDate = as.Date(date.seq, origin = "1970-01-01"))

#-------------------------------------------------
# READ DATASET - PM2.5
#-------------------------------------------------
#PM2.5 <- read.csv("F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/code/data/PM2.5.csv")
source("F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/code/readPM2.5.R")

#Convert the Date column from factor --> Date type
PM2.5$Date <- as.Date(PM2.5$Date, format = "%d/%m/%Y")

#------------------------------------------------
# MERGE THE TWO DATASETS - THIS IS DONE BECAUSE THE ORIGINAL DATA HAS FEW MISSING VALUES
#------------------------------------------------
PM2.5 <- merge(x = PM2.5, y = date, by.x = "Date", by.y = "AllDate", all.y = T)
summary(PM2.5)
str(PM2.5)

write.csv(x=PM2.5,
          file = "F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/code/data/PM2.5Corrected.csv",
          row.names = F)

rm(date)
rm(PM2.5)

PM2.5 <- read.csv("F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/code/data/PM2.5Corrected.csv")
#PM2.5$Date <- as.Date(PM2.5$Date, format = "%d-%m-%Y")
PM2.5$Date <- as.Date(PM2.5$Date, format = "%d-%m-%Y")

#-------------------------------------------
# REMOVING LAST ROW TO MAKE THE DATASET DIVISIBLE BY 7
#-------------------------------------------
PM2.5 <- PM2.5[1:nrow(PM2.5)-1,]

#-------------------------------------------
# WEEK WISE CALCULATIONS
#-------------------------------------------

date <- NULL
concentration <- NULL

s <- seq(1,nrow(PM2.5),7)

for(i in s){
  #date <- c(date,PM2.5[i,1])
  date <- c(date,PM2.5$Date[i])
  #concentration <- c(concentration,median(PM2.5[i:(i+6),2]))
  concentration <- c(concentration,max(PM2.5[i:(i+6),2]))
}

PM2.5.week <- data.frame(date,concentration)
PM2.5.week$date <- as.Date(PM2.5.week$date, origin = "1970-01-01")

write.csv(x = PM2.5.week,
          file = "F:/BIG DATA/ISB/Assignments/Term 2/Forecasting Analytics/Project/code/data/PM2.5.week.csv",
          row.names = F)

#---------------------------------------
# PLOT WEEK WISE DATA
#--------------------------------------
windows()
ggplot(PM2.5.week,
       aes(x = date,
           y = concentration)) +
  labs(x = "Dates",
       y = "concentration",
       title = paste("PM2.5 Concentration (Weekly Max) - 01/01/2012 to 31/12/2016")) +
  scale_x_date(date_breaks = "3 week", date_labels = "%b %d %Y") +
  geom_line(size = 1, color="green4") +
  theme(
    axis.title = element_text(size=11, face="bold"),
    axis.text = element_text(size=8, face="plain"),
    plot.title=element_text(size=12, face="bold", hjust = 0.5),
    legend.title = element_text(size=10, face="bold"),
    legend.background = element_rect(colour = "black"),
    axis.text.x = element_text(angle = 90, hjust = 1),
    # panel.grid.major = element_line(colour = "black", linetype = "dotted"),
    axis.title.x = element_text(margin = margin(10,0,0,0)),
    axis.title.y = element_text(margin = margin(0,10,0,0))
  )