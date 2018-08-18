#set the working directory
setwd("E:/GIT_Hub/dplyr_library_functions")


#load the data set.
data.DF <- read.csv('train.csv',header = FALSE) #is a data frame.

#loding library dplyr
library(dplyr)

#converts a data frame into a local data frame.
data.DF <- tbl_df(data.DF)

#naming the columns in the data set.
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

#select all columns where column name contains 'am'
select(data.DF,contains('am'))

#select all columns Where Column name statrs with 'S'
select(data.DF,starts_with('S'))

#select all columns Where Column name ends with 'o'
select(data.DF,ends_with('o'),starts_with('S'))

#----------------select rows from the data set based on Rows--- Applying filter
#============================================================
#select all rows where the Name has NA
filter(data.DF , is.na(Name))

#select all rows where Salary is NA
filter(data.DF , is.na(Salary))

#select all rows where we see atlest one NA in any of the column values.
filter(data.DF,is.na(Name) | is.na(Salary))

#select all rows where we dont see any NA
filter(data.DF, !is.na(Name) & !is.na(Salary))

#select all rows where S.no greater than 5
filter(data.DF,S.No < 5)


#select all rows where salary greater than 50
filter(data.DF,Salary > 50)

#select all rows where name is Shyam
filter(data.DF,Name %in% c("Shyam"))

#select all rows where name is Shyam and Kishor
filter(data.DF,Name %in% c("Shyam","Kishor"))

#select all rows where name is shyam and kishor and sakary greater than 35.
filter(data.DF, Name %in% c("Shyam","Kishor") & Salary > 35)

#select all rows were name is like Shy
filter(data.DF, Name %in% 'Shy')

# chaining

#find all information of the Customer with the heighest Salary.
data.DF %>%
  filter(Salary == max(Salary , na.rm = TRUE))

#find name of the Customer with the heighest Salary.
data.DF %>%
  filter(Salary == max(Salary , na.rm = TRUE)) %>%
  select(Name,row)

# find the second hieghest Salary.
data.DF %>%
  filter(Salary < max(Salary , na.rm = TRUE)) %>%
  filter(Salary == max(Salary , na.rm = TRUE))








