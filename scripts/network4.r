library(network)
library(cluster)
library(ape)
imag = read.csv('../imaginary_data.csv')
imag$start_year = imag$year
imag$end_year = 2016
imag$duration_weighted = log10(imag$citations/(imag$end_year - imag$start_year))

row.names(imag) = imag$author
p = as.phylo(hclust(daisy(imag, metric="gower")), use.labels=TRUE)
x = as.network(p)
term_nodes = unique(imag$term)
plot(x, vertex.cex=1:4, displaylabels=TRUE)

# construct imaginary terms abbreviated
imag$term_abbrev = sub(x = imag$term, 'imaginar(y|ies)*$', 'I.')
# constract author years
imag$author_yr = paste(imag$author, ' (', imag$year, ')', sep='')
# construct network
nodes_all = c(unique(as.character(imag$term_abbrev)), as.character(unique(imag$author), as.character(unique(imag$cites1)), as.character(unique(imag$cites2))))
an = network.initialize(length(nodes_all))
network.vertex.names(an) = as.character(nodes_all)
src = sapply(imag$term_abbrev, function(x) which(nodes_all==x))
tgt = sapply(imag$author, function(x) which(nodes_all==x))
add.edges(an, tgt, src)
src = sapply(imag$author, function(x) which(nodes_all == x))
tgt = sapply(imag$cites1, function(x) which(nodes_all == x))
add.edges(an, tgt, src)
author_term= ifelse(nodes_all %in% imag$author, 'blue', 'green')
science_authors = ifelse(nodes_all %in% imag$author[imag$relation.to.science == 'yes'], 4, 6) 
citation_authors = ifelse(nodes_all %in% imag$author, 0.9, 1.9)
citation_authors_labels = ifelse(nodes_all %in% imag$author, 0.6, 0.8)
coord= plot.network(an,label.pos=3, usearrows=FALSE,interactive=TRUE, jitter=TRUE,arrowhead.cex=0.0, displaylabels=TRUE, label.cex = citation_authors_labels, vertex.cex = citation_authors, vertex.sides = science_authors, vertex.col = author_term, vertex.rot=10)

#redo vertex names to include years

nodes_all = c(unique(as.character(imag$term_abbrev)), as.character(unique(imag$author_yr), as.character(unique(imag$cites1)), as.character(unique(imag$cites2))))
network.vertex.names(an) = as.character(nodes_all)

svg('../figures/network10.svg', 10, 8)
plot.network(an,interactive=FALSE, coord = coord,  usearrows=FALSE, jitter=TRUE,arrowhead.cex=0.0, displaylabels=TRUE, label.pos=3, label.cex = citation_authors_labels, vertex.cex = citation_authors, edge.lwd=.5, edge.lty=3, vertex.sides = science_authors, vertex.col = author_term, vertex.rot=10, usecurve=FALSE)
text('Author and term network for imaginaries', font=2, x=-25, y=-35, cex=0.9 )
text('Authors (in blue); imaginary terms (in green) abbreviated to I.', x=-24, y=-37, cex=0.7 )
dev.off()

#older stuff#
plot(x, vertex.cex=imag$duration_weighted, displaylabels=TRUE,label.cex=0.4)
plot(x, vertex.cex=1:3, displaylabels=TRUE,label.cex=0.6)
plot(x, vertex.cex=1:4, displaylabels=TRUE,label.cex=rep(0.3,1,0.1))
plot(x, vertex.cex=1:4, displaylabels=TRUE,label.cex=c(0.3,1,0.1))
p$tip.label
plot(as.network(p), vertex.cex=1:4, displaylabels=TRUE,label.cex=c(0.3,1,0.1))
str(p)
n = as.network(p)
str(n)
plot(as.network(p), vertex.cex=1:4, displaylabels=TRUE,label.cex=c(0.3,1,0.4))
plot(as.network(p), vertex.cex=1:4, displaylabels=TRUE,label.cex=c(0.3,1,0.5))
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=c(0.3,1,0.5))
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=c(0.5,1,0.5))
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7)
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7)
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7, vertex.col='green')
n$val
svg('../figures/network3.svg')
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7, vertex.col='green')
dev.off()
svg('../figures/network3.svg')
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7, vertex.col='green')
dev.off()
svg('figures/network3.svg')
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7, vertex.col='green')
dev.off()
ls()
pwd()
dir()
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7, vertex.col='green', jitter=TRUE)
svg('figures/network3.svg')
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7, vertex.col='green', jitter=TRUE,main = 'clustering of imaginary authors')
dev.off()
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7, vertex.col='green', jitter=TRUE,main = 'clustering of imaginary authors', usecurve=TRUE)
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7, vertex.col='green', jitter=TRUE,main = 'clustering of imaginary authors', usecurve=TRUE, uselen=TRUE)
plot(as.network(p), vertex.cex=1:2, displaylabels=TRUE,label.cex=0.7, vertex.col='green', jitter=TRUE,main = 'clustering of imaginary authors', usecurve=TRUE, uselen=TRUE, interactive=TRUE)
