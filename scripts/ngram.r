library(ngramr)
library(ggplot2)
#ng = read.csv('../data/ngram.csv')
#names(ng) <- c('Phrase', 'Year', 'Frequency', 'X')
start_year = 1935 
imag = read.csv('../imaginary_data.csv')
terms = c( 'the imaginary ',  'social imaginary', 'cultural imaginary', 'national imaginary')
ng2 = ngram(terms, count=TRUE, case_ins = TRUE, smoothing = 0, corpus = 'eng_2012',  year_start = start_year, year_end  = 2012)

g = ggplot(data=ng2, aes(x = Year,  group = Phrase, y =log10(Count))) + geom_line(aes(linetype=Phrase), size=0.5)
#g = ggram(terms, year_start = 1950, year_end = 2012, 
      #corpus = "eng_2012", ignore_case = TRUE, 
      ##geom = "area", geom_options = list(position = "stack")) + 
      #labs(y = NULL, google_theme=TRUE) + theme_bw()
annot = imag[imag$citations > 200 & imag$year > start_year, c('author', 'year', 'citations')]
g = g + annotate('text', x = annot$year, y = log10(annot$citations), label=annot$author, size=2.8, family = 'Courier')
g = g + annotate('point', x = annot$year, y = log10(annot$citations)-0.1, size=2.8, shape = 3)
g + ggtitle('Central imaginaries in books (1935-2012), with author annotations', family='Times', size=2.9, face='bold') + ylab ('Phrase count or citation count')
ggsave('../figures/ngram9.svg')


## to add the labels
g+ geom_point(data = imag, aes(x=year, y=citations ), size=5, shape=12)
g+geom_text(data = imag[imag$citations>50,], aes(label=author, x=year, y=citations), vjust=3)
