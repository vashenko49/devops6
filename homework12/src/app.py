from flask import Flask, request, jsonify
import csv
import os

app = Flask(__name__)
FILE_NAME = 'students.csv'

def read_students():
    if not os.path.exists(FILE_NAME):
        return []
    with open(FILE_NAME, mode='r') as file:
        reader = csv.DictReader(file)
        return list(reader)

def write_students(students):
    with open(FILE_NAME, mode='w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=['id', 'first_name', 'last_name', 'age'])
        writer.writeheader()
        writer.writerows(students)

def generate_id(students):
    if not students:
        return 1
    return int(students[-1]['id']) + 1

# GET all students
@app.route('/students', methods=['GET'])
def get_all_students():
    students = read_students()
    return jsonify(students)

# GET student by ID
@app.route('/students/<int:student_id>', methods=['GET'])
def get_student_by_id(student_id):
    students = read_students()
    for student in students:
        if int(student['id']) == student_id:
            return jsonify(student)
    return jsonify({"error": "Student not found"}), 404

# GET student by last name
@app.route('/students/lastname/<string:last_name>', methods=['GET'])
def get_student_by_last_name(last_name):
    students = read_students()
    matches = [student for student in students if student['last_name'].lower() == last_name.lower()]
    if not matches:
        return jsonify({"error": "Student not found"}), 404
    return jsonify(matches)

# POST create a new student
@app.route('/students', methods=['POST'])
def create_student():
    data = request.get_json()
    required_fields = {'first_name', 'last_name', 'age'}
    if not data or any(field not in data for field in required_fields):
        return jsonify({"error": "Missing fields"}), 400
    if any(key not in required_fields for key in data):
        return jsonify({"error": "Invalid fields"}), 400

    students = read_students()
    new_student = {
        'id': str(generate_id(students)),
        'first_name': data['first_name'],
        'last_name': data['last_name'],
        'age': data['age']
    }
    students.append(new_student)
    write_students(students)
    return jsonify(new_student), 201

# PUT update a student's information by ID
@app.route('/students/<int:student_id>', methods=['PUT'])
def update_student(student_id):
    data = request.get_json()
    required_fields = {'first_name', 'last_name', 'age'}
    if not data or any(field not in data for field in required_fields):
        return jsonify({"error": "Missing fields"}), 400
    if any(key not in required_fields for key in data):
        return jsonify({"error": "Invalid fields"}), 400

    students = read_students()
    for student in students:
        if int(student['id']) == student_id:
            student.update(data)
            write_students(students)
            return jsonify(student)
    return jsonify({"error": "Student not found"}), 404

# PATCH update a student's age by ID
@app.route('/students/<int:student_id>/age', methods=['PATCH'])
def update_student_age(student_id):
    data = request.get_json()
    if 'age' not in data:
        return jsonify({"error": "Missing age field"}), 400

    students = read_students()
    for student in students:
        if int(student['id']) == student_id:
            student['age'] = data['age']
            write_students(students)
            return jsonify(student)
    return jsonify({"error": "Student not found"}), 404

# DELETE a student by ID
@app.route('/students/<int:student_id>', methods=['DELETE'])
def delete_student(student_id):
    students = read_students()
    updated_students = [student for student in students if int(student['id']) != student_id]
    if len(students) == len(updated_students):
        return jsonify({"error": "Student not found"}), 404
    write_students(updated_students)
    return jsonify({"message": "Student deleted successfully"}), 200

if __name__ == '__main__':
    app.run(debug=True)
