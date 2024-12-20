from flask import Blueprint, jsonify, request
from db import get_db_connection

trabaja_routes = Blueprint('trabaja', __name__)

@trabaja_routes.route('/', methods=['POST'])
def create_trabaja():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO TRABAJA (
                id_empleado, id_local, id_zona, provincia, ciudad, calle,
                fecha_inicio, fecha_final, horario
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s::TIME[])
        ''', (
            data['id_empleado'], data['id_local'], data['id_zona'],
            data['provincia'], data['ciudad'], data['calle'],
            data['fecha_inicio'], data.get('fecha_final'),
            data['horario']
        ))
        conn.commit()
        return jsonify({"message": "Registro de trabajo creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el registro de trabajo: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()



@trabaja_routes.route('/', methods=['GET'])
def get_all_trabaja_empleado():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM TRABAJA')
        trabaja = cur.fetchall()
        trabaja_list = [
            {
                "id_empleado": t[0],
                "id_local": t[1],
                "id_zona": t[2],
                "provincia": t[3],
                "ciudad": t[4],
                "calle": t[5],
                "fecha_inicio": t[6].strftime('%Y-%m-%d'),
                "fecha_final": t[7].strftime('%Y-%m-%d') if t[7] else None,
                "horario": [h.strftime('%H:%M:%S') for h in t[8]],  # Conversión de TIME a cadena
            }
            for t in trabaja
        ]

        return jsonify(trabaja_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los registros de trabajo: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@trabaja_routes.route('/empleado/<int:id_empleado>', methods=['GET'])
def get_trabaja_by_empleado(id_empleado):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM TRABAJA WHERE id_empleado = %s ORDER BY fecha_inicio DESC', (id_empleado,))
        trabaja = cur.fetchall()
        trabaja_list = [
            {
                "id_empleado": t[0],
                "id_local": t[1],
                "id_zona": t[2],
                "provincia": t[3],
                "ciudad": t[4],
                "calle": t[5],
                "fecha_inicio": t[6].strftime('%Y-%m-%d'),
                "fecha_final": t[7].strftime('%Y-%m-%d') if t[7] else None,
                "horario": [h.strftime('%H:%M:%S') for h in t[8]],  # Conversión de TIME a cadena
            }
            for t in trabaja
        ]
        return jsonify(trabaja_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los registros de trabajo del empleado: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# @trabaja_routes.route('/local/', methods=['GET'])
# def get_all_trabaja_local():
#     try:
#         conn = get_db_connection()
#         cur = conn.cursor()
#         cur.execute('SELECT * FROM TRABAJA ORDER BY fecha_inicio DESC')
#         trabaja = cur.fetchall()
#         trabaja_list = [
#             {
#                 "id_empleado": t[0],
#                 "id_local": t[1],
#                 "id_zona": t[2],
#                 "provincia": t[3],
#                 "ciudad": t[4],
#                 "calle": t[5],
#                 "fecha_inicio": t[6].strftime('%Y-%m-%d'),
#                 "fecha_final": t[7].strftime('%Y-%m-%d') if t[7] else None,
#                 "horario": t[8],
#             }
#             for t in trabaja
#         ]
#         return jsonify(trabaja_list), 200
#     except Exception as e:
#         return jsonify({"error": f"Error al obtener los registros de trabajo: {str(e)}"}), 500
#     finally:
#         if 'cur' in locals():
#             cur.close()
#         if 'conn' in locals():
#             conn.close()

@trabaja_routes.route('/local/<int:id_local>', methods=['GET'])
def get_trabaja_by_local(id_local):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM TRABAJA WHERE id_local = %s ORDER BY fecha_inicio DESC', (id_local,))
        trabaja = cur.fetchall()
        trabaja_list = [
            {
                "id_empleado": t[0],
                "id_local": t[1],
                "id_zona": t[2],
                "provincia": t[3],
                "ciudad": t[4],
                "calle": t[5],
                "fecha_inicio": t[6].strftime('%Y-%m-%d'),
                "fecha_final": t[7].strftime('%Y-%m-%d') if t[7] else None,
                "horario": [h.strftime('%H:%M:%S') for h in t[8]],  # Conversión de TIME a cadena
            }
            for t in trabaja
        ]
        return jsonify(trabaja_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los registros de trabajo del local: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@trabaja_routes.route('/empleado/<int:id_empleado>', methods=['PUT'])
def update_trabaja(id_empleado):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        
        fields = []
        values = []
        for key, value in data.items():
            fields.append(f"{key} = %s")
            values.append(value)
        values.append(id_empleado)

        query = f'''
            UPDATE TRABAJA
            SET {', '.join(fields)}
            WHERE id_empleado = %s
        '''
        cur.execute(query, tuple(values))
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Registro de trabajo no encontrado para este empleado"}), 404
        
        return jsonify({"message": "Registro de trabajo actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el registro de trabajo: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@trabaja_routes.route('/empleado/<int:id_empleado>', methods=['DELETE'])
def delete_trabaja(id_empleado):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('DELETE FROM TRABAJA WHERE id_empleado = %s', (id_empleado,))
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Registro de trabajo no encontrado para este empleado"}), 404

        return jsonify({"message": "Registro de trabajo eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el registro de trabajo: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
