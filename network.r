library(network)

g2 = network(imag[,c('term', 'author')])
network.vertex.names(g2) = c(as.character(imag$term),as.character(imag$author))
plot(g2)
plot.network(g2,vert)
plot.network(g2)
g2
plot.network(g2,displaylabels=TRUE)
savehistory('network.r')
