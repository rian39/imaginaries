library(portfolio)
library(treemap) 
imag =read.csv('imaginary_data.csv')
#map.market(id=imag$author, area=imag$citations, group=imag$term, color=imag$year, lab=TRUE)
year_wt = imag$citations/(2016 - imag$year)
imag$citation_wt = log10(year_wt)+1
imag$year_term = paste(imag$year, ': ', imag$term, sep='')
#map.market(id=imag$author, area=imag$citation_wt, group=imag$term, color=imag$year, lab=TRUE)
#treemap(dtf=imag, index=c( 'term'), vSize='citation_wt', vColor='term', type='categorical')
#treemap(dtf=imag, index=c( 'term', 'domain', 'methodology', 'author'), vSize='citation_wt', vColor='term', type='categorical')
#treemap(dtf=imag, index=c('relation.to.science', 'term', 'domain', 'methodology', 'author'), vSize='citation_wt', vColor='term', type='categorical')

##this one is interesting
treemap(dtf=imag, index=c('term', 'relation.to.science', 'domain', 'methodology', 'author'), vSize='citation_wt', vColor='term', type='index', title = 'Imaginaries and their relation to STS', sortID='year',  fontsize.title=12, fontsize.labels=c(12,9),  lowerbound.cex.labels=0.6, align.labels=list(c('center', 'center'), c('left','top'), c('right', 'top'), c('left', 'bottom' ), c( 'right', 'bottom')))
#treemap(dtf=imag, index=c( 'relation.to.science', 'year_term', 'domain', 'methodology', 'author'), vSize='citation_wt', vColor='term', type='categorical', title = 'Imaginaries and their relation to STS', sortID='year',  fontsize.title=12, fontsize.labels=c(12,9),  lowerbound.cex.labels=0.5,border.lwds = c(7,5,3,2,1), fontsize.legend=9, align.labels=list(c('center', 'center'), c('left','top'), c('right', 'top'), c('left', 'bottom' ), c( 'right', 'bottom')), algorithm='pivotSize', aspRatio=1.2)
treemap(dtf=imag, index=c( 'year_term', 'relation.to.science', 'domain', 'methodology', 'author'), vSize='citation_wt', vColor='relation.to.science', type='categorical', title = 'Imaginaries and their relation to STS', sortID='year',  fontsize.title=12, fontsize.labels=c(12,9),  lowerbound.cex.labels=0.5,border.lwds = c(7,5,3,2,1), fontsize.legend=9, align.labels=list(c('center', 'center'), c('left','top'), c('right', 'top'), c('left', 'bottom' ), c( 'right', 'bottom')), algorithm='pivotSize', aspRatio=1.2)

