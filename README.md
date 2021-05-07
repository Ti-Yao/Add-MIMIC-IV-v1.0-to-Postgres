# Add-MIMIC-IV-v1.0-to-Postgres. This code might require tweaking for other versions of MIMIC. This code is adapted from https://mimic.physionet.org/tutorials/

###  0 Prepare
1. Get permission for MIMIC-IV and download the repository to your computer. https://physionet.org/content/mimiciv/1.0/ (the data will contain three folders called "hosp", "icu" and "core")
2. Unzip all the .csv.gz files in each of the three folders using gzip (Linux) or 7zip (windows)
3. Download the scripts from this repository
4. This code requires the use of terminal which is available for Linux/Mac OS. Windows users can use MobaXTerm https://mobaxterm.mobatek.net/download.html

#### 0.2 Install Postgres
* sudo apt-get install postgresql (Linux)
* brew install postgres (Mac OS)
* http://www.postgresql.org/download/ (Any Operating System incl Windows)

#### 0.3 Create a user, database and schema 
In terminal:
createuser -P -s -e -d mimicuser
psql -U mimicuser -d mimiciv
\c mimiciv
CREATE SCHEMA mimiciv;
\q

### 3 Create tables in postgres
In terminal:
