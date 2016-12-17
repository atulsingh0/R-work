
################################################################
##  R0 : Basics Vector
##  Atul Singh
##  www.datagenx.net
################################################################


# R as a calculator
2+3  # 5
2*3  # 6
2-4  # -2
4/3  # 1.33333
4 %% 3  # 1 modulp sign %%
2^4   # power

var <- 5
var   # 5

var2 <- var^2  # square the var
var2  # 25

# check if airthmatic work on string varible
one <- "Atul"
two <- "Singh"
res <- one + two # Error in one + two : non-numeric argument to binary operator

# can store binary data as value
Male <- FALSE
Male

# Get Data Type
class(Male)   #logical
class(one)    #character
class(var2)   # numeric


######################
# Vector : Basics
######################


# Create a vector (other lang : List or Araay)
v1 <- c()  #blanc vector
vn <- c(1,2,3,4)  #numeric vec
vc  <- c('a','b','c')
vb <- c(TRUE, FALSE, FALSE)

# assigning Name to vector
marks <- c(20, 24,26,30)
names(marks) <- c("Math", "Eng", "SS", "Sci")

marks2 <- c(22, 24,29, 21)
names(marks2) <- names(marks)  # can assign the name this way
names(marks2)

# airthmatic with vectors
tot_marks <- marks + marks2
tot_marks

# total_marks
sum(tot_marks)
sum(marks) > sum(marks2)  # TRUE

# Vector selection
# vector indexing is start from 1, not 0 (as in Python)
marks  # 20, 24, 26, 30
marks[2]  # 24
marks[2:4] #24, 26, 30
sel <- c(1,2)
marks[sel]    #20, 24

# selection from vector based in index name
marks["Math"]  #20
marks[c("Math", "Eng")]  #20, 24
# marks["Math":"Sci"]  #this is not allowed

# some more way to selection
# selection by comparison

# Marks less than 24, boolean result
marks<25  # TRUE  TRUE FALSE FALSE
marks[marks<25]  # 20, 24



############################################################
## Atul Singh  | www.datagenx.net | lnkd.in/fP_uwKT
############################################################