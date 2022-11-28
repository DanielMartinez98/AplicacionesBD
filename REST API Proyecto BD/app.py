from flask import Flask
from flask_cors import CORS, cross_origin

app = Flask(__name__)
CORS(app)

# --- MySQL configurations ---
# pip install pymysql
# pip install flask-mysql
# pip install werkzeug