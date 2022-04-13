#vectors
#numeric vector
a <- c(1,2,5.3,6,-2,4)
#character vector
b <- c("one","two","three")
#logical vector
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)

#matrices
#matrix with 1 to 20 having 5 rows and 4 columns
y <- matrix(1:20,nrow = 5, ncol = 4)
#row names
rn <- c("r1","r2","r3")
#column names
cn <- c("c1","c2","c3","c4")
#matrix with above row and columns names
M1 <- matrix(1:12,nrow = 3, ncol = 4, byrow = TRUE,dimnames = list(rn,cn))
#to change column and row names of above matrix
colnames(M1) <- c("mc1","mc2","mc3","mc4")
#to use just indexes as names
dim(M1) <- c(4,3)
M1  

#Data frames
v1 <- c(10,11,13,35)
v2 <- c("bread","butter","jam",NA)
v3 <- c(TRUE,TRUE,TRUE,FALSE)
#creating a data frame from above vectors
Datafile <- data.frame(v1,v2,v3)
#add names to the data frame
names(Datafile) <- c("ID","Item","Quantity")

#list 
w <- list(name = "Perera", mynumber = 5,mymatrix = M1, myage = 30, myvector = y)
#values of the list can be accessed as
w$name
w$mymatrix
w[[1]]
w[['mynymber']]

#factorial
T <- factor(c(1,2,3,4))

#calculations
2+2
2*5
sqrt(4)
exp(-2)
pi
(5+(6+7)*(pi^2))/8
log(exp(1))
log(10000,10)
sin(pi/3)^2 + cos(pi/3)^2

#vectors
y <- c(2,4,3,6,5,1,7,8,9,10)
a = y+y
b = y * (1/2) * y
a+b
d = 1/c
y
a
b
c
d
#extract the second element
y[2]
#extract the elements from 5 to 8
y[5:8]
#character vector
x <- c("Monday","Tuesday","Wednesday")

#sequences
#print from 0 to 10
0:10
#print from 15 to 5
15:5
#print from 0.1 to 1.5 increment 0.1
seq(0,1.5,0.1)
#print from 6 to 4 decrements 0.2
seq(6,4,-0.2)

N <- c(12,13,17,30,9,24,28)
seq(from = 0.04, by = 0.01, length = 7)
seq(from = 0.04, by = 0.01, length = length(N))

#sequences of unusual lengths
#print 1 to n, n is the numbers in the vector
sequence(c(4,3,4,4,4,5))
#print 9 5 times
rep(9,5)
#print 1 to 4 2 times
rep(1:4,2)
#print 1 to 4 print each number twice
rep(1:4,each = 2)
#print 1 to 4 print each number twice three times
rep(1:4,each = 2, times = 3)
#print 1 2 2 3 3 3 4 4 4 4
rep(1:4,1:4)
#print 1 to 4 each numbers n times and n is given in the vector
rep(1:4,c(4,1,4,2))

#generating factor levels
# gl(upto, with repeats of, to total length)
gl(4,3)
gl(4,3,24)
temp <- gl(2,2,24, labels=c(" Low" ," High" ))
temp
soft <- gl(3,8,24, labels = c(" Hard", "Medium"," Soft"))
soft
M.user <- gl(2,4,24, labels=c(" N" ," Y" ))
M.user
Brand <- gl(2,1,24, labels=c(" X" ," M"))
Brand
Data <- data.frame( temp, soft, M.user, Brand)
Data

X <- factor(c(" yes" ," yes", "no", "yes", "no" ))
X
table(X)

#coericon
m <- c(T,F,T,F,F,T)
m
is.logical(m) #false
is.factor(m) #false
n <- as.factor(m)
n
is.factor(n) #true

#sub setting
#sub setting from a vector
Z <- c(1:20)
#first index
Z[1]
#first index
Z[2]
#this will display true for values greater than 10
Z > 10
#this will display print values greater than 10
Z[Z>10]

#sub setting from a matrix
Z <- matrix(c(1:20), nrow = 4)
#first row second column
Z[1,2]
#second column
Z[,2]
#second row
Z[2,]
#1 to 2 rows and 3 to 4 columns
Z[1:2,3:4]
#this will display true for values greater than 10
Z > 10
#this will display print values greater than 10
Z[Z>10]
#this will display print values greater than 10 in third column
Z[Z[,3]>10,3]
