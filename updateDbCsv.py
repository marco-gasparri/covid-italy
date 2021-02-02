import csv
import mysql.connector
import git
from subprocess import call, STDOUT
import os

#Config params (to be set)
dbHost = ''
dbUser = ''
dbPass = ''
dbName = 'covid19'
repoPath = ''
repoVaccPath = ''

#insert csv data into the related table using csv field names to identify table column names and building the queries
def updateDbFromCsv(repoBasePath, csvRelativePath, cursor, tableName, lastColumnsToIgnore):
    csv_data = csv.reader(open(repoBasePath + csvRelativePath), delimiter=',')
    headerRead = False
    rowSize = 0
    placeHolderString = ""
    columnNamesString = ""
    for row in csv_data:
        nullifyEmptyValues(row)
        if headerRead:
            #for toPop in range(rowSize, rowSize + lastColumnsToIgnore):
            #    row.pop(toPop)
            query = "INSERT INTO " + tableName + " (" + columnNamesString + ") VALUES (" + placeHolderString + ")"
            cursor.execute (query, tuple(row))
        else:
            rowSize = len(row)
            rowSize -= lastColumnsToIgnore
            for labelIdx in range(rowSize):
                label = row[labelIdx]
                if(label == 'long'):
                    label = '`long`'
                columnNamesString += label
                placeHolderString += "%s"
                if(labelIdx < rowSize - 1):
                    columnNamesString += ","
                    placeHolderString += ","
        headerRead = True

def nullifyEmptyValues(row):
    for i in range(len(row)):
        if row[i] == '':
            row[i] = None

def main():
    #pull repo
    print("Pulling repositories...")
    g = git.cmd.Git(repoPath)
    g.pull()
    g = git.cmd.Git(repoVaccPath)
    g.pull()
    print("Repositories updated.")

    #connect to mysql
    mydb = mysql.connector.connect(user=dbUser, password=dbPass, host=dbHost, database=dbName)
    cursor = mydb.cursor()

    #truncate tables
    print("Tables truncation...")
    cursor.execute("TRUNCATE TABLE nazionale")
    cursor.execute("TRUNCATE TABLE regioni")
    cursor.execute("TRUNCATE TABLE province")
    cursor.execute("TRUNCATE TABLE somministrazioni_summary")
    cursor.execute("TRUNCATE TABLE somministrazioni")
    cursor.execute("TRUNCATE TABLE somministrazioni_fasce")
    print("Tables truncated.")

    #import csvs
    print("CSV import from DPC repo...")
    updateDbFromCsv(repoPath, "/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv", cursor, "nazionale", 0)
    updateDbFromCsv(repoPath, "/dati-province/dpc-covid19-ita-province.csv", cursor, "province", 0)
    updateDbFromCsv(repoPath, "/dati-regioni/dpc-covid19-ita-regioni.csv", cursor, "regioni", 0)
    print("CSV imported from DPC repo.")

    print("CSV import from vaccines repo...")
    cursor.execute("LOAD DATA LOCAL INFILE '" + repoVaccPath + "/dati/vaccini-summary-latest.csv' INTO TABLE somministrazioni_summary FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (area,dosi_somministrate,dosi_consegnate,percentuale_somministrazione,ultimo_aggiornamento)");
    cursor.execute("LOAD DATA LOCAL INFILE '" + repoVaccPath + "/dati/somministrazioni-vaccini-summary-latest.csv' INTO TABLE somministrazioni FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (data_somministrazione,area,totale,sesso_maschile,sesso_femminile,categoria_operatori_sanitari_sociosanitari,categoria_personale_non_sanitario,categoria_ospiti_rsa,categoria_over80,prima_dose,seconda_dose)");
    cursor.execute("LOAD DATA LOCAL INFILE '" + repoVaccPath + "/dati/somministrazioni-vaccini-latest.csv' INTO TABLE somministrazioni_fasce FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (data_somministrazione,fornitore,area,fascia_anagrafica,sesso_maschile,sesso_femminile,categoria_operatori_sanitari_sociosanitari,categoria_personale_non_sanitario,categoria_ospiti_rsa,categoria_over80,prima_dose,seconda_dose)");
    print("CSV imported from vaccines repo.")

    print("Executing last tasks...")
    cursor.execute("CALL tempo_raddoppio(1)")
    cursor.execute("CALL update_immunizzati()")
    print("Last tasks completed.")

    print("Cleanup...")
    #close the connection with the database.
    mydb.commit()
    cursor.close()
    mydb.close()
    print ("Done.")

if __name__ == "__main__":
    main()
