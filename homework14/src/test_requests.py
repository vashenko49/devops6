import requests

BASE_URL = 'http://127.0.0.1:8080/students'

def get_all_students():
    response = requests.get(BASE_URL)
    print("GET All Students:", response.json())

def create_student(first_name, last_name, age):
    response = requests.post(BASE_URL, json={"first_name": first_name, "last_name": last_name, "age": age})
    print("POST Create Student:", response.json())

def get_student_by_id(student_id):
    response = requests.get(f"{BASE_URL}/{student_id}")
    print("GET Student by ID:", response.json())

def update_student_age(student_id, age):
    response = requests.patch(f"{BASE_URL}/{student_id}/age", json={"age": age})
    print("PATCH Update Age:", response.json())

def update_student(student_id, first_name, last_name, age):
    response = requests.put(f"{BASE_URL}/{student_id}", json={"first_name": first_name, "last_name": last_name, "age": age})
    print("PUT Update Student:", response.json())

def delete_student(student_id):
    response = requests.delete(f"{BASE_URL}/{student_id}")
    print("DELETE Student:", response.json())

if __name__ == '__main__':
    get_all_students()
    create_student("Alice", "Smith", 20)
    create_student("Bob", "Johnson", 22)
    create_student("Charlie", "Brown", 25)
    get_all_students()
    update_student_age(2, 23)
    get_student_by_id(2)
    update_student(3, "Charlie", "Green", 26)
    get_student_by_id(3)
    get_all_students()
    delete_student(1)
    get_all_students()
