x <-c(1, 2.3, 2, 3, 4, 8, 12, 43, ???4, ???1)
max(x
    )
y <-c(x,NA)
max(y, na.rm = T)
x2 <-c(???100, ???43, 0, 3, 1, ???3)
min(x,x2)
sample(4:10)
sample(c(2,5,3), size=3, replace=FALSE)
sample(c(2,5,3), size=3, replace= TRUE)
sample(2, 10, replace = TRUE)
sample(2, 10, replace = FALSE)
sample(1:2, size=10, prob=c(1,3), replace=TRUE)
round(3.14159, digits = 2)
range(100:400)
matrix(c(1, 2.3, 2, 3, 4, 8, 12, 43, -4, -1, 9, 14), nr=3, nc=4)
matrix(c(1, 2.3, 2, 3, 4, 8, 12, 43, -4, -1, 9, 14), nr=3, nc=4, byrow = T)
x <- matrix(c(4,3,4,6,7,6),3,2) 
rownames(x) <-c("row1","row2","row3")
colnames(x) <-c("col1", "col2")

x <-rbind(c(1:4),c(5,8))
y <-cbind(c(1:4),c(5,8))
y <- 1:9
w <- 2:10
z <- 3:5
rbind(y,w,z)
m <- matrix(1:36,9,4)
m[2,3]
m[,3]
m[2,]
cbind(m[,3])
m[,???3]
m[???(3 : 8),2:4]
x <-cbind(x1 = 3)
x2 = c(4:1, 2:5)
dimnames(x)[[1]] <- letters[1:8]
apply(x, 2, mean, trim = .2)
col.sums <- apply(x, 2, sum)
row.sums <- apply(x, 1, sum)
apply(x, 2, sort)






