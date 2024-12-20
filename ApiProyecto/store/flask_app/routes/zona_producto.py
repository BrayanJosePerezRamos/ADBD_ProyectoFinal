from flask import Blueprint, jsonify, request
from db import get_db_connection

zona_producto_routes = Blueprint('zona_producto', __name__)

@zona_producto_routes.route('/', methods=['POST'])
def create_producto_in_zona(id_local, id_zona):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle)
            VALUES (%s, %s, %s, %s, %s, %s)
        ''', (id_local, id_zona, data['id_producto'], data['provincia'], data['ciudad'], data['calle']))
        conn.commit()
        return jsonify({"message": "Producto agregado a la zona exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al agregar el producto a la zona: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()


@zona_producto_routes.route('/', methods=['GET'])
def get_productos_by_zona(id_local, id_zona):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT p.* FROM PRODUCTO p
            INNER JOIN ZONA_PRODUCTO zp ON p.id_producto = zp.id_producto
            WHERE zp.id_local = %s AND zp.id_zona = %s
        ''', (id_local, id_zona))
        productos = cur.fetchall()
        
        productos_list = [
            {
                "id_producto": p[0],
                "nombre": p[1],
                "tipo": p[2],
                "precio_unidad": float(p[3]),
                "ram": p[4],
                "almacenamiento": p[5],
                "marca": p[6],
                "stock": p[7],
            }
            for p in productos
        ]
        return jsonify(productos_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los productos de la zona: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            
@zona_producto_routes.route('/<int:id_producto>', methods=['GET'])
def get_producto_in_zona_by_id(id_local, id_zona, id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT p.* FROM PRODUCTO p
            INNER JOIN ZONA_PRODUCTO zp ON p.id_producto = zp.id_producto
            WHERE zp.id_local = %s AND zp.id_zona = %s AND zp.id_producto = %s
        ''', (id_local, id_zona, id_producto))
        producto = cur.fetchone()
        
        if producto is None:
            return jsonify({"error": "Producto no encontrado en la zona"}), 404
        
        producto_data = {
            "id_producto": producto[0],
            "nombre": producto[1],
            "tipo": producto[2],
            "precio_unidad": float(producto[3]),
            "ram": producto[4],
            "almacenamiento": producto[5],
            "marca": producto[6],
            "stock": producto[7],
        }
        return jsonify(producto_data), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el producto: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@zona_producto_routes.route('/<int:id_producto>', methods=['PUT'])
def update_producto_in_zona(id_local, id_zona, id_producto):
    data = request.json
    try:
        # Verificar que se recibió al menos un atributo para actualizar
        if not data:
            return jsonify({"error": "No se proporcionaron datos para actualizar"}), 400

        conn = get_db_connection()
        cur = conn.cursor()

        # Construir dinámicamente la consulta de actualización
        update_fields = []
        values = []

        # Añadir los campos proporcionados en la solicitud
        for field in ['nombre', 'tipo', 'precio_unidad', 'ram', 'almacenamiento', 'marca', 'stock']:
            if field in data:
                update_fields.append(f"{field} = %s")
                values.append(data[field])

        # Si no hay campos válidos, devolver un error
        if not update_fields:
            return jsonify({"error": "No se proporcionaron campos válidos para actualizar"}), 400

        # Construir la consulta final
        update_query = f'''
            UPDATE PRODUCTO
            SET {', '.join(update_fields)}
            WHERE id_producto = %s
            AND EXISTS (
                SELECT 1 FROM ZONA_PRODUCTO
                WHERE id_local = %s AND id_zona = %s AND id_producto = PRODUCTO.id_producto
            )
        '''
        values.extend([id_producto, id_local, id_zona])  # Añadir los valores para WHERE

        cur.execute(update_query, values)
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Producto no encontrado o no pertenece a la zona"}), 404

        return jsonify({"message": "Producto actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el producto: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@zona_producto_routes.route('/<int:id_producto>', methods=['DELETE'])
def delete_producto_in_zona(id_local, id_zona, id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        # Consulta para eliminar el producto de la tabla ZONA_PRODUCTO
        cur.execute('''
            DELETE FROM ZONA_PRODUCTO
            WHERE id_local = %s AND id_zona = %s AND id_producto = %s
        ''', (id_local, id_zona, id_producto))
        conn.commit()

        # Si no se eliminó ninguna fila, significa que el producto no existe o no está asociado a esta zona
        if cur.rowcount == 0:
            return jsonify({"error": "Producto no encontrado o no pertenece a la zona"}), 404

        return jsonify({"message": "Producto eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el producto: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
