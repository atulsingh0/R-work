
# load library
library(dplyr)
library(tidyr)
library(lubridate)
library(stringr)

hiv <- read.csv("C:/Git/R-work/Learn/HIV.csv", header=TRUE)


# Viewing the RAW data
head(hiv)  # top 6 rows
tail(hiv)  # bottom 6 rows
print(hiv) #print whole data set , not recommended

class(hiv)  # data type of hiv dataset
dim(hiv)    # dimention of dataset [rows columns]
names(hiv)  # header names
str(hiv)    # data strucre of hiv datasets
summary(hiv) # data summay

glimpse(hiv)  

# for getting better understanding of data, plot them
hist(hiv$X1996) #plotting histogram

#plot(hiv$x1992, hiv$X1993) #plotting scatter plot, data length must be equal

#changing single column name
colnames(hiv)[1] <- "country"

head(hiv[1], 3)

# transposing the data from columns to row
# gather(dataFrame, key, value, ......)
# gather(df, key, value, col-range-to-include)
# gather(df, key, value, col-range-to-exclude)
hiv_trans <- gather(hiv, year, values, -country)
head(hiv_trans, 10)
dim(hiv_trans)

hiv_trans <- gather(hiv, year, values, X1979:X2011, na.rm=TRUE)
head(hiv_trans, 10)
dim(hiv_trans)

hiv_trans <- gather(hiv, year, values, X1979:X2011)
head(hiv_trans, 10)
dim(hiv_trans)


#transposing the data from row to column
# spread(df, key, value)
hiv_revTrans <- spread(hiv_trans, year, values )
head(hiv_revTrans, 10)
dim(hiv_revTrans)


hiv2 <- hiv[,1:4]
head(hiv2, 4)

# unite function (tidyr pkg)
hiv2_unite <- unite(hiv2, year, X1979, X1980, X1981)
hiv2_unite #default seperator is underscore (_)
hiv2_unite <- unite(hiv2, year, X1979, X1980, X1981, sep=',')
hiv2_unite

# separate function (tidyr pkg)
hiv2_sep <- separate(hiv2_unite, year, c("Y1979", "Y1980", "Y1981"), sep=",")
head(hiv2_sep)


# messy data
# column headers are values, not variable name  (gather func)
# variables are stored in both rows and columns
# multiple variable stored in single column (separate func)
# Other - 
# i. A single observational unit is stored in multiple tables
# ii. Multiple types of observational units are stored in single table


## type conversion
# class function will give you the data type
class(5)  # numeric
class(5.6) # numeric
class(5L)  # integer
class("a") #character
class(factor("a", "v")) # factor
class(TRUE) # logical
class("FALSE") # character

# as.character
# as.factor
# as.numeric


# parsing date with lubridate pkg
# y,m,d,h,m,s - year, month, date, hour, min, secs
ymd("2016-12-19")
ymd("2016 Dec 19")
dmy('17 sep 2016')
mdy_hm("July 15, 2012 12:56")
ymd_hms("2012/12/19 12:56:09")


## String manipulations
str_trim("    This is me     ")
str_trim("    This        is me     ")
str_pad("12345", width=8, pad="0", side="left")
month <- c("Jan", "Feb", "Mar", "Apr")
str_detect(month, "Apr")  #FALSE FALSE FALSE  TRUE
str_detect(month, "Jul")
str_replace(month, "Apr", "Dec")
tolower(month)
toupper(month)


## missing values
# creating a data frame
df <- data.frame(v1=c(1,NA,2), v2=c(3,5, NA), v3=c(6,7,8))
df

# check of NA
is.na(df)
any(is.na(df))
all(is.na(df))
sum(is.na(df))
summary(df)

#display the data w/o NA
complete.cases(df)
df[complete.cases(df),]
na.omit(df)

# exploring ds with table
# table func create factor of data and display the result
table(df$v1)
table(df$v1, useNA="always")
table(df$v3, useNA="always")

# replace missing values with NA
df$v2[df$v2==""]=NA
df$v2


# Ouliers
# best tool to identify the outliers 
# summary, hist, boxplot
df <- data.frame(v1=c(1,23,2), v2=c(3,5, 8), v3=c(6,7,47))
df
boxplot(df)
boxplot(df, horizontal = TRUE)
hist(df$v1)
hist(df$v1, breaks = 10)
hist(df$v1, breaks = 10, right=FALSE)

df
# did not display the column 1
df[,-1]
