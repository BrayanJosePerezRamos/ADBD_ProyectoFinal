from flask import Blueprint, jsonify, request
from db import get_db_connection
import datetime


libre_routes = Blueprint('libre', __name__)

# Crear nuevo registro en LIBRE
@libre_routes.route('/', methods=['POST'])
def create_libre():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO LIBRE (id_empleado, fecha_inicio, fecha_final, motivo, baja)
            VALUES (%s, %s, %s, %s, %s)
        ''', (data['id_empleado'], data['fecha_inicio'], data['fecha_final'], data['motivo'], data['baja']))
        conn.commit()

        return jsonify({"message": "Registro de libre creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el registro de libre: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Leer todos los registros de LIBRE
@libre_routes.route('/', methods=['GET'])
def get_libres():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_empleado, fecha_inicio, fecha_final, motivo, baja
            FROM LIBRE
        ''')
        libres = cur.fetchall()

        if not libres:
            return jsonify({"error": "No se encontraron registros de libre"}), 404

        libres_list = [
            {
                "id_empleado": libre[0],
                "fecha_inicio": libre[1],
                "fecha_final": libre[2],
                "motivo": libre[3],
                "baja": libre[4]
            }
            for libre in libres
        ]

        return jsonify(libres_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los registros de libre: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            
# Leer un registro de LIBRE por id_empleado
@libre_routes.route('/<int:id_empleado>', methods=['GET'])
def get_libre_by_id_empleado(id_empleado):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_empleado, fecha_inicio, fecha_final, motivo, baja
            FROM LIBRE
            WHERE id_empleado = %s
        ''', (id_empleado,))
        libre = cur.fetchone()

        if not libre:
            return jsonify({"error": "Registro de libre no encontrado"}), 404

        return jsonify({
            "id_empleado": libre[0],
            "fecha_inicio": libre[1],
            "fecha_final": libre[2],
            "motivo": libre[3],
            "baja": libre[4]
        }), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el registro de libre: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()


# # Leer un registro de LIBRE por fecha de inicio
# @libre_routes.route('/<date:fecha_inicio>', methods=['GET'])
# def get_libre_by_fecha_inicio(fecha_inicio):
#     try:
#         conn = get_db_connection()
#         cur = conn.cursor()
#         cur.execute('''
#             SELECT id_empleado, fecha_inicio, fecha_final, motivo, baja
#             FROM LIBRE
#             WHERE fecha_inicio = %s
#         ''', (fecha_inicio,))
#         libre = cur.fetchone()

#         if not libre:
#             return jsonify({"error": "Registro de libre no encontrado"}), 404

#         return jsonify({
#             "id_empleado": libre[0],
#             "fecha_inicio": libre[1],
#             "fecha_final": libre[2],
#             "motivo": libre[3],
#             "baja": libre[4]
#         }), 200
#     except Exception as e:
#         return jsonify({"error": f"Error al obtener el registro de libre: {str(e)}"}), 500
#     finally:
#         if 'cur' in locals():
#             cur.close()
#         if 'conn' in locals():
#             conn.close()

# Leer un registro de LIBRE por motivo
@libre_routes.route('/<string:motivo>', methods=['GET'])
def get_libre_by_motivo(motivo):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_empleado, fecha_inicio, fecha_final, motivo, baja
            FROM LIBRE
            WHERE motivo = %s
        ''', (motivo,))
        libre = cur.fetchone()

        if not libre:
            return jsonify({"error": "Registro de libre no encontrado"}), 404

        return jsonify({
            "id_empleado": libre[0],
            "fecha_inicio": libre[1],
            "fecha_final": libre[2],
            "motivo": libre[3],
            "baja": libre[4]
        }), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el registro de libre: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
        
# # Leer un registro de LIBRE por baja (True/False)
# @libre_routes.route('/<bool:baja>', methods=['GET'])
# def get_libre_by_baja(baja):
#     try:
#         conn = get_db_connection()
#         cur = conn.cursor()
#         cur.execute('''
#             SELECT id_empleado, fecha_inicio, fecha_final, motivo, baja
#             FROM LIBRE
#             WHERE baja = %s
#         ''', (baja,))
#         libre = cur.fetchone()

#         if not libre:
#             return jsonify({"error": "Registro de libre no encontrado"}), 404

#         return jsonify({
#             "id_empleado": libre[0],
#             "fecha_inicio": libre[1],
#             "fecha_final": libre[2],
#             "motivo": libre[3],
#             "baja": libre[4]
#         }), 200
#     except Exception as e:
#         return jsonify({"error": f"Error al obtener el registro de libre: {str(e)}"}), 500
#     finally:
#         if 'cur' in locals():
#             cur.close()
#         if 'conn' in locals():
#             conn.close()
            
@libre_routes.route('/<int:id_empleado>', methods=['PUT'])
def update_libre(id_empleado):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()

        # Crear una lista con los valores a actualizar, solo si hay datos
        updates = []
        if 'fecha_inicio' in data:
            updates.append("fecha_inicio = %s")
        if 'fecha_final' in data:
            updates.append("fecha_final = %s")
        if 'motivo' in data:
            updates.append("motivo = %s")
        if 'baja' in data:
            updates.append("baja = %s")

        if not updates:
            return jsonify({"error": "No se proporcionaron datos para actualizar"}), 400

        # Join the update parts and execute the query
        set_clause = ", ".join(updates)
        cur.execute(f'''
            UPDATE LIBRE
            SET {set_clause}
            WHERE id_empleado = %s
        ''', tuple(data.get(field) for field in data if field in ['fecha_inicio', 'fecha_final', 'motivo', 'baja']) + (id_empleado,))

        conn.commit()

        return jsonify({"message": "Registro de libre actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el registro de libre: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
                        
# Eliminar un registro de LIBRE por id_empleado
@libre_routes.route('/<int:id_empleado>', methods=['DELETE'])
def delete_libre(id_empleado):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('DELETE FROM LIBRE WHERE id_empleado = %s', (id_empleado,))
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Registro de libre no encontrado"}), 404

        return jsonify({"message": "Registro de libre eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el registro de libre: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()