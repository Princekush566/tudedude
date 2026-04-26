from flask import Flask, jsonify, render_template, request, redirect, url_for
import json
from pymongo import MongoClient

app = Flask(__name__)

# MongoDB Atlas connection
client = MongoClient("mongodb+srv://princekushwaha11111_db_user:sRJkjQiKC7L1xlZO@cluster0.nxo7ne1.mongodb.net/testdb")
db = client["testdb"]
collection = db["users"]

# API route
@app.route('/api')
def get_data():
    with open('data.json') as f:
        data = json.load(f)
    return jsonify(data)

# Form page
@app.route('/')
def form():
    return render_template('form.html')

# Form submit
@app.route('/submit', methods=['POST'])
def submit():
    try:
        data = {
            "name": request.form['name'],
            "email": request.form['email']
        }
        collection.insert_one(data)
        return redirect(url_for('success'))
    except Exception as e:
        return f"Error: {str(e)}"

# Success page
@app.route('/success')
def success():
    return render_template('success.html')

if __name__ == '__main__':
    app.run(debug=True)