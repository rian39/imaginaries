
imag = read.csv('../imaginary_data.csv')

# add start and end year columns


imag$start_year = imag$year
imag$end_year = 2015
row.names(imag) = imag$author
source('dendrogram.r')
