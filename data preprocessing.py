#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
import numpy as np

nf=pd.read_csv("Netflix Dataset Latest 2021.csv")

nf.info()

nf=nf.dropna(subset=["IMDB_ID"])
nf

tmdb=pd.read_csv("TMDB Website Movie Database.csv")
tmdb=tmdb.dropna(subset=["IMDB_ID"])
tmdb

tmdb.info()

match=pd.merge(nf, tmdb, on=["IMDB_ID"], how="right")

match

m=match.dropna(subset=["Title"])
m

m.to_csv(r'whole data.csv',index=False)

