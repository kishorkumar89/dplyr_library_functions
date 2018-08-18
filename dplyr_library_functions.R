#set the working directory
setwd("E:/GIT_Hub/dplyr_library_functions")


#load the data set.
data.DF <- read.csv('train.csv',header = FALSE)

#loding library dplyr
library(dplyr)

colnames(data.DF) <- c('S.No','Name','Salary')
#basic function in dplyr ---select , filter , arrange , mutate , summarise , group_by
#---------------------Select-------------------
#selecting individual columns.
select(data.DF,S.No)   # selecting Serial Number from the data set
select(data.DF,Name)   # selecting Name from the data set
select(data.DF,Salary) #select Salary from the data set.

#selecting two columns at the same time
select(data.DF,S.No,Name)
select(data.DF,S.No, Salary)
select(data.DF, Name, Salary)

#----------------select rows from the data set based on Rows
#============================================================
# select Names of Customers whose salary greater then 10.
select(data.DF,filter(Salary>10))
