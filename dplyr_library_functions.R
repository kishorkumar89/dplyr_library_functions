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

#---------------------------------ARRANGE-----------------------------------
#sort the Emp table by Name in Ascending Order
data.DF %>%
  arrange(Name)

#sort the Emp table by Name in descending Order
data.DF %>%
  arrange(desc(Name))

#sort the Emp table by Name in Ascending Order removing NAs
data.DF %>%
  filter(!is.na(Name)) %>%
  arrange(Name)

#sort the Emp table by Name in Descending Order removing NAs

data.DF %>%
  filter(!is.na(Name)) %>%
  arrange(desc(Name))

##sort the Emp table by Salary in Ascending Order 
data.DF %>%
  arrange(Salary)

#sort the Emp table by Salary in Descending Order 
data.DF %>%
  arrange(desc(Salary))

#sort the Emp table by Salary in Ascending Order  and remove the NAs in Salary
data.DF %>%
  filter(!is.na(Salary)) %>%
  arrange(Salary)

#sort the Emp table by Salary in Descending Order and remove the NAs in Salary
data.DF %>%
  filter(!is.na(Salary)) %>%
  arrange(desc(Salary))

#sort the Emp table by Salary in Descending Order and remove the NAs for all columns
data.DF %>%
  filter(!is.na(Name),!is.na(S.No),!is.na(Salary)) %>%
  arrange(desc(Salary))

#Add a column with name Salary_in_100s
data.DF %>%
  mutate(Salary_in_100s = (Salary/100) )

#Add a column with name Salary_in_100s and remove those columns where where salary is NA
data.DF %>%
  na.omit() %>%
  mutate(Salary_in_100s = Salary/100 )

#add A column Dept in the Table
data.DF$Dept_Name <- c('A','A','A','B','B','B','C','C','C','D','D','D')

data.DF$Dept_Name <- as.factor(data.DF$Dept_Name)

#Average salary by Department
data.DF %>%
  filter(!is.na(Salary)) %>%
  group_by(Dept_Name) %>%
  summarise(Avg_by_Dept = sum(Salary)/n())

#select the entire department which has the Height average salary
data.DF %>%
  filter(!is.na(Salary)) %>%
  group_by(Dept_Name) %>%
  summarise(Avg_by_Dept = sum(Salary)/n()) %>%
  filter(Avg_by_Dept == max(Avg_by_Dept))


#---Check  ---- summarise_each()
#summarise has two vectors 
# n() - counts  the number of vectors in a group
# n_unique() - conunts the number of unique vectors in a group


# count the numbet of Depatment  and the number of Employees in a group
data.DF %>%
  group_by(Dept_Name) %>%
  summarise(No_Emps = n())

# count the numbet of Depatment  and the number of Employees in a group 
#soting groups by Descending order
data.DF %>%
  group_by(Dept_Name) %>%
  summarise(No_Emps = n()) %>%
  arrange(desc(Dept_Name))


