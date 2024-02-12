from robot.api.deco import keyword  # Use Python functions as Robot Frameworks keywords
from pymongo import MongoClient

client = MongoClient('mongodb+srv://qa:xperience@cluster0.4ayklir.mongodb.net/?retryWrites=true&w=majority')

db = client['markdb']

@keyword('Remove user from database')
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print('removing user ' + email)

@keyword('Insert user in database')
def insert_user(user):
    # doc = {
    #     'name': name,
    #     'email': email,
    #     'password': password
    # }

    users = db['users']
    users.insert_one(user)
    print('inserting user')
    print(user)