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
