
library(network)
library(cluster)
library(ape)
library(ngramr)
library(ggplot2)
#ng = read.csv('../data/ngram.csv')
#names(ng) <- c('Phrase', 'Year', 'Frequency', 'X')
start_year = 1935 
imag = read.csv('../imaginary_data.csv')
terms = c( 'the imaginary ',  'social imaginary', 'cultural imaginary', 'national imaginary')
ng2 = ngram(terms, count=TRUE, case_ins = TRUE, smoothing = 0, corpus = 'eng_2012',  year_start = start_year, year_end  = 2012)
write.csv(ng2, '../data/ngram2.csv')
annot = imag[imag$citations > 200 & imag$year > start_year, c('author', 'term',  'year', 'citations')]
g = ggplot(data=ng2, aes(x = Year,  group = Phrase, y =log10(Count))) + geom_line(aes(linetype=Phrase), size=0.5)
g = g + annotate('text', x = annot$year, y = log10(annot$citations), label=paste(annot$author,' (', annot$term, ')', sep=''), size=2.8, family = 'Courier')
g = g + annotate('point', x = annot$year, y = log10(annot$citations)-0.1, size=2.8, shape = 4)
g = g + annotate('point', x = annot$year, y = log10(annot$citations)-0.1, size=2.8, shape = 3)
g = g + ggtitle('Imaginaries (1935-2012), with selected authors')
g = g+ theme(plot.title=element_text( size=11, face='bold', vjust=-2), legend.title = element_blank(), legend.justification=c(1,0), legend.position=c(1,0))
g = g + ylab ('Phrase count or citation count (log)')
x_a = 1937 
g = g + annotate('text', hjust=0, x=x_a,  y=1, size=2.9, family='Times', label=('The key terms come from Google ngrams (https://books.google.com/ngram).'))
g = g + annotate('text', hjust=0, x=x_a,  y=0.9, size=2.9, family='Times', label=('These terms were the most common usages of imaginary/ies.'))
g = g + annotate('text', hjust=0, x=x_a, y = 0.8, size = 2.9, family='Times', label = ('The key authors all have imaginary-related publications with more than 200 citations.'))
y_m = 0.7
g + geom_rect(alpha=0.9, aes(xmin=x_a-2, ymin= y_m, ymax = y_m + 1, xmax = x_a + 25))
g
ggsave('../figures/ngram10.svg')

# start the network diagram
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
#redo vertex names to include years
nodes_all = c(unique(as.character(imag$term_abbrev)), as.character(unique(imag$author_yr), as.character(unique(imag$cites1)), as.character(unique(imag$cites2))))
network.vertex.names(an) = as.character(nodes_all)

#plot interactively
coord= plot.network(an,label.pos=3, usearrows=FALSE,interactive=TRUE, jitter=TRUE,arrowhead.cex=0.0, displaylabels=TRUE, label.cex = citation_authors_labels, vertex.cex = citation_authors, vertex.sides = science_authors, vertex.col = author_term, vertex.rot=10)


svg('../figures/network10.svg', 10, 8)
plot.network(an,interactive=FALSE, coord = coord,  usearrows=FALSE, jitter=TRUE,arrowhead.cex=0.0, displaylabels=TRUE, label.pos=3, label.cex = citation_authors_labels, vertex.cex = citation_authors, edge.lwd=.5, edge.lty=3, vertex.sides = science_authors, vertex.col = author_term, vertex.rot=10, usecurve=FALSE)
text('Author and term network for imaginaries', font=2, x=-25, y=-35, cex=0.9 )
text('Authors (in blue); imaginary terms (in green) abbreviated to I.', x=-24, y=-37, cex=0.7 )
dev.off()

