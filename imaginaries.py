# -*- coding: utf-8 -*-
# <nbformat>3.0</nbformat>

# <markdowncell>

# # Imaginaries and STS literatures citation analysis

# <codecell>

%load_ext autoreload
%autoreload 2

# <codecell>

import pandas as pd
import seaborn
import cit_anal as ca
import pickle
import re
import operator
from pylab import *
from IPython.display import HTML

# <markdowncell>

# ## Literatures: imaginaries (all humanities/social science fields) and the sts literature (from 3 major journals or from around 70 journals)
# 
# The analysis explores the relation between **three literatures** - the imaginaries literature and the sts literature:
# 
# 1. For 'imaginaries,' the query was 'imaginaries' or 'imaginary' in any social science or humanities publication (all years);
# 2. For STS, the query asked for all publications from Social Studies of Science, STHV and Science as Culture (all years).
# 3. For broader STS work, using the list of STS journals from http://www.4sonline.org/resources/journals, the 'imaginary/imaginaries' query
# 
# The queries were run on Thomson Scientific Web of Science. Full records including cited references were downloaded for both literatures.
# 

# <codecell>

imdf = ca.load_records(dir = 'data/')
print(str(imdf.shape[0]) + ' imaginary references across social science and humanities to Feb 2015')

# <codecell>

stsdf = ca.load_records(dir = 'data_sts_authors/')

print(str(stsdf.shape[0]) + ' references published in the major sts journals to Feb 2015')

# <markdowncell>

# Whereas the STS literature comes from 3 journals, the imaginaries literature comes from many journals and fields. Many of these fields overlap to some degree. Literature predominates, quite massively.

# <codecell>



## to get simplified view

imdf = ca.field_normalise(imdf)


vc = imdf.field.value_counts()[0:30]
vc.plot(kind='barh', alpha=0.3, color='k', figsize=(10,8), legend=True)

print(imdf.WC.value_counts()[0:30])

# <markdowncell>

# Similarly the publication venues of for the imaginaries literature are quite diverse. In the list below, _Environment and Planning D_ and _Theory, Culture & Society_ stand out as places where STS articles might also appear. But basically, the imaginaries literature is in literature journals, and particularly the French ones (7 of the top 10). 

# <codecell>

print(imdf.SO.value_counts()[0:50])

# <markdowncell>

# ## Does the disciplinary mix of the imaginaries literature change over time?

# <codecell>

#simplify the fields a bit -- they are too complicated

fields_df  =ca.fields_over_time(imdf)
cols = [col for col in fields_df.columns if fields_df[col].sum()>80]
fields_df[cols].cumsum().plot(alpha=0.6, legend=True, figsize=(14,10), lw=5, title='Publications by field (top 10; cumulative count)')

# <markdowncell>

# The imaginaries iterature has grown  most steeply in literature, literature (romance languages) and history, especially since 2000. These graphs are _not_ normalised by discipline size. That is, they are perhaps many more publications in literature and history in general than say anthropology or sociology. Nearly all fields seem to show a much steeper growth since around 2005. 
# 
# There is no point graphing this for the STS literature -- it is all code by a three fields, which is quite striking in itself. Why is it coded so narrowly by the Web of Science?

# <codecell>

stsdf.WC.value_counts()

# <markdowncell>

# # Who are the main authors in the two literatures, and who publishes in both literatures?
# 
# Given its multi-disciplinary span, I don't expect the imaginaries literature to have any major authors, but there might be some key figures worth looking at. It has **3900** unique authors.
# 
# The STS literature is much more coherent. It only has **2700** unique authors. Much more co-authorship appears here too.

# <codecell>

im_au = ca.author_list(imdf)
im_au_unique = set(im_au)
print('Number of authors in imaginaries literature: '+ str(len(im_au)))
print('Number of unique authors in imaginaries literature: '+ str(len(im_au_unique)))
im_au_counts = {au:im_au.count(au) for au in im_au_unique}
print(sorted(im_au_counts.iteritems(), key = operator.itemgetter(1), reverse=True)[0:20])
print('\n\n')
sts_au = ca.author_list(stsdf)
sts_au_unique = set(sts_au)
print('Number of authors in sts literature: '+ str(len(sts_au)))
print('Number of unique authors in sts literature: '+ str(len(sts_au_unique)))
sts_au_counts = {au:sts_au.count(au) for au in sts_au_unique}
print(sorted(sts_au_counts.iteritems(), key = operator.itemgetter(1), reverse=True)[0:20])

# <markdowncell>

# The intersection between the author lists in both literatures is quite small. Only **52** authors publish in both:

# <codecell>

# overlap between author list

intersect = im_au_unique.intersection(sts_au_unique)
print(str(len(intersect)) + ' authors appear in both literatures')
print(intersect)

# <markdowncell>

# ## Cited references in the imaginaries literature
# 
# The aim here is to see:
# 
# 1. what references are cited?
# 2. what references are cited most often?
# 
# The references cited give some idea of what the imaginaries literature is drawing on, and how it relates to different social science and humanities fields.

# <markdowncell>

# ### What references are cited in the imaginaries literature?

# <codecell>

cited_refs = imdf.cited_refs.tolist()

cited_refs_full  =[r for ret in imdf.cited_refs for r in ret]

# the unique set of cited refs
cited_ref_set={r for ret in imdf.cited_refs for r in ret}
print('There are ' + str(len(cited_ref_set)) + ' unique references cited')

# <codecell>

	# DON'T RUN THIS UNLESS NECESSARY - it takes ages
    #to see what is cited most -- this takes a couple of minutes, so I'm saving it
ref_counts ={ref:cited_refs_full.count(ref) for ref in cited_ref_set}
pickle.dump(ref_counts, file=open('imref_counts.pyd', 'w'))

# <codecell>

	# to look at range of values, easier in a series
imref_counts = pickle.load( file=open('imref_counts.pyd', 'r'))
ref_counts_s=pd.Series(imref_counts.values(), index = imref_counts.keys())
ref_counts_s = ref_counts_s.dropna().order(ascending=False)
print('There are ' + str(sum(ref_counts_s >1)) + ' references cited more than once')

# <markdowncell>

# ### Who is cited most in the imaginaries literature?
# 
# Looking at the citation counts, the most cited authors are pretty much expected - Anderson, Appadurai, Butler, Said, etc. They are 'big names' in general in the humanites and social sceince. Some of the most cited come from the 'imaginary' world: Anderson, Taylor, Castoriadis, Gaonkar, Lacan, etc.  There are a few sts figures here too: Latour and Haraway. I will explore their presence below. 

# <codecell>

print(ref_counts_s[ref_counts_s>10][1:50])

# <markdowncell>

# ## For the STS literature
# 
# Now ask the same questions of the STS literature
# 
# 
#    1. what references are cited?
#    2.  what references are cited most often?

# <markdowncell>

# ### What is cited in the STS literature?

# <codecell>

stscited_refs = stsdf.cited_refs.tolist()

stscited_refs_full  =[r for ret in stscited_refs for r in ret]

# the unique set of cited refs
stscited_ref_set={r for ret in stscited_refs for r in ret}
print('There are ' + str(len(stscited_ref_set)) + ' unique references cited in the STS literature')

# <codecell>

	##DO NOT RUN UNLESS NECESSARY - takes a while. Go straight to next cell
    #to see what is cited most -- this takes a couple of minutes, so I'm saving it - only run occasionally
stsref_counts ={ref:stscited_refs_full.count(ref) for ref in stscited_ref_set}
pickle.dump(stsref_counts, file=open('stsref_counts.pyd', 'w'))

# <codecell>

	# to look at range of values, easier in a series
stsref_counts = pickle.load( file=open('stsref_counts.pyd', 'r'))
stsref_counts_s=pd.Series(stsref_counts.values(), index = stsref_counts.keys())
stsref_counts_s = stsref_counts_s.dropna().order(ascending=False)
print('There are ' + str(sum(stsref_counts_s >1)) + ' references cited more than once')

# <markdowncell>

# ### Who is cited most in the STS literature?
# 
# As the table below shows, the most cited authors in STS are much more clearly STS. This is a pretty inward focused literature, with only a few outsiders showing up -- Beck, and perhaps Garfinkel.  No Butlers or Appadurai's in the A-list citations. Actually, judging by this analysis, the field of STS should be called 'Latour studies.'
# 
# In other ways, the STS literature is broader. Although imaginaries cites 88000 references and STS 76000,which is roughly commensurate, STS cites **11388** or so  references more than once whereas the imaginaries literature only cites **4300**. This is despite the fact that they are roughly the same size. This suggests that STS actually draws on a wider span of publications than the imaginaries literature. 
# 
# More importantly, the citation counts are massively higher in the STS literature. (Collins 2002) is higher than Appadurai in the imaginaries literature. Despite the breadth of its cited literature, STS is a much more focused literature. It cites the same references more often.

# <codecell>

print(pd.DataFrame(stsref_counts_s[stsref_counts_s>10]).head(50))

# <markdowncell>

# ## The intersection between the STS and the imaginaries literature
# 
# A couple of questions here:
# 
# 1. What is intersection between the most-cited references in STS and imaginaries?
# 2. How does STS literature cite the imaginaries literature?
# 3. How is the STS literature present in the imaginaries literature?

# <markdowncell>

# ### Who do they both cite? The intersection between STS and imaginaries in terms of who they both cite ('co-citation')
# 
# The overlap in the cited references is around **2500** references. 

# <codecell>

print(str(len(cited_ref_set.intersection(stscited_ref_set))) + ' references are found in the cited references in both literatures')

# <markdowncell>

# Here is the list of references that are common to both -- too long to look at properly. It'd be good to sort them by order of importance -- e.g. how often they are cited.

# <codecell>

stsim_cocit = sorted(list(cited_ref_set.intersection(stscited_ref_set)))
stsim_cocit[100:120]

# <markdowncell>

# Given this is too long to look at, we might be able to get a rough idea by counting the surnames -- this is rough, but gives an idea of where the overlap lies:

# <codecell>


author_refs = [ref.split(' ')[0] for ref in stsim_cocit]
author_refs_set = set(author_refs)
au_counts = {au:author_refs.count(au)  for au in author_refs_set}
sts_im_cited_intersection = sorted(au_counts.iteritems(), key=operator.itemgetter(1), reverse=True)

print('There are ' + str(len(sts_im_cited_intersection)) + ' references co-cited between the imaginaries and STS literature\n\n')
print(pd.DataFrame(sts_im_cited_intersection[0:100],columns=['author', 'count']).head(30))

# <markdowncell>

#  
# 
# There are **1497** references co-cited by the imaginaries and STS literature. Again, this is somewhat rough because it is just using surnames. These references could be grouped in different ways, but a couple of features standout. 
# 
# -  The philosophy intersection -- Foucault, Derrida, Marx, Deleuze, Wittgenstein, Heidegger, Baumann, Benjamin, Zizek, Butler
# -  The sociology intersection -- Bourdieu, Goffman, Beck, Williams, Castells, Merton, Weber, Baudrillard, Luhmann, Boltanski
# -  The political theory intersection -- Habermas, Laclau, Mouffe, Taylor, Dean
# -  The STSish intersections -- Latour, Law, Callon, Jasanoff, Wynne, Rheinberger, Mackenzie, Suchman, Pickering, Woolgar, Barry, Bijker, Collins
# -  The feminist intersection -- Butler, Haraway
# -  The anthropology intersection -- Strathern, Rabinow, Franklin, Appadurai,Comaroff, Geertz, Lock
# -  The historian/philospher of science intersection -- Kuhn, Hacking, Porter, Young, Daston
# -  The media/cultural studies intersection -- Hall, Williams, Haraway, Keller
# 

# <markdowncell>

# ### How is the STS literature included in the imaginaries literature?
# 
# This question can be answered a couple of different ways:
# 
# - the STS literature is a part of the imaginaries literature, but only a small part judged by journal articles. Of the 3500 imaginaries publications, only a dozen or so appear in STS journals.

# <codecell>

# query for journal SOC STUD SCI, SCI TECHNOL HUM VAL, SCIENCE CULTURE in the imaginaries dataset
sss = 'SOC STUD SCI|Social Studies of Science'
sthv = 'SCI TECHNOL HUM VAL|SCIENCE TECHNOLOGY & HUMAN VALUES'
sac = 'SCIENCE AS CULTURE'
patn = re.compile('|'.join([sss, sthv, sac]), re.IGNORECASE)

journals = imdf.SO.tolist()

l=[i.group() for i in [patn.search(str(s)) for s in journals] if i is not None]
print(str(len(l)) + ' STS journal articles appear in the imaginaries literature')

# <markdowncell>

# - How does the imaginaries literature cite authors who 'belong' to sts? There are around 2500 STS authors in the STS literature. How are they cited amidst the 88000 references cited in the imaginaries literature?

# <codecell>

# set of unique sts authors
stsau = list(ca.author_list(stsdf, True))

#take out commas
stsau_pattern= ['('+au.replace(',', '')+')' for au in stsau]

# regular expressions can only deal with 100 at a time, so break pattern into chunks
au_patterns = [re.compile('|'.join(stsau_pattern[i:i+99])) for i in xrange(0, len(stsau_pattern), 99)]

# <codecell>

# search for all sts literature authors in the cited references of the imaginaries literature
# this search takes a while as it is searching for how often 2500 authors appear in the 88000 cited references
res_full=[au_pattern.search(ref)  for ref in cited_refs_full for au_pattern in au_patterns]

# <codecell>

# count how often they appear in the cited refs for imaginaries literature
sts_authors_cited = sorted([r.group() for  r in res_full if r is not None and len(r.group())>1])
# load pickle below to save time

# <codecell>

# has been pickled to save time 
# if rerunning, need to pickle again, etc.
#pickle.dump(sts_authors_cited, file=open(name='sts_cited_authors_cited.pyd', mode='wb'))
sts_authors_cited = pickle.load(file=open('sts_cited_authors_cited.pyd', mode='rb'))

# <codecell>

print('There are ' + str(len(sts_authors_cited)) + ' references to STS authors in the imaginaries literature')

# <markdowncell>

# The author names need to be cleaned up for duplicates,etc, but it is fairly clear that the imaginaries literature cites the STS literature along similar lines fairly heavily. Some of the authors in the STS literature are not particularly STSish (e.g. Sherry Turkle or Mary Douglas or Douglas Kellner).  
# 
# More importantly, it is fairly clear that only a **relatively small proportion** of the STS literature enters into the imaginaries literature. The total STS references amount to **2500** of the 88000, and the number of authors who actually get cited more than a few times account for the vast majority of citations of STS literature in the imaginaries literature (1800 out of 2500) is quite small -- around **150** authors.
# 

# <codecell>

sts_authors_cited_counts = {au:sts_authors_cited.count(au) for au in set(sts_authors_cited)}
sorted_sts_cited_authors = sorted(sts_authors_cited_counts.iteritems(), key=operator.itemgetter(1), reverse=True)

print(str(len(sorted_sts_cited_authors)) + ' STS authors are cited in the imaginaries literature')
print(str(len([a for a in sorted_sts_cited_authors if a[1]>=5])) + ' of these are cited 5 or more times')
print(str(sum([cited[1] for cited in sorted_sts_cited_authors if cited[1] >=5])) + ' of the 2500 references from STS come this latter group')
print('\n\n')

print(pd.DataFrame(sorted_sts_cited_authors[0:30], columns=['author', 'count']).head(30))

# <markdowncell>

# These authors are not the quite the same authors who appeared in the intersection between the imaginaries and STS citations. Here we are looking at how often people publishing in STS journals are cited in imaginaries literature. Some of the names are the same -- Latour, Law, Mackenzie, Wynne -- but many of the top names in the intersection between the cited references do not appear here -- Haraway, Foucault, Strathern -- mainly because they have never published in STS journals. 
# 
# There are also names here -- Marc Berg, Emily Martin -- that didn't appear in the imaginaries-STS intersection at all. These are cases where STS work is being taken into the wider imaginaries literature.

# <markdowncell>

# ### How does the STS literature cite the imaginaries literature?
# 
# This is a key question. To get a rough idea, look for which of the 3868 imaginaries authors are cited in the 76000 references cited in sts literature.

# <codecell>

# set of unique sts authors
imau = list(ca.author_list(imdf, True))

#take out commas
imau_pattern= ['('+au.replace(',', '')+')' for au in imau]

# regular expressions can only deal with 100 at a time, so break pattern into chunks

imau_patterns = [re.compile('|'.join(imau_pattern[i:i+99])) for i in xrange(0, len(imau_pattern), 99)]
print('There are ' + str(len(imau)) + ' unique authors in imaginaries literature')

# <codecell>

imres_full=[imau_pattern.search(ref)  for ref in stscited_refs_full for imau_pattern in imau_patterns]

# <markdowncell>

# Here is the list of imaginary authors cited in the sts literature. Some of them are STS people, since STS authors have contributed to the imaginaries literature, especially when they published outside the major STS journals.

# <codecell>


print(set(sorted([r.group() for  r in imres_full if r is not None and len(r.group())>1])))

# <markdowncell>

# Breaking this down a bit further,  if the STS literature cites around 7500 unique references, roughly 350 of these come from the imaginaries literature authors. Amongst this group, roughly 100 imaginaries authors account for most of the references from the STS literature. Judging from the list below, some of the key references are authors who overlap between STS and other fields. 

# <codecell>

im_authors_cited = sorted([r.group() for  r in imres_full if r is not None and len(r.group())>1])

print('There are ' + str(len(im_authors_cited)) + ' references to imaginary authors in the STS literature')
im_authors_cited_counts = {au:im_authors_cited.count(au) for au in set(im_authors_cited)}
sorted_im_cited_authors = sorted(im_authors_cited_counts.iteritems(), key=operator.itemgetter(1), reverse=True)
im_au_total = len(im_authors_cited)
print(str(len(sorted_im_cited_authors)) + ' individual imaginary authors are cited in the STS literature')
print(str(len([a for a in sorted_im_cited_authors if a[1]>=5])) + ' of these are cited 5 or more times')
print(str(sum([cited[1] for cited in sorted_im_cited_authors if cited[1] >=5])) + ' of the ' + str(im_au_total) + ' references from STS come this latter group')
print('\n')

print(sorted_im_cited_authors[0:30])

# <markdowncell>

# ## What references are co-cited?
# 
# So far, we have been looking at how the imaginaries literature is present in the STS literature, and vice versa. We have looked at this by looking for STS authors in the cited references, and in the 
# 
# Co-cited means that the same reference can be found cited in two 'different' publications. The fact that  two publications both cite the same reference suggests that have some relation. 
# Here I looked at the cited references for all the imaginaries publications, and ask for all the intersections between cited references. The bigger the intersection between the reference lists, the more substantial is the relationship. Perhaps.

# <codecell>

im_co = ca.co_citation(imdf)
sts_co = ca.co_citation(stsdf)

# <codecell>

print(str(len(im_co))+' co-citation sets exist in the imaginaries literature')
print(str(len(sts_co))+' co-citation sets exist in the STS literature')

# <markdowncell>

# Again, the high co-citation count in STS literature shows that it is much more inwardly related than the imaginaries literature. The STS literature has roughly **five** times the number of co-citation sets as the imaginaries literature. 

# <codecell>

# only run this if repeating the analysis somehow

pickle.dump(im_co, open('im_co_cit.pyd', 'w'))
pickle.dump(sts_co, open('sts_co_cit.pyd', 'w'))

# <codecell>

# to see size of co-citation sets in sts
sts_co = pickle.load(open('sts_co_cit.pyd', 'r'))
im_co = pickle.load(open('im_co_cit.pyd', 'r'))                     
#sorted([sts_co.count(set) for set in sts_co[0:2000]], reverse=True)[0:30]

# <codecell>

sts_co_set_lengths = sorted([len(s) for s in sts_co], reverse=True)
im_co_set_lengths = sorted([len(s) for s in im_co], reverse=True)

# <codecell>

print('Size of co-cited reference sets in STS literature:', sts_co_set_lengths[0:100:2])
print('Size of co-cited reference sets in imaginaries literature:', im_co_set_lengths[0:100:2])

# <markdowncell>

# Not sure what to make of this, but again, the much greater number of co-citations, and the higher co-citation counts in the STS literature suggest that it is much more internally related than the imaginaries literature. 

