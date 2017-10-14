# script to tests similarity between distributions
# If not installed; make sure to do so for dgof package
#install.packages("dgof")
#install.packages("coin")

# If package installed, just invoke it
library(dgof)

# Lets create two "artificial" simple distributions
P<-rnorm(30000,mean=507,sd=0.9)
Q<-rnorm(30000,mean=510,sd=1.1)

ks.test(P,Q)

# Generate artificial data
x <- rnorm(30000)
y <- runif(30000)
z <- rnorm(30000)
# Do x and y come from the same distribution?
ks.test(x,y)
ks.test(x,z)

library(coin)

# permutation test
df1<-data.frame(P,Q)
head(df1,10)
independence_test(P~Q,df1)


df2<-data.frame(x,y,z)
independence_test(x~y,df2)
independence_test(x~z,df2)
