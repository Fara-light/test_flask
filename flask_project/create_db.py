import sqlite3
import subprocess


conn = sqlite3.connect('taxi.db')


conn.execute('PRAGMA foreign_keys = ON')


with open('create_db.sql', 'r') as script:
    sql_script = script.read()


conn.executescript(sql_script)


conn.commit()
conn.close()    


conn.close()
