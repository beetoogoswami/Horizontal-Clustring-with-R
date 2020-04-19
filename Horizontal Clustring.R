rm(list=ls())

setwd("C:/Users/PC/Desktop/Data Science - Ayub/Lab Activity/Clustering_Python_lab_Activity/R based")


data=read.csv("Cereals.csv", sep=",", header = TRUE)
data=data[,-c(1)]

data1=scale(data)

data1=knnImputation(data1, k=10)

sum(is.na(data1))
# calculating distance using eucalidean

data1_dist=dist(data1,method = "euclidean")
data1_dist
summary(data1_dist)

# using horizontal clustring method

data_hcust=hclust(data1_dist, method = "complete")
data_hcust$height
data_hcust$order
data_hcust$labels
data_hcust$method
data_hcust$dist.method

plot(data_hcust)

# cuting the tree in 6 groups

data_clust=cutree(data_hcust, k=6)
data_clust

rect.hclust(data_hcust,k=6, border = 'red')

data_clusterd=data.frame(data,data_clust)
