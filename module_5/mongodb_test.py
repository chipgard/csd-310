# Chip Gardiner 
# Assignment 5.2 
# Pytech : Collection Creation 
#

from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.kxbhc.mongodb.net/pytech?retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech 

print ("--Pytech C0llection List--")
print(db.list_collection_names())

input("\n\n  End of program, press any key to continue...")
