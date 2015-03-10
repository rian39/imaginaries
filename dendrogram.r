library('RCircos')
library('rpart')
library(ape)
library(cluster)
library(network)
library(igraph)
data(mtcars)
#plot(as.phylo(hclust(dist(mtcars))),type="fan")
#daisy(mtcars)
#plot(as.phylo(hclust(daisy(mtcars))),type="fan")
setwd('~/Documents/imaginaries_cesagen_2010/')
imag = read.csv('imaginary_data.csv')
row.names(imag) = imag$author
#row.names(imag) = imag$term
#imag = imag[,-1]
plot(as.phylo(hclust(daisy(imag, metric='gower'))),type="fan")
plot(as.phylo(hclust(daisy(imag, metric='gower'))))

agnes(daisy(imag), diss=TRUE)
#svg('dendrogram.svg')

#plot(as.phylo(hclust(daisy(imag, metric='gower'))),type="fan")
#dev.off()
#plot(as.phylo(hclust(daisy(imag, metric='gower'))))
     #if (require(network)) {
         #x <- as.network(rtree(10))
         #print(x)
         #plot(x, vertex.cex = 1:4)
         #plot(x, displaylabels = TRUE)
     #}
     #tr <- rtree(5)
     #if (require(igraph)) {
         #print((x <- as.igraph(tr)))
         #plot(x)
         #print(as.igraph(tr, TRUE, FALSE))
         #print(as.igraph(tr, FALSE, FALSE))
     #}
