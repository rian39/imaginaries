library('rpart')
library(ape)
library(cluster)
library(network)
library(igraph)
library(stats)
#plot(as.phylo(hclust(dist(mtcars))),type="fan")
#daisy(mtcars)
#plot(as.phylo(hclust(daisy(mtcars))),type="fan")
#row.names(imag) = imag$term
#imag = imag[,-1]
par(mfrow=c(1,2))
sci = imag$relation.to.science=='yes'
fem = imag$feminism == 'yes'
fonts = ifelse(sci, 4,1)
cexs = ifelse(fem, 0.8,0.6)
ph = as.phylo(hclust(daisy(imag, metric="gower")))
plot(ph, 'radial', font=fonts, cex=cexs )
plot(ph, show.node.label=TRUE, type='cladogram', root.edge=TRUE, cex=cexs, font=fonts,
     main='Author cladogram')
text(x = 10,y = 10,  'Names in bold address science and technology directly')
title(main="Author cladogram", col.main="red",
        sub="Names in bold are STS; names that are larger relate to feminism", col.sub="blue")
#d = daisy(imag)
#loc = cmdscale(d)
#plot(loc[1], loc[2], axes=FALSE, xlab='', ylab='', type='n', asp=1)
#agnes(daisy(imag), diss=TRUE)
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
