rm(list=ls())

attach(mtcars)
cars=mtcars



cars=scale(cars)

car_dist=dist(cars, method = "euclidean")
car_dist

car_hclust=hclust(car_dist,method = "complete")

plot(car_hclust)

car_tree=cutree(car_hclust,k=4)

car_tree

cars_hcluster=data.frame(cars, hcluster=car_tree)

rect.hclust(car_hclust,k=4,border = 'red' )
