from flask import Blueprint, jsonify, request
from db import get_db_connection

empleado_routes = Blueprint('empleado', __name__)

# CREATE: Agregar un nuevo empleado
@empleado_routes.route('/', methods=['POST'])
def create_empleado():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO EMPLEADO (id_empleado, dni, nombre, apellidos, datos_bancarios)
            VALUES (%s, %s, %s, %s, %s)
        ''', (data['id_empleado'], data['dni'], data['nombre'], data['apellidos'], data['datos_bancarios']))
        conn.commit()
        return jsonify({"message": "Empleado creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el empleado: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# READ: Obtener todos los empleados
@empleado_routes.route('/', methods=['GET'])
def get_all_empleados():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM EMPLEADO ORDER BY id_empleado;')
        empleados = cur.fetchall()
        empleados_list = [
            {
                "id_empleado": e[0],
                "dni": e[1],
                "nombre": e[2],
                "apellidos": e[3],
                "datos_bancarios": e[4],
            } for e in empleados
        ]
        return jsonify(empleados_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los empleados: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# READ: Obtener un empleado por su ID
@empleado_routes.route('/<int:id_empleado>', methods=['GET'])
def get_empleado_by_id(id_empleado):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM EMPLEADO WHERE id_empleado = %s;', (id_empleado,))
        empleado = cur.fetchone()
        if empleado is None:
            return jsonify({"error": "Empleado no encontrado"}), 404
        empleado_data = {
            "id_empleado": empleado[0],
            "dni": empleado[1],
            "nombre": empleado[2],
            "apellidos": empleado[3],
            "datos_bancarios": empleado[4],
        }
        return jsonify(empleado_data), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el empleado: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# UPDATE: Actualizar los datos de un empleado
@empleado_routes.route('/<int:id_empleado>', methods=['PUT'])
def update_empleado(id_empleado):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()

        # Construir dinámicamente la consulta de actualización
        update_fields = []
        values = []

        for field in ['dni', 'nombre', 'apellidos', 'datos_bancarios']:
            if field in data:
                update_fields.append(f"{field} = %s")
                values.append(data[field])

        if not update_fields:
            return jsonify({"error": "No se proporcionaron campos válidos para actualizar"}), 400

        update_query = f'''
            UPDATE EMPLEADO
            SET {', '.join(update_fields)}
            WHERE id_empleado = %s
        '''
        values.append(id_empleado)

        cur.execute(update_query, values)
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Empleado no encontrado"}), 404

        return jsonify({"message": "Empleado actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el empleado: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# DELETE: Eliminar un empleado
@empleado_routes.route('/<int:id_empleado>', methods=['DELETE'])
def delete_empleado(id_empleado):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('DELETE FROM EMPLEADO WHERE id_empleado = %s;', (id_empleado,))
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Empleado no encontrado"}), 404

        return jsonify({"message": "Empleado eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el empleado: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
