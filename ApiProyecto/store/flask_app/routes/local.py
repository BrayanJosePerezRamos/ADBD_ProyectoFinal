from flask import Blueprint, jsonify, request
from db import get_db_connection

local_routes = Blueprint('local', __name__)

# CREATE: Agregar un nuevo local
@local_routes.route('/', methods=['POST'])
def create_local():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) 
            VALUES (%s, %s, %s, %s, %s)
        ''', (data['id_local'], data['provincia'], data['ciudad'], data['calle'], data['nombre']))
        conn.commit()
        return jsonify({"message": "Local creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el local: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# READ: Obtener todos los locales
@local_routes.route('/', methods=['GET'])
def get_all_locales():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM LOCAL ORDER BY id_local;')
        locales = cur.fetchall()
        locales_list = [
            {
                "id_local": l[0],
                "provincia": l[1],
                "ciudad": l[2],
                "calle": l[3],
                "nombre": l[4],
            }
            for l in locales
        ]
        return jsonify(locales_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los locales: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# READ: Obtener un local por su ID
@local_routes.route('/<int:id_local>', methods=['GET'])
def get_local_by_id(id_local):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM LOCAL WHERE id_local = %s;', (id_local,))
        local = cur.fetchone()
        if local is None:
            return jsonify({"error": "Local no encontrado"}), 404
        local_data = {
            "id_local": local[0],
            "provincia": local[1],
            "ciudad": local[2],
            "calle": local[3],
            "nombre": local[4],
        }
        return jsonify(local_data), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el local: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@local_routes.route('/<int:id_local>', methods=['PUT'])
def update_local(id_local):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()

        # Recuperar los datos actuales del local
        cur.execute('SELECT provincia, ciudad, calle, nombre FROM LOCAL WHERE id_local = %s;', (id_local,))
        local = cur.fetchone()
        if not local:
            return jsonify({"error": "Local no encontrado"}), 404

        # Actualizar solo los campos enviados en el cuerpo
        provincia = data.get('provincia', local[0])
        ciudad = data.get('ciudad', local[1])
        calle = data.get('calle', local[2])
        nombre = data.get('nombre', local[3])

        cur.execute('''
            UPDATE LOCAL 
            SET provincia = %s, ciudad = %s, calle = %s, nombre = %s
            WHERE id_local = %s
        ''', (provincia, ciudad, calle, nombre, id_local))
        conn.commit()
        return jsonify({"message": "Local actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el local: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()


# DELETE: Eliminar un local
@local_routes.route('/<int:id_local>', methods=['DELETE'])
def delete_local(id_local):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('DELETE FROM LOCAL WHERE id_local = %s;', (id_local,))
        conn.commit()
        if cur.rowcount == 0:
            return jsonify({"error": "Local no encontrado"}), 404
        return jsonify({"message": "Local eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el local: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# #---------------------------------------------Zona------------------------------------------------
# # CREATE: Agregar una nueva zona
# @local_routes.route('/int:id_local/zona', methods=['POST'])
# def create_zona(id_local):
#     data = request.json
#     try:
#         conn = get_db_connection()
#         cur = conn.cursor()
#         cur.execute('''
#             INSERT INTO ZONA (id_local, id_zona, provincia, ciudad, calle, tipo) 
#             VALUES (%s, %s, %s, %s, %s, %s)
#         ''', (id_local, data['id_zona'], data['provincia'], data['ciudad'], data['calle'], data['tipo']))
#         conn.commit()
#         return jsonify({"message": "Zona creada exitosamente"}), 201
#     except Exception as e:
#         return jsonify({"error": f"Error al crear la zona: {str(e)}"}), 500
#     finally:
#         if 'cur' in locals():
#             cur.close()
#         if 'conn' in locals():
#             conn.close()
            
# # READ: Obtener todas las zonas de un local
# @local_routes.route('/<int:id_local>/zona', methods=['GET'])
# def get_all_zonas(id_local):
#     try:
#         conn = get_db_connection()
#         cur = conn.cursor()
#         cur.execute('SELECT * FROM ZONA WHERE id_local = %s ORDER BY id_zona;', (id_local,))
#         zonas = cur.fetchall()
#         zonas_list = [
#             {
#                 "id_local": z[0],
#                 "id_zona": z[1],
#                 "provincia": z[2],
#                 "ciudad": z[3],
#                 "calle": z[4],
#                 "tipo": z[5],
#             }
#             for z in zonas
#         ]
#         return jsonify(zonas_list), 200
#     except Exception as e:
#         return jsonify({"error": f"Error al obtener las zonas: {str(e)}"}), 500
#     finally:
#         if 'cur' in locals():
#             cur.close()
#         if 'conn' in locals():
#             conn.close()
            
# # READ: Obtener una zona por su ID
# @local_routes.route('/<int:id_local>/zona/<int:id_zona>', methods=['GET'])
# def get_zona_by_id(id_local, id_zona):
#     try:
#         conn = get_db_connection()
#         cur = conn.cursor()
#         cur.execute('SELECT * FROM ZONA WHERE id_local = %s AND id_zona = %s;', (id_local, id_zona))
#         zona = cur.fetchone()
#         if zona is None:
#             return jsonify({"error": "Zona no encontrada"}), 404
#         zona_data = {
#             "id_local": zona[0],
#             "id_zona": zona[1],
#             "provincia": zona[2],
#             "ciudad": zona[3],
#             "calle": zona[4],
#             "tipo": zona[5],
#         }
#         return jsonify(zona_data), 200
#     except Exception as e:
#         return jsonify({"error": f"Error al obtener la zona: {str(e)}"}), 500
#     finally:
#         if 'cur' in locals():
#             cur.close()
#         if 'conn' in locals():
#             conn.close()
            
# # UPDATE: Actualizar una zona