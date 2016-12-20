
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