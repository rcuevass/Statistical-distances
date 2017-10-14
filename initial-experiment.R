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


# We generate plots of side-by-side and overlapped histrograms
# Side by side
jpeg('./plots/Side by side P and Q histograms.jpg')
par(mfrow=c(1,2))
hist(P,main="")
hist(Q,main="")
dev.off()

# Overlapped
jpeg('./plots/Overlapped P and Q historgrams.jpg')
hist(P,xlim=c(500,520),ylim=c(0,6150),breaks=16,col=rgb(1,1,0,0.7),main="",xlab="number")
par(new=TRUE)
hist(Q,xlim=c(500,520),ylim=c(0,6150),breaks=16,col=rgb(0,1,1,0.4),main="",xlab="",ylab="")
dev.off()

# We generate plots of side-by-side and overlapped normalised histrograms
# Side by side
jpeg('./plots/Side by side Pn and Qn histograms.jpg')
par(mfrow=c(1,2))
hist(Pn,main="")
hist(Qn,main="")
dev.off()

# Overlapped
jpeg('./plots/Overlapped Pn and Qn historgrams.jpg')
hist(Pn,xlim=c(3e-5,5e-5),ylim=c(0,10000),breaks=16,col=rgb(1,1,0,0.7),main="",xlab="number")
par(new=TRUE)
hist(Qn,xlim=c(3e-5,5e-5),ylim=c(0,10000),breaks=16,col=rgb(0,1,1,0.4),main="",xlab="",ylab="")
dev.off()

# We can check implemented distance/similarity functions
metrics_names<-getDistMethods()

distance(rbind(P,Q), method = "euclidean")
distance(rbind(P,Q), method = "jaccard")
distance(rbind(P,Q), method = "jensen-shannon")
distance(rbind(P,Q), method = "inner_product")
distance(rbind(P,Q), method = "cosine")

# Note that if the distributions are not normalized the following
# command fails
dist.diversity(rbind(P,Q))

# We test same metrics as before for the normalized distributions
distance(rbind(Pn,Qn), method = "euclidean")
distance(rbind(Pn,Qn), method = "jaccard")
distance(rbind(Pn,Qn), method = "jensen-shannon")
distance(rbind(Pn,Qn), method = "inner_product")
distance(rbind(Pn,Qn), method = "cosine")

metrics_values <- (dist.diversity(rbind(Pn,Qn)))

# Let's generate all metrics for these distributions and save
# to csv file for further review
dfMetrics<-data.frame(metrics_names,metrics_values)
dfMetrics<-data.frame(dfMetrics$metrics_names,dfMetrics$metrics_values)
names(dfMetrics) <- c("metric_name","metric_value")
# Sort dataframe by value of metric
dfMetrics<-dfMetrics[with(dfMetrics, order(metrics_values)), ]

write.csv(dfMetrics,"./output_data/summary_metrics.csv")

# Generate bar plot of metrics
jpeg('./plots/barplot_metrics.jpg')
barplot(dfMetrics$metric_value, names = dfMetrics$metric_name,
        xlab = "Metric name", ylab = "Value",
        main = "Summary of statistical metrics",horiz = FALSE)
dev.off()


# A simple example to compare multiple distributions
ProbMatrix <- rbind(1:10/sum(1:10), 20:29/sum(20:29),30:39/sum(30:39))
# compute the euclidean distance between all 
# pairwise comparisons of probability vectors
distance(ProbMatrix, method = "euclidean")
distance(ProbMatrix, method = "jensen-shannon")

# Distance diversity seems to work only for two distributions
#dist.diversity(ProbMatrix)


