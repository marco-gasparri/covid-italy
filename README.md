# covid-italy
Some templates to setup a covid-19 data analysis and visualization environment using Grafana (based on the data provided by Protezione Civile https://github.com/pcm-dpc/COVID-19, and https://github.com/italia/covid19-opendata-vaccini for vaccines)

![Example screenshot](screen.png)

## Environment requirements

 - MySQL Server: https://www.mysql.com/
 - Grafana: https://grafana.com/
 - Worldmap Panel plugin for Grafana: https://grafana.com/grafana/plugins/grafana-worldmap-panel
 - Git: https://git-scm.com/
 - Python3: https://www.python.org/
 - Python libraries:
     - mysql-connector: `python3 -m pip install mysql-connector`
     - GitPython: `python3 -m pip install GitPython`

## Setup
- Install MySQL Server and Grafana
- Import the database structure `dbCovid19.sql` into MySQL
- Modify and configure the `updateDbCsv.py` script:
    - `dbHost`: database host
    - `dbUser`: database user
    - `dbPass`: database password
    - `dbName`: database name
    - `repoPath`: path where the data repository about the pandemic will be cloned (or pull, if already existing)
    - `repoVaccPath`: path where the data repository about vaccines will be cloned (or pull, if already existing)
- Run the `updateDbCsv.py` script to fetch the data and populate db (this script should be run at least once a day to update the db with the latest data provided)
- Import `covid19ItalyGrafanaTemplate.json` into Grafana (configuring Grafana to use the created db as data source)

Now you are able to visualize the already developed graphs and you are provided with the data and the infrastructure to perform your own analysis.

Public dashboard: https://www.covid-italy.marcogasparri.com/ (2022-08-23 update: the site will be dismissed soon. It will be eventually re-activated if required by pandemic conditions)
	
