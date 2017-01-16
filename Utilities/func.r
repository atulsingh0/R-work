
getIndex = function()
{
library(RCurl)
library(XML)

fromDate <- format(Sys.time()-5, "%d-%b-%Y")
toDate  <- format(Sys.time(), "%d-%b-%Y")


baseUrl = 'https://www.nse-india.com/products/dynaContent/equities/indices/hist_vix_data.jsp?'
url = paste(baseUrl,"&fromDate=",fromDate,"&toDate=",toDate, sep = "")
url
doc <- getURL(url, httpheader = c("User-Agent"="Mozilla/5.0 (Windows NT 6.1; WOW64)"))
data <- data.frame(readHTMLTable(doc, skip.rows=2,  header=TRUE))
colnames(data) <- c("Date","Open","High","Low","Close","Prev. Close","Change %", "Change")
rownames(data) <- data$Date
#data
#return Index
data[toDate, "Close"]
}