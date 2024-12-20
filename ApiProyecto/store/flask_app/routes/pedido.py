from flask import Blueprint, jsonify, request
from db import get_db_connection

pedido_routes = Blueprint('pedido', __name__)

@pedido_routes.route('/', methods=['POST'])
def create_pedido():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO PEDIDO (id_pedido, id_empleado, id_socio, fecha, importe_total)
            VALUES (%s, %s, %s, %s, %s)
        ''', (data['id_pedido'], data['id_empleado'], data['id_socio'], data['fecha'], data['importe_total']))
        conn.commit()
        return jsonify({"message": "Pedido creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@pedido_routes.route('/', methods=['GET'])
def get_all_pedidos():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM PEDIDO ORDER BY fecha DESC')
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
        return jsonify({"error": f"Error al obtener los pedidos: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@pedido_routes.route('/<int:id_pedido>', methods=['GET'])
def get_pedido_by_id(id_pedido):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM PEDIDO WHERE id_pedido = %s', (id_pedido,))
        pedido = cur.fetchone()
        if not pedido:
            return jsonify({"error": "Pedido no encontrado"}), 404

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

@pedido_routes.route('/<int:id_pedido>', methods=['PUT'])
def update_pedido(id_pedido):
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
        values.append(id_pedido)
        
        query = f"UPDATE PEDIDO SET {', '.join(fields)} WHERE id_pedido = %s"
        cur.execute(query, tuple(values))
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Pedido no encontrado"}), 404
        
        return jsonify({"message": "Pedido actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@pedido_routes.route('/<int:id_pedido>', methods=['DELETE'])
def delete_pedido(id_pedido):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('DELETE FROM PEDIDO WHERE id_pedido = %s', (id_pedido,))
        conn.commit()
        
        if cur.rowcount == 0:
            return jsonify({"error": "Pedido no encontrado"}), 404

        return jsonify({"message": "Pedido eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

#------------------------------------Pedido_Producto------------------------------------
@pedido_routes.route('/<int:id_pedido>/producto/', methods=['POST'])
def add_producto_to_pedido(id_pedido):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO PEDIDO_PRODUCTO (id_producto, id_pedido, unidades)
            VALUES (%s, %s, %s)
        ''', (data['id_producto'], id_pedido, data['unidades']))
        conn.commit()

        return jsonify({"message": "Producto agregado al pedido exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al agregar el producto al pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

#Obtener todos los productos de un pedido
@pedido_routes.route('/<int:id_pedido>/producto', methods=['GET'])
def get_productos_by_pedido(id_pedido):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT pp.id_producto, p.nombre, pp.unidades
            FROM PEDIDO_PRODUCTO pp
            INNER JOIN PRODUCTO p ON pp.id_producto = p.id_producto
            WHERE pp.id_pedido = %s
        ''', (id_pedido,))
        productos = cur.fetchall()

        if not productos:
            return jsonify({"error": "No se encontraron productos en este pedido"}), 404

        productos_list = [
            {
                "id_producto": producto[0],
                "nombre": producto[1],
                "unidades": producto[2]
            }
            for producto in productos
        ]
        
        return jsonify(productos_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los productos del pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            
#Obtener un producto de un pedido por id_producto
@pedido_routes.route('/<int:id_pedido>/producto/<int:id_producto>', methods=['GET'])
def get_producto_by_id_in_pedido(id_pedido, id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT pp.id_producto, p.nombre, pp.unidades
            FROM PEDIDO_PRODUCTO pp
            INNER JOIN PRODUCTO p ON pp.id_producto = p.id_producto
            WHERE pp.id_pedido = %s AND pp.id_producto = %s
        ''', (id_pedido, id_producto))
        producto = cur.fetchone()

        if not producto:
            return jsonify({"error": "Producto no encontrado o no pertenece al pedido"}), 404

        producto_data = {
            "id_producto": producto[0],
            "nombre": producto[1],
            "unidades": producto[2]
        }
        return jsonify(producto_data), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el producto del pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            

#Actualizar las unidades de un producto en un pedido
@pedido_routes.route('/<int:id_pedido>/producto/<int:id_producto>', methods=['PUT'])
def update_producto_unidades_in_pedido(id_pedido, id_producto):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            UPDATE PEDIDO_PRODUCTO
            SET unidades = %s
            WHERE id_pedido = %s AND id_producto = %s
        ''', (data['unidades'], id_pedido, id_producto))
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Producto no encontrado o no pertenece al pedido"}), 404

        return jsonify({"message": "Unidades del producto actualizadas exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar las unidades del producto: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@pedido_routes.route('/<int:id_pedido>/producto/<int:id_producto>', methods=['DELETE'])
def delete_producto_from_pedido(id_pedido, id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            DELETE FROM PEDIDO_PRODUCTO
            WHERE id_pedido = %s AND id_producto = %s
        ''', (id_pedido, id_producto))
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Producto no encontrado o no pertenece al pedido"}), 404

        return jsonify({"message": "Producto eliminado del pedido exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el producto del pedido: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
