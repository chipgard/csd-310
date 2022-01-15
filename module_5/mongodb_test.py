# Chip Gardiner 
# Assignment 5.2 
# Pytech : Collection Creation 
#

from pymongo import MongoClient

url = 'mongodb+srv://admin:admin@cluster0.kxbhc.mongodb.net/pytech?authSource=admin&replicaSet=atlas-pe44p8-shard-0&readPreference=primary&ssl=true'
client = MongoClient(url)
db = client.pytech 

print ("--Pytech C0llection List--")
print(db.list_collection_names(session=None, filter=None ))

exit

