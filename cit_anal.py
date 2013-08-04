# %load_ext autoreload
# %autoreload 2


import pandas as pd
import re
import os
import matplotlib
import pickle
import datetime

def load_records(dir):
	"""Return dataframe of all records, with new column of cited references as list"""

	# I saved all the WoS full records for 'imaginar*' for all social science and humanities
	files =os.listdir(dir)
	imdf =pd.concat([pd.read_table(df, sep='\t',index_col = False) for df in [dir+f for f in files]])
	imdf = imdf.drop_duplicates()

	#fix index
	index = range(0, imdf.shape[0])
	imdf.index = index

	#to get all cited refs
	cited_refs = [set(re.split(pattern='; ', string=str(ref).lower().lstrip().rstrip())) for ref in imdf.CR]

	# add as column to dataframe
	imdf['cited_refs'] = cited_refs

	# normalise authors
	imdf.au = [str(au).lower().lstrip().rstrip() for au in imdf.AF]

	return imdf

def co_citation(imdf):
	#to flatten refs
	cited_refs = imdf.cited_refs.tolist()

	#to see what is co-cited -- cited refs that appear in more than one document
	co_cit =[refs1.intersection(refs2) for refs1 in cited_refs for refs2 in cited_refs if not refs1.isdisjoint(refs2) and  refs1 != refs2]
	return co_cit

# constructs a normalised version of the reference list

def normalise_ref(surname, first, year, title ):
	return ','.join([surname, first, year, title]).lower()

def author_list(imdf, unique=False):

	""" Uses the AF field  to create a list of individual authors

	Parameters
	-----------------------
	unique: the unique list if True
	"""

	au = sorted([str(s).lower().lstrip().rstrip() for s in imdf.AF])
	# to split them up
	au = [a.split('; ' ) for a in au]
	# replace first names with initials
	# flatten the list
	au = [a for al in au for a in al]

	if unique:
		return set(au)
	else:
		return au

def publication_dates(imdf):
	
	""" Takes the publication period and year
	 Returns dataframe with new column of publication_date
	 as datetimes
	"""

	# the year
	imdf.PY.replace('Sociology', 2012, inplace=True)
	imdf.PY.replace('Religion', 2012, inplace=True)
	py = imdf.PY
	#the month
	pm = imdf.PD.fillna(method='pad')
	pm=pm.str.replace('WIN', 'NOV')
	pm=pm.str.replace('SUM', 'JUL')
	pm=pm.str.replace('AUT', 'SEP')
	pm=pm.str.replace('FAL', 'SEP')
	pm=pm.str.replace('SPR', 'MAR')

	#clean up month
	pm = pm.str.replace('(\\w{3})(-?.+)', '\g<1>')
	pm = pm.str.replace('\\d+', 'MAY')

	ym = ['-'.join(['1', str(m), str(y)]) for (m,y) in zip(pm,py)]
	dt=[datetime.datetime.strptime(d, '%d-%b-%Y') for d in ym]
	imdf['publication_date'] = dt
	return imdf

def publication_timeseries(imdf):
	""" Converts publication dates to a time series
	that can be plotted
	"""
	# daterange =pd.date_range('1/1/1960', '1/7/2013', freq='M')
	if 'publication_date' not in imdf.keys():
	 	imdf = publication_dates(imdf)
	ts = imdf.publication_date.value_counts()
	ts = ts.sort_index()
	return ts

def field_normalise(imdf):
	field = [str(s).split('; ')[0].lower().lstrip().rstrip() for s in imdf.WC]
	imdf['field'] = field
	return imdf

def fields_over_time(imdf):
	""" Returns new dataframe with fields as columns and years as index
	"""
	tsf=imdf.groupby(['field'])['PY'].value_counts()
	tsf = tsf.sort_index()
	fields_df = tsf.unstack(level=0)
	index = range(imdf.PY.min(), int(imdf.PY.max())+1)
	fields_df = fields_df.reindex(index)
	fields_df = fields.fillna(0)
	return fields_df

# To plot the fields with less columns:
# cols = [col for col in fields_df.columns if fields_df[col].sum()>10]
# fields_df[cols].cumsum().plot(alpha=0.6, legend=True)
# fields.plot(kind='bar',legend=True, stacked=True)


