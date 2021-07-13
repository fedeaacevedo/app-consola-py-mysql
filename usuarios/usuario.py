import mysql.connector
import datetime

database = mysql.connector.connect(
    host="localhost",
    user = "root",
    password = '',
    database= "master_python_1",
    port=3306
)

cursor = database.cursor(buffered=True)

class Usuario:

    def __init__(self, nombre, apellidos, email, password):
        self.nombre = nombre
        self.apellido = apellidos
        self.email = email
        self.password = password


    def registrar(self):
        fecha = datetime.datetime.now()

        sql = "INSERT INTO usuarios VALUES(NULL, %s, %s, %s, %s, %s)"
        usuario = (self.nombre, self.apellido, self.email, self.password, fecha)

        try:
            cursor.execute(sql, usuario)
            database.commit()
            result = [cursor.rowcount, self]
        except:
            result = [0, self]

        return result 

    def identificar(self):
        return self.nombre        