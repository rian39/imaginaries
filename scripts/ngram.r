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


## to add the labels
g+ geom_point(data = imag, aes(x=year, y=citations ), size=5, shape=12)
g+geom_text(data = imag[imag$citations>50,], aes(label=author, x=year, y=citations), vjust=3)
