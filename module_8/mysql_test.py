#   Chip Gardiner 
#   Assignment 8.2
#   mysql_test.py 
#   Database Security 
#   

# import statements 
import mysql.connector 
from mysql.connector import errorcode 

# configuration object 
config = {
    "user":"pysports_user",
    "password":"MySQL8IsGreat!",
    "host":"127.0.0.1",
    "database":"pysports",
    "raise_on_warnings": True
}

#connect to database with error catch 

try: 
    db = mysql.connector.connect(**config)
    
    print ("\n Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"], config["database"]))

    input("\n Press any key to contine...")

except mysql.connector.Error as err:

    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("    The supplied username or password are invalid")

    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("     The specified database does not exist")

    else: 
        print(err)

finally:
   # close connection to MySQL  
   db.close()
   
