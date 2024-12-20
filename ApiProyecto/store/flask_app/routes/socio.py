from flask import Blueprint, jsonify, request
from db import get_db_connection

socio_routes = Blueprint('socio', __name__)

# CREATE: Agregar un nuevo socio
@socio_routes.route('/', methods=['POST'])
def create_socio():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios)
            VALUES (%s, %s, %s, %s, %s)
        ''', (data['id_socio'], data['dni'], data['nombre'], data['apellidos'], data['datos_bancarios']))
        conn.commit()
        return jsonify({"message": "Socio creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el socio: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# READ: Obtener todos los socios
@socio_routes.route('/', methods=['GET'])
def get_all_socios():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM SOCIO ORDER BY id_socio;')
        socios = cur.fetchall()
        socios_list = [
            {
                "id_socio": s[0],
                "dni": s[1],
                "nombre": s[2],
                "apellidos": s[3],
                "datos_bancarios": s[4],
            } for s in socios
        ]
        return jsonify(socios_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los socios: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# READ: Obtener un socio por su ID
@socio_routes.route('/<int:id_socio>', methods=['GET'])
def get_socio_by_id(id_socio):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM SOCIO WHERE id_socio = %s;', (id_socio,))
        socio = cur.fetchone()
        if socio is None:
            return jsonify({"error": "Socio no encontrado"}), 404
        socio_data = {
            "id_socio": socio[0],
            "dni": socio[1],
            "nombre": socio[2],
            "apellidos": socio[3],
            "datos_bancarios": socio[4],
        }
        return jsonify(socio_data), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el socio: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# UPDATE: Actualizar los datos de un socio
@socio_routes.route('/<int:id_socio>', methods=['PUT'])
def update_socio(id_socio):
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
            UPDATE SOCIO
            SET {', '.join(update_fields)}
            WHERE id_socio = %s
        '''
        values.append(id_socio)

        cur.execute(update_query, values)
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Socio no encontrado"}), 404

        return jsonify({"message": "Socio actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el socio: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# DELETE: Eliminar un socio
@socio_routes.route('/<int:id_socio>', methods=['DELETE'])
def delete_socio(id_socio):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('DELETE FROM SOCIO WHERE id_socio = %s;', (id_socio,))
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Socio no encontrado"}), 404

        return jsonify({"message": "Socio eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el socio: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()