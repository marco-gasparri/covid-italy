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

#insert csv data into the related table using csv field names to identify table column names and building the queries
def updateDbFromCsv(csvRelativePath, cursor, tableName, lastColumnsToIgnore):
    csv_data = csv.reader(open(repoPath + csvRelativePath), delimiter=',')
    headerRead = False
    rowSize = 0
    placeHolderString = ""
    columnNamesString = ""
    for row in csv_data:
        nullifyEmptyValues(row)
        if headerRead:
            for toPop in range(rowSize, rowSize + lastColumnsToIgnore):
                row.pop(toPop)
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
    if not os.path.isfile(repoPath) or (call(["cd", repoPath, "git", "branch"], stderr=STDOUT, stdout=open(os.devnull, 'w')) != 0):
        print("Cloning repository...")
        git.Git(repoPath).clone("https://github.com/pcm-dpc/COVID-19")
    else:
        print("Pulling repository...")
        g = git.cmd.Git(repoPath)
        g.pull()
    print("Repository updated.")

    #connect to mysql
    mydb = mysql.connector.connect(user=dbUser, password=dbPass, host=dbHost, database=dbName)
    cursor = mydb.cursor()

    #truncate tables
    print("Tables truncation...")
    cursor.execute("TRUNCATE TABLE nazionale")
    cursor.execute("TRUNCATE TABLE regioni")
    cursor.execute("TRUNCATE TABLE province")
    print("Tables truncated.")

    #import csvs
    print("CSV import...")
    updateDbFromCsv("/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv", cursor, "nazionale", 1)
    updateDbFromCsv("/dati-province/dpc-covid19-ita-province.csv", cursor, "province", 1)
    updateDbFromCsv("/dati-regioni/dpc-covid19-ita-regioni.csv", cursor, "regioni", 1)
    print("CSV imported.")

    print("Cleanup...")
    #close the connection with the database.
    mydb.commit()
    cursor.close()
    mydb.close()
    print ("Done.")

if __name__ == "__main__":
    main()