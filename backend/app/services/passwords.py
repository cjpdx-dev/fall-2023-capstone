import bcrypt

def hash_password(password):
    print("Called passwords.hash_password")
    return bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

def check_password(password, hashed_password):
    print("Called passwords.check_password")
    return  bcrypt.checkpw(password.encode('utf-8'), hashed_password)
