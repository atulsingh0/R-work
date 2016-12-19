################################################################
##  R2 : Basics of DataFrame & Lists
##  Atul Singh
##  www.datagenx.net
################################################################

# DataFrame is same as Matrix but can store diff type of data
# R is having a inbuilt dataFrame called mtcars

mtcars
head(mtcars, 4)  # top 4 rows
tail(mtcars, 5)  # last 5 rows
str(mtcars)   #structure
summary(mtcars)


# creating data frames
names <- c('Atul', 'Priya', 'Rahul', 'Aryan', 'Minal')
Age <- c(26, 24, 25, 21, 22)
Marks <- c(72, 85, 71, 78, 86)
Spec <- c('CS', 'IT', 'EC', 'DA', 'ME')
Rno <- c('98/06', '102/08', '72/09', '87/15', '84/14')

student <- data.frame(names, Age, Marks, Spec, Rno)
str(student)


# data selection is same as Matrix and vector
student[1,]  #student Atul's data
student[,1]  #student names
student[2, 4]
student[1:3, 2:3]
student[,]
student[,"names"]
student[4,"names"]
student[4,c("names","Marks")]


# can select data with $
student$names
student$Marks[3]


# subset of df
subset(student, subset=Marks>80) # creating a subset where marks > 80
subset(student, subset=Spec=='ME')


#sort the data with order
order(student['Marks'])
student[order(student['Marks']),]  #data has been sort by Marks
student[order(student$Marks),]  #data has been sort by Marks


####################################
## List
####################################

# List is same as vector except it can store any data type, including matrix, 
# data frame or another list

# creating list
v1 <- c(1:6)
m1 <- matrix(1:6, nrow=3)
df <- data.frame(v1, v1*2.5, v1^2)
li <- list(v1, m1, df)
li

#named list
li <- list(vec=v1, mat=m1, dataframe=df); li
names(li) <- c("vector", "matrix", "DataFrame")
li


#selecting element
li[1]      # do not use [] with list
li[[1]]
li[["vector"]]
li$vector

#adding more element in list
ext <- c(2:10); ext
str(li)
li <- c(li, v2=ext)
str(li)



############################################################
## Atul Singh  | www.datagenx.net | lnked.in/atulsingh
############################################################