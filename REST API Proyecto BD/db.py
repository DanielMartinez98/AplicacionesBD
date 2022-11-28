from app import app
from flaskext.mysql import MySQL

mysql = MySQL()
 
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'usuario'
app.config['MYSQL_DATABASE_PASSWORD'] = '666'
app.config['MYSQL_DATABASE_DB'] = 'proyectoAgendaDB'
mysql.init_app(app)

# --- MySQL configurations --- #

# pip install pymysql (cursor to return results as dictionary)
    # https://pymysql.readthedocs.io/en/latest/user/examples.html

# pip install flask-mysql (allows you to connect to access MySQL database)
    # https://flask-mysql.readthedocs.io/en/stable/
    # https://stackoverflow.com/questions/9845102/using-mysql-in-flask
    # https://hevodata.com/learn/flask-mysql/
    
# pip install werkzeug (hash passwords)