source('treemap.r')
source('treemap.r')
source('treemap.r')
source('treemap.r')
svg('treemap4.svg')
source('treemap.r')
dev.off()
?svg
svg(width=10, height=8, 'treemap4.svg')
source('treemap.r')
dev.off()
source('treemap.r')
svg(width=10, height=8, 'treemap4.svg')
source('treemap.r')
dev.off()
svg(width=10, height=8, 'treemap4.svg')
source('treemap.r')
dev.off()
source('treemap.r')
source('treemap.r')
source('treemap.r')
source('treemap.r')
source('treemap.r')
svg(width=10, height=8, 'treemap5.svg')
source('treemap.r')
dev.off()
source('dendrogram.r')
source('dendrogram.r')
plot(as.phylo(hclust(daisy(imag, metric='gower'))),type="fan")
source('treemap.r')
imag
barplot(imag$citation_wt)
imag$year
hist(imag$year)
hist(imag$year,breaks=10)
head(imag)
table(imag$primary_discipline, imag$term)
table(imag$primary_discipline, imag$domain)
head(imag)
library(timeline)
timeline(imag, label.col = 'author', group.col='term', event.col='year')
head(imag)
timeline(imag, label.col = 'author', group.col='term', event.col='year')
timeline(imag)
timeline(imag, event.col=image$year)
timeline
image$year
imag$year
timeline(imag[,c('year', 'author')])
imag[,c('year', 'author')]
timeline(imag[,c('year', 'author')], label.col='author', event.col='year')
timeline(imag[,c('year', 'author')], label.col=imag['author'], event.col=imag['year'])
imag['author']
timeline(imag[,c('year', 'author')], label.col=author, event.col=year)
timeline(imag[,c('year', 'author')], label.col=author, event.col=year)
timeline(imag, group.col=author, event.col=year)
timeline(imag, group.col='author', event.col='year')
?na
??na
na.omit(imag)
imag
head(imag)
imag = imag[,c(1,2,4)]
imag
timeline(imag, group.col='author', event.col='year')
imag = imag[1:10,c(1,2,4)]
imag = imag[c(1,2,3),c(1,2,4)]
timeline(ww2)
data(ww2)
timeline(ww2)
head(ww2)
head(imag)
imag$end_year = 2016
head(imag)
imag$start_year = imag$year
head(imag)
timeline(imag, start.col='start_year', end.col=='end_year', event.col='term')
timeline(imag, start.col='start_year', end.col='end_year', event.col='term')
imag
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='term')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='term')
svg('timeline1.svg')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='term')
dev.off()
svg('timeline1.svg', width=10, height=7)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='term')
dev.off()
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='term',group.col='domain')
imag = read.csv('imaginary_data.csv')
imag$start_year = imag$year
imag$end_year = 2016
head(imag)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='term',group.col='primary_discipline')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author', group.col='term')
imag$author
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author', group.col='term', event.label='author')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author', group.col='domain', event.label='author')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author', group.col='domain', event.label='author')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  event.label='author')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  event.label='author')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label='author')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author')
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=4)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=10)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30,text.size=9)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30,text.size=5#)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30,text.size=5)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30,text.size=2)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30,text.size=3)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30,text.size=3, event.spots=4)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30,text.size=3, event.spots=40)
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30,text.size=3, event.spots=40,event.group.col='domain')
imag = read.csv('imaginary_data.csv')
imag$end_year = 2016
imag$start_year = imag$year
timeline(imag[-15,], start.col='start_year', end.col='end_year', event.col='author',  group.col='term', event.label.col='author', label.col='author', event.line=TRUE, num.label.steps=30,text.size=3, event.spots=40,event.group.col='domain')
library(cluster)
library(agnes)
plot(hclust(daisy(imag)))
?cluster::pltree
row.names(imag) = imag$author
plot(hclust(daisy(imag)))
library(ape)
m = daisy(imag)
m
summary(m)
tree = "(human,(chimp,bonobo));"
browser.start()
read.tree(tree)
read.tree(text=tree)
tree = "(human:0.8,(chimp:0.1,bonobo:0.2));"
read.tree(text=tree)
t = read.tree(text=tree)
plot(t)
tree = "(human:0.8,(chimp:0.1,bonobo:0.2), canine:0.9);"
t = read.tree(text=tree)
savehistory('timeline.r')
t
?root
t = root(t, 1)
summary(t)
?plot.phylo
t2 = read.tree(text=("(((Strix_aluco:4.2,Asio_otus:4.2):3.1,",
t2 = read.tree(text=("(((Strix_aluco:4.2,Asio_otus:4.2):3.1,Athene_noctua:7.3):6.3,Tyto_alba:13.5);")
)
plot.phylo(t2)
t2 = read.tree(text=("(((Strix_aluco:4.2,Asio_otus:4.2):3.1,Athene_noctua:7.3):6.3,Tyto_alba:13.5);"))
plot.phylo(t2)
t2 = root(t2,4)
plot.phylo(t2)
plot.phylo(t2, 'radial')
t2 = read.tree(text=("(((Kant:4.2,Lacan:4.2):3.1,Castoriadis:7.3):6.3,Taylor:13.5);"))
plot.phylo(t2, 'radial')
t2 = read.tree(text=("(((Satre:4.2,Lacan:4.2):3.1,Castoriadis:7.3):6.3,Kant:13.5);"))
plot.phylo(t2, 'radial')
t2 = read.tree(text=("(((Satre:1.2,Lacan:1.2):3.1,Castoriadis:7.3):6.3,Kant:13.5);"))
plot.phylo(t2, 'radial')
t2 = read.tree(text=("(((Satre:1.2,Lacan:1.2):1.1,Castoriadis:7.3):6.3,Kant:13.5);"))
plot.phylo(t2, 'radial')
plot.phylo(t2, type = 'radial')
plot.phylo(t2, type = 'c')
t2 = read.tree(text=("((((Plato):4,Satre:1.2,Lacan:1.2):1.1,Castoriadis:7.3):6.3,Kant:13.5);"))
t2 = read.tree(text=("(((Satre:1.2,Lacan:1.2):1.1,Castoriadis:7.3):6.3,Kant:13.5):4,Plato);"))
plot.phylo(t2, type = 'c')
t2 = read.tree(text=("(((Satre:1.2,Lacan:1.2):1.1,Castoriadis:7.3):6.3,Kant:13.5),Plato);"))
plot.phylo(t2, type = 'c')
t2 = read.tree(text=("(((Satre:1.2,Lacan:1.2):1.1,Castoriadis:7.3):6.3,Kant:13.5);"))
plot.phylo(t2, type = 'c')
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(C:0.3,D:0.4)F:0.5);"))
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(C:0.3,D:0.4)F:0.5);"), type='cladogram')
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(C:0.3,D:0.4)F:0.5);"), type='fan')
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(C:0.3,D:0.4)F:0.5);"), type='unrooted')
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(C:0.3,D:0.4)F:0.5);"), type='unrooted')
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(C:0.3,D:0.4)F:0.5);"), type='fan')
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,Wynne:0.4)F:0.5);"), type='fan')
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='fan')
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='fan', show.node=TRUE)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.5)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7,margins=0)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7,no.margin=TRUE)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7,no.margin=FALSE)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7,no.margin=FALSE, root.edge=TRUE)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7,no.margin=FALSE, root.edge=TRUE)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7,no.margin=FALSE, root.edge=TRUE, label.offset=5)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7,no.margin=FALSE, root.edge=TRUE, label.offset=0.5)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7,no.margin=FALSE, root.edge=TRUE, label.offset=0.1)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='clad', show.node=TRUE, cex=0.7,no.margin=FALSE, root.edge=TRUE, label.offset=0.05)
imag
library(ggtree)
library(ggtree)
plot(read.tree(text="(Kant:-.3,((Irigary:4, Doeuff:3)Lacan:1, Satre:2)A:0.1,B:0.2,(Jasanoff:0.3,(Marris:0.4, Stephens:2)Wynne:0.4)F:0.5);"), type='radi', show.node=TRUE, cex=0.7,no.margin=FALSE, root.edge=TRUE, label.offset=0.05)
d
str(d)
d
d[1:10,1:10]
d[1,1]]
d[1,1]
dim(d)
as.matrix(d)
dim(as.matrix(d))
dm = as.matrix(d)
dm
dm[1,]
dm[1,]>0.8
dim[dm[1,]>0.8,]
dm[dm[1,]>0.8,]
dm[,dm[1,]>0.8]
dm[1,dm[1,]>0.8]
summary(dm)
mean(dm)
fivenum(d)
library(ddplyr0
library(ddplyr)
library(dplyr)
library(plyr)
?plyr::split_labels
library(dplyr)
df %>% groupby(term)
imag %>% group_by(term)
imag %>% group_by(term) %>% summarise(author)
imag %>% group_by(term) %>% summarise(author, term)
str(imag)
aggregate(imag, by='term')
aggregate(imag, by='term', FUN='table')
table(imag:term)
table(imag$term)
table(imag$term, imag$domain)
table(imag$term, imag$year)
head(imag)
paste(imag$term, collapse=',')
'('+paste(imag$term, collapse=',')
paste('(',imag$term, collapse=',')
?sort
order(imag, c('term', 'year'))
?order
order(imag$term, imag$year)
imag[order(imag$term, imag$year),]
imag = imag[order(imag$term, imag$year),]
imag
plot.phylo(read.tree(text = "(Lacan, Satre)The_Imaginary);"))
plot.phylo(read.tree(text = "(Lacan, Satre)The_Imaginary;"))
plot.phylo(read.tree(text = "(Lacan, Satre)The_Imaginary;"),show.node.label=TRUE)
plot.phylo(read.tree(text = "(Lacan, Satre)The_Imaginary,(Smith, Jasanoff)sociotechnical_imaginary;"),show.node.label=TRUE)
plot.phylo(read.tree(text = "(Lacan, Satre)The_Imaginary;(Smith, Jasanoff)sociotechnical_imaginary;"),show.node.label=TRUE)
plot.phylo(read.tree(text = "(Lacan, Satre)The_Imaginary;(Smith, Jasanoff)sociotechnical_imaginary;"),show.node.label=TRUE)
plot.phylo(read.tree(text = "(Lacan, Satre)The_Imaginary,(Smith, Jasanoff)sociotechnical_imaginary;"),show.node.label=TRUE)
plot.phylo(read.tree(text = "(Lacan, Satre)The_Imaginary(Smith, Jasanoff)sociotechnical_imaginary;"),show.node.label=TRUE)
plot.phylo(read.tree(text = "((Lacan, Satre)The_Imaginary),(Smith, Jasanoff)sociotechnical_imaginary;"),show.node.label=TRUE)
plot.phylo(read.tree(text = "((Lacan, Satre)The_Imaginary)(Smith, Jasanoff)sociotechnical_imaginary;"),show.node.label=TRUE)
paste(imag$term, imag$author, collapse=TRUE)
paste(imag$term, imag$author, collapse='')
paste(imag$term, imag$author, collapse='', sep=',')
paste(c(imag$term, imag$author), collapse='', sep=',')
paste('(', imag$term, imag$author,')', collapse='', sep=',')
paste('(', imag$term,':', imag$author,')', collapse='', sep=',')
paste('(', imag$term,':', imag$author,')')
paste('(', imag$term,',', imag$author,')', sep='')
paste(paste('(', imag$term,',', imag$author,')', sep=''),sep=',')
paste(paste('(', imag$term,',', imag$author,')', sep=''),sep=',', collapse='')
paste(paste('(', sub(pattern=' ', '_',imag$term),',', imag$author,')', sep=''),sep=',', collapse='')
paste(paste('(', sub(pattern=' ', '_',imag$term),',', imag$author,')', sep=''),',' collapse='')
paste(paste('(', sub(pattern=' ', '_',imag$term),',', imag$author,')', sep='')),',' collapse='')
paste(paste('(', sub(pattern=' ', '_',imag$term),',', imag$author,')', sep=''))',' collapse='')
paste(paste('(', imag$term,',', imag$author,')', sep=''),sep=',')
paste(paste('(', imag$term,',', imag$author,'),', sep=''),sep=',')
s1 = paste(paste('(', imag$term,',', imag$author,'),', sep=''),sep=',')
s1
s1 = paste(paste('(', sub(' ', '_', imag$term),',', imag$author,'),', sep=''),sep=',')
s1
paste(s1, collapse='')
s1 = paste(paste('(', sub(' ', '_', imag$term),',', imag$author,')', sep=''),sep=',')
paste(s1, collapse=',')
s2 =paste(s1, collapse=',')
s2
read.tree(text=s2)
s2
read.tree(s2)
read.tree(text=s2)
plot(read.tree(text=s2))
paste(s2,';')
paste(s2,';', sep='')
s2
s2 = paste(s2,';')
s2
s2 = paste(s2,';', sep='')
s2
s2 =paste(s1, collapse=',')
s2
s3 = paste(s2,';', sep='')
s3
read.tree(text=s3)
plot(read.tree(text=s3))
t3 = read.tree(text=s3)
t3$edge
t3$tip.label
t3$Nnode
mode(t3)
str(t3)
attr(t3)
attrs(t3)
attributes(t3)
by(imag, imag$term, function(t){paste(imag$author, collapse='', sep=',')})
by(imag, imag$term, function(t){paste(t$author, collapse='', sep=',')})
by(imag, imag$term, function(t){paste(t$author, collapse=',', sep=',')})
by(imag, imag$term, function(t){paste('(',paste(t$author, collapse=',', sep=','),')')})
by(imag, imag$term, function(t){paste('(',paste(t$author, collapse=',', sep=','),')',sep='')})
by(imag, imag$term, function(t){paste('(',paste(t$author, collapse=',', sep=','),')',t$term, sep='')})
by(imag, imag$term, function(t){paste('(',paste(t$author, collapse=',', sep=','),')',sub(' ','_',t$term), sep='')})
unlis(by(imag, imag$term, function(t){paste('(',paste(t$author, collapse=',', sep=','),')',sub(' ','_',t$term), sep='')}))
unlist(by(imag, imag$term, function(t){paste('(',paste(t$author, collapse=',', sep=','),')',sub(' ','_',t$term), sep='')}))
unlist(by(imag, imag$term, function(t){paste('(',paste(t$author, collapse=',', sep=','),')',sub(' ','_',t$term), sep='')}),use.names=FALSE)
unique(unlist(by(imag, imag$term, function(t){paste('(',paste(t$author, collapse=',', sep=','),')',sub(' ','_',t$term), sep='')}),use.names=FALSE))
unique(unlist(by(imag, imag$term, function(t){paste('(',paste(t$author, collapse=',', sep=','),')',sub(' ','_',t$term), sep='')}),use.names=FALSE))
savehistory('tree2.r')
library(network)
add.vertices(imag$author)
a = network()
?network
?network.edgelist
network.edgelist(imag$term, imag$author)
imag
network.edgelist(c(1,2,3,4,5), c(2,4,5,1,2))
?network.vertex
?network.edgelist
network.edge(imag[,c('author', 'term')], network.initialize(n= nrow(imag)))
network.edgelist(imag[,c('author', 'term')], network.initialize(n= nrow(imag)))
g = network.edgelist(imag[,c('author', 'term')], network.initialize(n= nrow(imag)))
plot(g)
?plot.network
plot(g,displaylabels=TRUE)
g
?network.edgelist
network(imag[,c('term', 'author')])
g2 = network(imag[,c('term', 'author')])
network.vertex.names(g2) = imag$term + imag$author
network.vertex.names(g2) = as.character(imag$term) + as.character(imag$author)
network.vertex.names(g2) = c(as.character(imag$term),as.character(imag$author))
plot(g2)
plot.network(g2,vert)
plot.network(g2)
g2
plot.network(g2,displaylabels=TRUE)

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
g4+g5
plot(g4, displaylabels=TRUE)
plot(g5, displaylabels=TRUE)
savehistory('network1.r')
