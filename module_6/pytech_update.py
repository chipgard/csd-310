#   Chip Gardiner
#   Assignment 6.2
#   pytech_update
#   


from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.kxbhc.mongodb.net/pytech?retryWrites=true&w=majority"
client = MongoClient(url)

db = client.pytech 

students = db.students

student_list = students.find({})

thorin = students.find_one({"student_id": "1007"})

for doc in student_list:
    print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")

result = students.update_one({"student_id": "1007"}, {"$set": {"last_name": "Oakenfold"}})

print("\n  -- DISPLAYING STUDENT DOCUMENT " + thorin["student_id"] + "--")

print("  Student ID: " + thorin["student_id"] + "\n  First Name: " + thorin["first_name"] + "\n  Last Name: " + thorin["last_name"] + "\n")


input("\n\n  End of program, press any key to continue...")