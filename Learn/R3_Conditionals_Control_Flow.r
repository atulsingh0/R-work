
# Relational Operator
a <- 5
b <- 4
v1 <- "Atul"
v2 <- "Singh"

a == b  # FALSE
b != a  # TRUE 
a >= b  # TRUE

v1 < v2 # TRUE as alphabatically A < S

TRUE < FALSE   # as TRUE is 1 and FALSE is 0


# compare vector
fruit1 <- c("Banana", "Apple")
fruit2 <- c("Apple", "Banana")

fruit1 > fruit2    # TRUE n FALSE as B>A

blog_views <- c(2,3,6,1,4)
profile_views <- c(2,1,3,5,3)

blog_views > profile_views


# compare matrices
views <- matrix(c(blog_views, profile_views), nrow=2, byrow =TRUE)
views
views >= 4
views == 3


# Logical Operator  & (AND), | (OR), ! (Not)
a > 3 & a < 6  # TRUE
a > 6 | b < 5  # TRUE
a != 5 # FALSE
!(TRUE) == FALSE # TRUE 
