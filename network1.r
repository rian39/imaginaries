library(network)
g3 = network(imag[,c('term', 'author')],loops=TRUE,bipartite=TRUE)
plot(g3, displaylabels=TRUE)
g3 = network(imag[,c('term', 'author')],loops=FALSE,bipartite=TRUE)
plot(g3, displaylabels=TRUE)
g3 = network(imag[,c('term', 'author')],loops=FALSE,bipartite=FALSE)
plot(g3, displaylabels=TRUE)
g3 = network(imag[,c('term', 'author')],loops=FALSE,bipartite=FALSE)
svg('network1.svg')
plot(g3, displaylabels=TRUE)
dev.off()
add.edges(g3, imag$author, imag$cites1)
add.edges(x=g3, imag$author, imag$cites1)
str(g3)
mode(g30
)
mode(g3)
summary(g3)
network.vertex.names(g3)
nn = network.vertex.names(g3)
vs = unique(imag$cites1)
vs
vs %in% nn
vs[!vs %in% nn]
add.vertices(g3, vs[!vs %in% nn])
add.vertices(x=g3, vs[!vs %in% nn])
add.edges(x=g3, imag$author, imag$cites1)
as.network(g3)
plot(g3)
plot(g3)
plot(g3,displaylabels=TRUE)
add.vertices(g3, c(1,2)
g3
?network.vertex
?add.vertices
vs[!vs %in% nn]
newvert = vs[!vs %in% nn]
length(newvert)
?add.vertices
va = unique(c(imag$author, imag$cites1))
va
imag$author
va = c(imag$author, imag$cites1)
va
imag$cites1
va = unique(c(as.character(imag$author), as.character(imag$cites1)))
va
vb = unique(as.character(imag$term))
vb
g4 = network(x =imag[, c('term', 'author')])
g5 = network(x =imag[, c('author, 'cites1')])
g5 = network(x =imag[, c('author', 'cites1')])

plot(g4, displaylabels=TRUE)
plot(g5, displaylabels=TRUE)

