import pymysql
from app import app
from db import mysql
from flask import jsonify, request, flash
from werkzeug.security import generate_password_hash, check_password_hash

# GET http://ip:5000/
@app.route('/', methods=['GET'])
def index():
	return '<h3> API REST BD</h3> '

# GET http://ip:5000/test
@app.route('/test')
def test():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor) # returns results as dictionary
	try:
		cursor.execute("SELECT * FROM Clases;")
		rows = cursor.fetchall()
		# resp = jsonify(rows)
		# resp.status_code = 200
		value = rows[0]["nombre"]
		return value
	except Exception as e:
		print(e)
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/crearClase
@app.route('/crearClase', methods=['POST'])
def crearClase():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idEstudiante = _json['idEstudiante']
		_nombreClase = _json['nombreClase']
		_telefonos = _json['telefonos']
		params = [_idEstudiante,_nombreClase]

		cursor.callproc('crearClase', params,)
		rows = cursor.fetchall()
		newClassID = int(rows[0]["newClassID"])
		conn.commit()
		
		for telefono in _telefonos:
			params = [newClassID,telefono]
			cursor.callproc('agregarWhatsapp',params,)
		conn.commit()

		response = {"newClassID":newClassID}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/selectTareas
@app.route('/selectTareas', methods=['POST'])
def selectTareas():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idEstudiante = _json['idEstudiante']
		params = [_idEstudiante]
		cursor.callproc('selectTareas', params,)
		rows = cursor.fetchall()
		resp = jsonify(rows)
		resp.status_code = 200
		return resp
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/selectClases
@app.route('/selectClases', methods=['POST'])
def selectClases():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idEstudiante = _json['idEstudiante']
		params = [_idEstudiante]
		cursor.callproc('selectClases', params,)
		rows = cursor.fetchall()
		resp = jsonify(rows)
		resp.status_code = 200
		return resp
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/userLogin
@app.route('/userLogin', methods=['POST'])
def userLogin():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_emailEstudiante = _json['emailEstudiante']
		_passwordEstudiante = _json['passwordEstudiante']
		params = [_emailEstudiante, _passwordEstudiante]
		cursor.callproc('userLogin', params,)
		rows = cursor.fetchall()
		value = rows[0]["id_estudiante"]
		if value > -1:
			response = {"Response":value}
		else:
			response = {"Response":"Usuario y/o Contraseña incorrectos"}
		resp = jsonify(response)
		resp.status_code = 200
		return resp
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/crearClaseEstudiante
@app.route('/crearClaseEstudiante', methods=['POST'])
def crearClaseEstudiante():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idEstudiante = _json['idEstudiante']
		_in_idClase = _json['in_idClase']
		params = [_idEstudiante, _in_idClase]
		cursor.callproc('crearClaseEstudiante', params,)
		rows = cursor.fetchall()
		conn.commit()
		value = rows[0]["response"]
		if value == "Joined Class":
			response = {"Response":value}
		else:
			response = {"Response":"No existe clase"}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/cambiarPassword
@app.route('/cambiarPassword', methods=['POST'])
def cambiarPassword():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idEstudiante = _json['idEstudiante']
		_passwordVieja = _json['passwordVieja']
		_passwordNueva = _json['passwordNueva']
		params = [_idEstudiante, _passwordVieja, _passwordNueva]
		cursor.callproc('cambiarPassword', params,)
		rows = cursor.fetchall()
		conn.commit()
		value = rows[0]["response"]
		if value == "Password Changed":
			response = {"Response":value}
		else:
			response = {"Response":value}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/crearEstudiante
@app.route('/crearEstudiante', methods=['POST'])
def crearEstudiante():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_nombre = _json['nombre']
		_apellidoPaterno = _json['apellidoPaterno']
		_apellidoMaterno = _json['apellidoMaterno']
		_mail = _json['mail']
		_telefono = _json['telefono']
		_password = _json['password']
		_whatsapp = _json['whatsapp']
		params = [_nombre, _apellidoPaterno, _apellidoMaterno, _mail, _telefono, _password, _whatsapp]
		cursor.callproc('crearEstudiante', params,)
		rows = cursor.fetchall()
		conn.commit()
		value = rows[0]["response"]
		if value == "Email already registered":
			response = {"Response":value}
		else:
			response = {"Response":value}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/modificarClaseAgregar
@app.route('/modificarClaseAgregar', methods=['POST'])
def modificarClaseAgregar():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idClase = _json['idClase']
		_telefono = _json['telefono']
		params = [_idClase, _telefono]
		cursor.callproc('agregarWhatsapp', params,)
		conn.commit()
		response = {"Response":"Agregado"}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/modificarClaseBorrar
@app.route('/modificarClaseBorrar', methods=['POST'])
def modificarClaseBorrar():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idClase = _json['idClase']
		_telefono = _json['telefono']
		params = [_idClase, _telefono]
		cursor.callproc('borrarWhatsapp', params,)
		conn.commit()
		response = {"Response":"Borrado"}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/modificarCuenta
@app.route('/modificarCuenta', methods=['POST'])
def modificarCuenta():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idEstudiante = _json['idEstudiante']
		_nombre = _json['nombre']
		_apellidoPaterno = _json['apellidoPaterno']
		_apellidoMaterno = _json['apellidoMaterno']
		_mail = _json['mail']
		_telefono = _json['telefono']
		_password = _json['password']
		_whatsapp = _json['whatsapp']
		params = [_idEstudiante, _nombre, _apellidoPaterno, _apellidoMaterno, _mail, _telefono, _password, _whatsapp]
		cursor.callproc('modificarCuenta', params,)
		rows = cursor.fetchall()
		conn.commit()
		response = {"Response":"Modificado"}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/borrarClase
@app.route('/borrarClase', methods=['POST'])
def borrarClase():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idClase = _json['idClase']
		params = [_idClase]
		cursor.callproc('borrarClase', params,)
		rows = cursor.fetchall()
		conn.commit()
		value = rows[0]["response"]
		if value == "Clase borrada":
			response = {"Response":value}
		else:
			response = {"Response":value}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/modificarStatusTarea
@app.route('/modificarStatusTarea', methods=['POST'])
def modificarStatusTarea():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idEstudiante = _json['idEstudiante']
		_idTarea = _json['idTarea']
		_isComplete = _json['isComplete']
		params = [_idEstudiante, _idTarea, _isComplete]
		cursor.callproc('modificarStatusTarea', params,)
		rows = cursor.fetchall()
		conn.commit()
		value = rows[0]["estatus"]
		response = {"Response":value}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/modificarTarea
@app.route('/modificarTarea', methods=['POST'])
def modificarTarea():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idTarea = _json['idTarea']
		_nombre = _json['nombre']
		_fecha = _json['fecha']
		_descripcion = _json['descripcion']
		params = [_idTarea, _nombre, _fecha, _descripcion ]
		cursor.callproc('modificarTarea', params,)
		rows = cursor.fetchall()
		conn.commit()
		value = rows[0]["estatus"]
		response = {"Response":value}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

# GET http://ip:5000/CambiarAdministradorEstudiante
@app.route('/CambiarAdministradorEstudiante', methods=['POST'])
def CambiarAdministradorEstudiante():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idClase = _json['idClase']
		_telefono = _json['telefono']
		_administrador = _json['administrador']
		params = [_idClase, _telefono, _administrador]
		cursor.callproc('CambiarAdministradorEstudiante', params,)
		rows = cursor.fetchall()
		conn.commit()
		value = rows[0]["response"]
		response = {"Response":value}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '

# GET http://ip:5000/agregarTarea
@app.route('/agregarTarea', methods=['POST'])
def agregarTarea():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_nombreTarea = _json['nombreTarea']
		_fecha = _json['fecha']
		_descripcion = _json['descripcion']
		_idClase = _json['idClase']
		params = [_nombreTarea, _fecha, _descripcion, _idClase]
		cursor.callproc('agregarTarea', params,)
		rows = cursor.fetchall()
		conn.commit()

		for row in rows:
			_idEstudiante = row["id_estudiante"]
			_idTarea = row["idTarea"]
			params = [_idEstudiante,_idTarea]
			cursor.callproc("agregarEstudianteTarea",params,)
		conn.commit()
		response = {"Response":"Listo"}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '


	# GET http://ip:5000/borrarTarea
@app.route('/borrarTarea', methods=['POST'])
def borrarTarea():
	conn = mysql.connect()
	cursor = conn.cursor(pymysql.cursors.DictCursor)
	try:
		_json = request.json
		_idTarea = _json['idTarea']
		params = [_idTarea]
		cursor.callproc('borrarTarea', params,)
		conn.commit()
		response = {"Response":"Tareas borradas"}
		response = jsonify(response)
		response.status_code = 200
		return response
	except Exception as e:
		return f'<h3> ERROR PAPU: {e} </h3> '
		
	finally:
		cursor.close() 
		conn.close()

if __name__ == "__main__":
    app.run()

