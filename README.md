# Add-MIMIC-IV-v1.0-to-Postgres. This code might require tweaking for other versions of MIMIC. 
This code is adapted from https://mimic.physionet.org/tutorials/

You will need terminal which is available for Linux/Mac OS. Windows users can use [MobaXTerm](https://mobaxterm.mobatek.net/download.html)

#### 1 Download database and SQL scripts
1. Get permission for MIMIC-IV and download the repository to your computer. https://physionet.org/content/mimiciv/1.0/ (the data will contain three folders called "hosp", "icu" and "core")
2. Unzip all the .csv.gz files in each of the three folders using gzip (Linux) or 7zip (windows)
3. Download the scripts from this repository and place in the same folder containing the three MIMICIV data folders.

###### Figure showing the folder containing all the MIMIC-IV data and SQL scripts
![image](https://user-images.githubusercontent.com/74569724/117433430-5f266500-af23-11eb-90bf-81aed2d46361.png)


#### 2 Install Postgres
* sudo apt-get install postgresql (Linux)
* brew install postgres (Mac OS)
* http://www.postgresql.org/download/ (Any Operating System incl Windows)

#### 3 Create a user, database and schema in Postgres
In terminal:
```
createuser -P -s -e -d mimicuser
psql -U mimicuser -d mimiciv
\c mimiciv
CREATE SCHEMA mimiciv;
\q
```

#### 4 Load data into postgres
In terminal:
```
cd /folder/containing/data/and/scripts
psql 'dbname=mimiciv user=mimicuser options=--search_path=mimiciv' -f create_tables.sql     # create tables 
psql 'dbname=mimiciv user=mimicuser options=--search_path=mimiciv' -f load_data.sql         # load MIMIC data into tables
psql 'dbname=mimiciv user=mimicuser options=--search_path=mimiciv' -f add_indexes.sql       # add indexes to table, makes querying faster(optional but recommended)
psql 'dbname=mimiciv user=mimicuser options=--search_path=mimiciv' -f postgres_check.sql    # check that all the data has been loaded in (optional but recommended)
```
