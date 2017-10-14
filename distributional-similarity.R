# script to tests similarity between distributions
# If not installed; make sure to do so for dgof package
#install.packages("dgof")

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
