#Final Project, Biostatistics
#Anna Lloyd
#Chapter 13, Problem 32


#Import data
data <- read.csv("../data/chap13q32GutFloraAutoimmune.csv")

library(ggplot2)

#Visualize data with box plot, store in pdf in results
#pdf("../results/pracPlot.pdf")
pdf("../results/interleukinBoxPlot.pdf")
ggplot(data, aes(x=treatment, y=percentInterleukin17, fill=treatment)) + stat_boxplot(geom ='errorbar') +geom_boxplot() + guides(fill=FALSE) + geom_point()
dev.off() 

#nonparametric test: MannWhitney U-test
interleukinTest <- wilcox.test(percentInterleukin17 ~ treatment, data = data)
summary(interleukinTest)
out<- capture.output(interleukinTest)
cat("Results", out, file ="../results/summary.txt", sep="\n", append=F)

