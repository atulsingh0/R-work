
################################################################
##  R1 : Basics Matrix
##  Atul Singh
##  www.datagenx.net
################################################################


# Matrix is 2 dimensional vector
mat <- matrix(1:12, nrow=3)  # no of row - 3
mat

mat <- matrix(1:12, ncol=3)  # no of column - 3
mat

# by detault data will be distributed column wise
# use below systax to do it byrow
mat <- matrix(1:12, byrow=TRUE, ncol=3)  # no of column - 3
mat

v1 <- c(1,2,3)
v2 <- c(4,5,6)
v3 <- c(7,8,9)
v <- c(v1, v2, v3)

mat <- matrix(v, byrow=TRUE, nrow=3)
mat


# Naming a matrix
rows <- c('A', 'B', 'C')
cols <- c('X', 'Y', 'X')

rownames(mat) <- rows
colnames(mat) <- cols
mat


# another way to construct the matrix
v <- c(0,1,2,3,4,5,6,7,8,9,10,11)
mat <- matrix(v, nrow = 3, byrow =TRUE, dimnames = list(c('P','Q','R'), c('W','X','Y','Z')))
mat
srow <- rowSums(mat)  # row wise sums
srow
crow <- colSums(mat)  # cols wise sums
crow

#binding row sums into mat
mat2 <- cbind(mat, srow)
mat2

#binding col sums into mat
mat2 <- rbind(mat, crow)
mat2


# data selection
# mat[row, col]

mat[,]  # whole matrix
mat[2,4]  #7
mat[,4]   # 4th col
mat[3,]   # 3rd row
mat[3,1:3] # 3rd row, col 1,2 n 3
mat[1:2, 2:4] # 1,2 row, 2,3,4 col
mat[c(1,3), c(1,4)]  # 1, 3 row, 1,4 col

# basic airthmatic with matrix
2*mat
mat/2
mat%%2

mat3<- matrix(c(12,11,10,9,8,7,6,5,4,3,2,1), nrow=3)
mat3
mat/mat3

v <- c(1,2,3)
mat[,3]/v
mat[,1:3]/v

# can calculate mean or sum 
sum(mat[,3]/v)
mean(mat[,3]/v)




############################################################
## Atul Singh  | www.datagenx.net | lnked.in/atulsingh
############################################################