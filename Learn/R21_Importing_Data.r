
# Library
library(readxl)
library(gdata)
library(XLConnect)


# reading data from csv
hiv <- read.csv("HIV.csv")
str(hiv)

#by default string are imported as Factor as utils pkg have it set
# as stringsAsFactor=TRUE
hiv <- read.csv("HIV.csv", stringsAsFactors = FALSE)
str(hiv)

hiv <- read.delim("HIV.csv", header=TRUE)
str(hiv)

path <- file.path("../Learn", "HIV.csv")
path
hiv <- read.table(path, sep=",")
str(hiv)

# explore
# read_tsv()
# read_tsv("potatoes.txt", colnames<-c("A","B")
# read_delim()
# read_delim(file="potatoes.txt", delim="\t", col_names=properties)


# skip - specifies the number of lines you're ignoring in the flat file before actually 
# starting to import data
# n_max - specifies the number of lines you're actually import.
# read_tsv("potatoes.txt", skip = 6, n_max = 5, col_names = properties)

# read_tsv("potatoes.txt", col_types = "cccccccc", col_names = properties)
# c - character, i - integer, d - double

# fread func (data.table)


## Reading Excel
sheets <- excel_sheets("Learn/titanic.xls")
print(sheets)
titanic2 <- read_excel("Learn/titanic.xls", sheet = 2)
str(titanic2)

# explorer lapply() 
pop_list <- lapply(excel_sheets("Learn/titanic.xls"), read_excel, path = "Learn/titanic.xls")
str(pop_list)

# by default read_excel will treat first line as a header
# if we dont have the header in excel file we can read it as below
titanic1 <- read_excel("Learn/titanic.xls", sheet = 1, col_names=FALSE)
str(titanic1)

#assigning col names
col_name <- c("pclass","survived","name","sex","age","sibsp","parch","ticket","fare","cabin","embarked","boat","body","home.dest")
titanic1 <- read_excel("Learn/titanic.xls", sheet = 1, col_names=col_name)
str(titanic1)

# use skip to skip no of lines to read
# skip is only work when first line is not column names
# which we tell R the same
# skipping the first 10 lines, including col names, means priting 10th data line
titanic2 <- read_excel("Learn/titanic.xls", sheet = 2, col_names=FALSE, skip=10)
head(titanic2, 1)

titanic2 <- read_excel("Learn/titanic.xls", sheet = 2, skip=10)
head(titanic2, 1)

# explorer gdata pkg
getwd()
titan <- read.xls(file="Learn/titanic.xls", sheet = "titanic1")
head(titan, 5)

# read.xls actually use the perl script to translate the excel file to csv
# so we can use any oprtion which we use with read.csv
titan <- read.xls(file="Learn/titanic.xls", sheet = 1, header=FALSE, stringsAsFactors=FALSE)
head(titan, 5)

# # can use cbind to combine multiple sheet
# path <- "urbanpop.xls"
# urban_sheet1 <- read.xls(path, sheet = 1, stringsAsFactors = FALSE)
# urban_sheet2 <- read.xls(path, sheet = 2, stringsAsFactors = FALSE)
# urban_sheet3 <- read.xls(path, sheet = 3, stringsAsFactors = FALSE)
# # Extend the cbind() call to include urban_sheet3: urban
# urban <- cbind(urban_sheet1, urban_sheet2[-1], urban_sheet3[-1])
# # Remove all rows with NAs from urban: urban_clean
# urban_clean<-na.omit(urban)
# # Print out a summary of urban_clean
# summary(urban_clean)


# explorer XLConnect
titanic <- loadWorkbook("titanic.xls")
class(titanic)

# get sheet details
getSheets(titanic)
head(readWorksheet(titanic, 1))  # reading first sheet

# read particular columns
titanic <- loadWorkbook("titanic.xls")
titanic2 <- readWorksheet(titanic, sheet=2, startCol=2, endCol=3)
head(titanic2, 1)

#add new sheets in data
createSheet(titanic, "newSheet")
getSheets(titanic)

# writing some data into sheet
# saving
# renaming
# deleting
