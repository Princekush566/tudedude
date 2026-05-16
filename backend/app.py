from flask import Flask, request, jsonify
import json
from pymongo import MongoClient

app = Flask(__name__)

# MongoDB Atlas connection
client = MongoClient("mongodb+srv://princekushwaha11111_db_user:sRJkjQiKC7L1xlZO@cluster0.nxo7ne1.mongodb.net/testdb")
db = client["testdb"]
collection = db["users"]

# Home Route
@app.route('/')
def home():
    return "Backend Updated Successfully 🚀🔥"

# API Route
@app.route('/api')
def get_data():
    with open('data.json') as f:
        data = json.load(f)
    return jsonify(data)

# Submit Route
@app.route('/submittodoitem', methods=['POST'])
def submit():
    try:
        data = request.json
        print("Received:", data)

        result = collection.insert_one(data)

        print("Inserted ID:", result.inserted_id)

        return "Backend Updated via Jenkins CI/CD 🚀"

    except Exception as e:
        print("ERROR:", e)
        return f"Error: {str(e)}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)