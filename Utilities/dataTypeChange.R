# reading the data
data <- read.csv("song_data.csv", header = TRUE)
head(data,4) # fetching first 4 rows only
str(data) # know more about data
names(data) # get names of columns
dim(data) # checking dimensions, rows & columns
nrow(data)
ncol(data)
