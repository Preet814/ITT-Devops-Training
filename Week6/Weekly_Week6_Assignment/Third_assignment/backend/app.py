from flask import Flask, request
import mysql.connector
import os

app = Flask(__name__)

# Connect to MySQL using env vars
db = mysql.connector.connect(
    host=os.environ.get("DB_HOST"),
    user=os.environ.get("DB_USER"),
    password=os.environ.get("DB_PASSWORD"),
    database=os.environ.get("DB_NAME"),
)

cursor = db.cursor()
cursor.execute(
    """
    CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255),
        email VARCHAR(255)
    )
"""
)
db.commit()


@app.route("/submit", methods=["POST"])
def submit():
    name = request.form.get("name")
    email = request.form.get("email")
    cursor.execute("INSERT INTO users (name, email) VALUES (%s, %s)", (name, email))
    db.commit()
    return "Data inserted successfully", 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
