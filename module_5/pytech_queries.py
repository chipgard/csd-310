#   Chip Gardiner
#   Assignment 5.2
#   pytech_queries
#   


from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.kxbhc.mongodb.net/pytech?retryWrites=true&w=majority"
client = MongoClient(url)

db = client.pytech 

students = db.students

student_list = students.find({})


print("\n  -- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")


for doc in student_list:
    print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")


frodo = students.find_one({"student_id": "1009"})


print("\n  -- DISPLAYING STUDENT DOCUMENT FROM find_one() QUERY --")
print("  Student ID: " + frodo["student_id"] + "\n  First Name: " + frodo["first_name"] + "\n  Last Name: " + frodo["last_name"] + "\n")


input("\n\n  End of program, press any key to continue...")