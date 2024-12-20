from flask import Blueprint, jsonify, request
from db import get_db_connection

empleado_pedido_routes = Blueprint('empleado_pedido', __name__)

@empleado_pedido_routes.route('/', methods=['POST'])
def create_pedido_for_empleado(id_empleado):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO PEDIDO (id_pedido, id_empleado, id_socio, fecha, importe_total)
            VALUES (%s, %s, %s, %s, %s)
        ''', (data['id_pedido'], id_empleado, data['id_socio'], data['fecha'], data['importe_total']))
        conn.commit()
        return jsonify({"message": "Pedido creado exitosamente para el empleado"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@empleado_pedido_routes.route('/', methods=['GET'])
def get_pedidos_for_empleado(id_empleado):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM PEDIDO WHERE id_empleado = %s ORDER BY fecha DESC', (id_empleado,))
        pedidos = cur.fetchall()
        pedidos_list = [
            {
                "id_pedido": p[0],
                "id_empleado": p[1],
                "id_socio": p[2],
                "fecha": p[3].strftime('%Y-%m-%d'),
                "importe_total": float(p[4]),
            }
            for p in pedidos
        ]
        return jsonify(pedidos_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los pedidos del empleado: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@empleado_pedido_routes.route('/<int:id_pedido>', methods=['GET'])
def get_pedido_by_id_for_empleado(id_empleado, id_pedido):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM PEDIDO WHERE id_empleado = %s AND id_pedido = %s', (id_empleado, id_pedido))
        pedido = cur.fetchone()
        if not pedido:
            return jsonify({"error": "Pedido no encontrado para este empleado"}), 404

        pedido_data = {
            "id_pedido": pedido[0],
            "id_empleado": pedido[1],
            "id_socio": pedido[2],
            "fecha": pedido[3].strftime('%Y-%m-%d'),
            "importe_total": float(pedido[4]),
        }
        return jsonify(pedido_data), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@empleado_pedido_routes.route('/<int:id_pedido>', methods=['PUT'])
def update_pedido_for_empleado(id_empleado, id_pedido):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        
        # Construir la consulta dinámicamente para permitir actualizaciones parciales
        fields = []
        values = []
        for key, value in data.items():
            fields.append(f"{key} = %s")
            values.append(value)
        values.extend([id_empleado, id_pedido])
        
        query = f'''
            UPDATE PEDIDO 
            SET {', '.join(fields)} 
            WHERE id_empleado = %s AND id_pedido = %s
        '''
        cur.execute(query, tuple(values))
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Pedido no encontrado para este empleado"}), 404
        
        return jsonify({"message": "Pedido actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@empleado_pedido_routes.route('/<int:id_pedido>', methods=['DELETE'])
def delete_pedido_for_empleado(id_empleado, id_pedido):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('DELETE FROM PEDIDO WHERE id_empleado = %s AND id_pedido = %s', (id_empleado, id_pedido))
        conn.commit()
        
        if cur.rowcount == 0:
            return jsonify({"error": "Pedido no encontrado para este empleado"}), 404

        return jsonify({"message": "Pedido eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
