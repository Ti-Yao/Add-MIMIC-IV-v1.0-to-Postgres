# Add MIMIC-IV v1.0 to Postgres
This code is adapted from https://mimic.physionet.org/tutorials/

#### 0 Checklist
* Request permission to use MIMIC https://mimic.physionet.org/gettingstarted/access/ . If you have MIMIC-III permission you will automatically have MIMIC-IV permission
* You will need terminal which is available for Linux/Mac OS. Windows users can use [MobaXTerm](https://mobaxterm.mobatek.net/download.html)

#### 1 Download database and SQL scripts
1. Download the MIMIC repository to your computer. https://physionet.org/content/mimiciv/1.0/ (the data will contain three folders called "hosp", "icu" and "core")
2. Unzip all the .csv.gz files in each of the three folders using gzip (Linux) or 7zip (windows)
3. Download the scripts from this repository and place in the same folder containing the three MIMICIV data folders.

###### Figure showing the folder containing all the MIMIC-IV data and SQL scripts
![image](https://user-images.githubusercontent.com/74569724/117433430-5f266500-af23-11eb-90bf-81aed2d46361.png)


#### 2 Install Postgres
```
sudo apt-get install postgresql # (Linux)
brew install postgres           # (Mac OS)
```
or http://www.postgresql.org/download/ (Any Operating System incl Windows)

#### 3 Create a user, database and schema in Postgres

```
sudo -u postgres psql # enter into postgres

# in postgres pay attention to the semicolons!
ALTER USER postgres PASSWORD 'myPassword'; # create password
#ALTER ROLE
CREATE DATABASE mimiciv; # create database called mimiciv
#CREATE DATABASE
\c mimiciv # connect to database
#you are now connected to database "mimiciv" as user "postgres"
CREATE SCHEMA mimiciv; 
# CREATE SCHEMA
\q # quit
```

#### 4 Load data into postgres
```
cd /folder/containing/data/and/scripts
psql -U postgres -h 127.0.0.1 -f create_tables.sql 'dbname=mimiciv options=--search_path=mimiciv password = myPassword'      # create tables 
psql -U postgres -h 127.0.0.1  -f load_data.sql 'dbname=mimiciv options=--search_path=mimiciv password = myPassword'         # load MIMIC data into tables. This may take a while
psql -U postgres -h 127.0.0.1 -f add_indexes.sql 'dbname=mimiciv options=--search_path=mimiciv password = myPassword'        # add indexes to table, makes querying faster(optional but recommended)  
psql -U postgres -h 127.0.0.1 -f postgres_check.sql 'dbname=mimiciv options=--search_path=mimiciv password = myPassword'     # check that all the data has been loaded in (optional but recommended) 
```
Done!

#### Next Steps
* You can download a GUI to query the data such as [pgAdmin](https://www.pgadmin.org/download/) for Linux/Windows or [Postico](https://eggerapps.at/postico/) for Mac
* Or you can connect to your postgres server using Python through [psycopg2](https://pypi.org/project/psycopg2/)
