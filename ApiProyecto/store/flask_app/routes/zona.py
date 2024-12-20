from flask import Blueprint, jsonify, request
from db import get_db_connection

zona_routes = Blueprint('zona', __name__)

# Crear una nueva zona dentro de un local
@zona_routes.route('/', methods=['POST'])
def create_zona(id_local):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo)
            VALUES (%s, %s, %s, %s, %s, %s)
        ''', (data['id_zona'], id_local, data['provincia'], data['ciudad'], data['calle'], data['tipo']))
        conn.commit()
        return jsonify({"message": "Zona creada exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear la zona: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Leer todas las zonas de un local
@zona_routes.route('/', methods=['GET'])
def get_all_zonas(id_local):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM ZONA WHERE id_local = %s', (id_local,))
        zonas = cur.fetchall()
        return jsonify([{
            "id_zona": zona[0],
            "id_local": zona[1],
            "provincia": zona[2],
            "ciudad": zona[3],
            "calle": zona[4],
            "tipo": zona[5]
        } for zona in zonas]), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener las zonas: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Leer una zona por el id_zona dentro de un local
@zona_routes.route('/<int:id_zona>', methods=['GET'])
def get_zona(id_local, id_zona):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM ZONA WHERE id_local = %s AND id_zona = %s', (id_local, id_zona))
        zona = cur.fetchone()
        if not zona:
            return jsonify({"error": "Zona no encontrada"}), 404
        return jsonify({
            "id_zona": zona[0],
            "id_local": zona[1],
            "provincia": zona[2],
            "ciudad": zona[3],
            "calle": zona[4],
            "tipo": zona[5]
        }), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener la zona: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Actualizar una zona dentro de un local
@zona_routes.route('/<int:id_zona>', methods=['PUT'])
def update_zona(id_local, id_zona):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()

        # Obtener datos actuales
        cur.execute('SELECT id_local, provincia, ciudad, calle, tipo FROM ZONA WHERE id_local = %s AND id_zona = %s', (id_local, id_zona))
        zona = cur.fetchone()
        if not zona:
            return jsonify({"error": "Zona no encontrada"}), 404

        provincia = data.get('provincia', zona[2])
        ciudad = data.get('ciudad', zona[3])
        calle = data.get('calle', zona[4])
        tipo = data.get('tipo', zona[5])

        cur.execute('''
            UPDATE ZONA
            SET provincia = %s, ciudad = %s, calle = %s, tipo = %s
            WHERE id_local = %s AND id_zona = %s
        ''', (provincia, ciudad, calle, tipo, id_local, id_zona))
        conn.commit()
        return jsonify({"message": "Zona actualizada exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar la zona: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Eliminar una zona dentro de un local
@zona_routes.route('/<int:id_zona>', methods=['DELETE'])
def delete_zona(id_local, id_zona):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('DELETE FROM ZONA WHERE id_local = %s AND id_zona = %s', (id_local, id_zona))
        conn.commit()
        return jsonify({"message": "Zona eliminada exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar la zona: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            
# Obtener las entradas en la tabla TRABAJA para una zona específica            
@zona_routes.route('/<int:id_zona>/trabaja/', methods=['GET'])
def get_trabajos_by_zona(id_local, id_zona):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT t.*
            FROM TRABAJA t
            INNER JOIN LOCAL l ON t.id_local = l.id_local
            INNER JOIN ZONA z ON t.id_zona = z.id_zona
            WHERE t.id_zona = %s
        ''', (id_zona,))
        trabajos = cur.fetchall()
        
        if not trabajos:
            return jsonify({"error": "No se encontraron registros de trabajo en esta zona"}), 404
        
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
            for t in trabajos
        ]
        
        return jsonify(trabaja_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los registros de trabajo: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
