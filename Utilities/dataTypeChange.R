
idata <- read.csv("C:/learn/RProg/utilities/Data.csv", header = TRUE)
head(idata, 1)

idata_num <- idata[sapply(idata, is.numeric)]
ncol(idata_num )

# variable for data level 
lv = 5
mx = 100

uValues <- sapply(idata_num, function(x) length(table(x)))
uValues

# filtering the data based on level
val<- c(uValues[uValues<lv])
valNames <- names(val)
ftrData <- idata_num[valNames]

#length(valNames)
print("As per analysis these are the columns which you should convert to another data type")
for(i in 1:length(valNames)){
 cat(i, " ",valNames[i], "\n")
}

ans = "Y"
d <- readline("Do you want to change any columns data type Y/N? : ")
if(d=="Y"){
  while(ans=="Y"){
    index <- as.numeric(readline("Enter the index of column you want to change: "))
    ftrData[index] <- as.character(ftrData[index])
    ans <- readline("Do you want to continue Y/N: ")
    }
}

typeof(ftrData[[78]])
