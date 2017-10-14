# Make sure the package "philentropy" is installed. Otherwise
# do so by using the following:
#install.packages("philentropy")

# Assuming the library is already installed; let's invoke it
library(philentropy)

# Lets create two "artificial" simple distributions
P<-rnorm(30000,mean=507,sd=0.9)
Q<-rnorm(30000,mean=510,sd=1.1)


jpeg('./plots/Hist_P.jpg')
hist(P)
dev.off()

jpeg('./plots/Hist_Q.jpg')
hist(Q)
dev.off()

# Metrics of central tendency
mean(P)
mean(Q)
sd(P)
sd(Q)
median(P)
median(Q)

# Let's normalize the distributions
Pn<-P/sum(P)
Qn<-P/sum(Q)

mean(Pn)
mean(Qn)

sd(Pn)
sd(Qn)

median(Pn)
median(Qn)

# Generate historgrams of normalized distributions
jpeg('./plots/Hist_P normalized.jpg')
hist(Pn)
dev.off()

jpeg('./plots/Hist_Q normalized.jpg')
hist(Qn)
dev.off()


# We can check implemented distance/similarity functions
getDistMethods()

distance(rbind(P,Q), method = "euclidean")
distance(rbind(P,Q), method = "jaccard")
distance(rbind(P,Q), method = "jensen-shannon")



distance(x, method = "jaccard")
distance(x, method = "jensen-shannon")

mean(P)
mean(Q)
sd(P)
sd(Q)
m <- 0.5 * (P + Q)
JS <- 0.5 * (sum(P * log(P / m)) + sum(Q * log(Q / m)))
JS



#combine three probabilty vectors to a probabilty matrix 
ProbMatrix <- rbind(1:10/sum(1:10), 20:29/sum(20:29),30:39/sum(30:39))
# compute the euclidean distance between all 
# pairwise comparisons of probability vectors
distance(ProbMatrix, method = "euclidean")



distance(rbind(P,P), method = "jensen-shannon")





P <- 1:10/sum(1:10)
Q <- 101:110/sum(101:110)
hist(P)
hist(Q)

mean(P)
mean(Q)
sd(P)
sd(Q)
median(P)
median(Q)
# combine P and Q as matrix object
x <- rbind(P,Q)
distance(x, method = "jaccard")
distance(x, method = "jensen-shannon")


# Plotting two histograms on the samle plot
a=rnorm(100,mean=10,sd=1)
b=rnorm(100,mean=13,sd=1)

# Side by side
# print the two histograms side-by-side
par(mfrow=c(1,2))
hist(a,main="")
hist(b,main="")

# Overlapped
hist(a,xlim=c(5,18),ylim=c(0,30),breaks=10,col=rgb(1,1,0,0.7),main="",xlab="number")
par(new=TRUE)
hist(b,xlim=c(5,18),ylim=c(0,30),breaks=10,col=rgb(0,1,1,0.4),main="",xlab="",ylab="")

getDistMethods()
distance(rbind(a,b),method = "jensen-shannon")
distance(rbind(a,b),method = "euclidean")


dist.diversity(rbind(P,Q))
