from flask import Blueprint, jsonify, request
from db import get_db_connection

producto_routes = Blueprint('producto', __name__)

# CREATE: Agregar un nuevo producto
@producto_routes.route('/', methods=['POST'])
def create_producto():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        ''', (
            data['id_producto'], data['nombre'], data['tipo'], data['precio_unidad'], 
            data['ram'], data['almacenamiento'], data['marca'], data['stock']
        ))
        conn.commit()
        return jsonify({"message": "Producto creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el producto: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            
# READ: Obtener todos los productos
@producto_routes.route('/', methods=['GET'])
def get_all_productos():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM PRODUCTO ORDER BY id_producto;')
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
        return jsonify({"error": f"Error al obtener los productos: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@producto_routes.route('/<int:id_producto>', methods=['GET'])
def get_producto_by_id(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM PRODUCTO WHERE id_producto = %s;', (id_producto,))
        producto = cur.fetchone()
        if producto is None:
            return jsonify({"error": "Producto no encontrado"}), 404
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

@producto_routes.route('/<int:id_producto>', methods=['PUT'])
def update_producto(id_producto):
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
        '''
        values.append(id_producto)  # Añadir el ID del producto para la cláusula WHERE

        cur.execute(update_query, values)
        conn.commit()

        if cur.rowcount == 0:
            return jsonify({"error": "Producto no encontrado"}), 404

        return jsonify({"message": "Producto actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el producto: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

@producto_routes.route('/<int:id_producto>', methods=['DELETE'])
def delete_producto(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('DELETE FROM PRODUCTO WHERE id_producto = %s;', (id_producto,))
        conn.commit()
        return jsonify({"message": "Producto eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el producto: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

#------------------------------------Tipos de Producto------------------------------------
#------------------------------------Sobremesa------------------------------------
# Crear un producto de sobremesa
@producto_routes.route('/sobremesa/', methods=['POST'])
def create_sobremesa():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO SOBREMESA (id_producto, caja, refrigeracion, placa_base, fuente)
            VALUES (%s, %s, %s, %s, %s)
        ''', (data['id_producto'], data['caja'], data['refrigeracion'], data['placa_base'], data['fuente']))
        conn.commit()
        return jsonify({"message": "Producto de sobremesa creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el producto de sobremesa: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            
# Leer todos los productos de sobremesa
@producto_routes.route('/sobremesa/', methods=['GET'])
def get_sobremesas():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_producto, caja, refrigeracion, placa_base, fuente
            FROM SOBREMESA
        ''')
        sobremesas = cur.fetchall()

        if not sobremesas:
            return jsonify({"error": "No se encontraron productos de sobremesa"}), 404

        sobremesas_list = [
            {
                "id_producto": sobremesa[0],
                "caja": sobremesa[1],
                "refrigeracion": sobremesa[2],
                "placa_base": sobremesa[3],
                "fuente": sobremesa[4]
            }
            for sobremesa in sobremesas
        ]

        return jsonify(sobremesas_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los productos de sobremesa: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Leer un producto de sobremesa por id
@producto_routes.route('/sobremesa/<int:id_producto>', methods=['GET'])
def get_sobremesa(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_producto, caja, refrigeracion, placa_base, fuente
            FROM SOBREMESA
            WHERE id_producto = %s
        ''', (id_producto,))
        sobremesa = cur.fetchone()

        if not sobremesa:
            return jsonify({"error": "Producto de sobremesa no encontrado"}), 404

        return jsonify({
            "id_producto": sobremesa[0],
            "caja": sobremesa[1],
            "refrigeracion": sobremesa[2],
            "placa_base": sobremesa[3],
            "fuente": sobremesa[4]
        }), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el producto de sobremesa: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Actualizar un producto de sobremesa
@producto_routes.route('/sobremesa/<int:id_producto>', methods=['PUT'])
def update_sobremesa(id_producto):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            UPDATE SOBREMESA
            SET caja = %s, refrigeracion = %s, placa_base = %s, fuente = %s
            WHERE id_producto = %s
        ''', (data['caja'], data['refrigeracion'], data['placa_base'], data['fuente'], id_producto))
        conn.commit()

        return jsonify({"message": "Producto de sobremesa actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el producto de sobremesa: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Eliminar un producto de sobremesa por id
@producto_routes.route('/sobremesa/<int:id_producto>', methods=['DELETE'])
def delete_sobremesa(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            DELETE FROM SOBREMESA
            WHERE id_producto = %s
        ''', (id_producto,))
        conn.commit()

        return jsonify({"message": "Producto de sobremesa eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el producto de sobremesa: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

#------------------------------------Portatil------------------------------------
# Crear un producto portátil
@producto_routes.route('/portatil/', methods=['POST'])
def create_portatiles():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO PORTATILES (id_producto, bateria, pulgadas)
            VALUES (%s, %s, %s)
        ''', (data['id_producto'], data['bateria'], data['pulgadas']))
        conn.commit()
        return jsonify({"message": "Producto portátil creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el producto portátil: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            
# Leer todos los productos portátiles
@producto_routes.route('/portatil/', methods=['GET'])
def get_portatiles():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_producto, bateria, pulgadas
            FROM PORTATILES
        ''')
        portatiles = cur.fetchall()

        if not portatiles:
            return jsonify({"error": "No se encontraron productos portátiles"}), 404

        portatiles_list = [
            {
                "id_producto": portatil[0],
                "bateria": portatil[1],
                "pulgadas": portatil[2]
            }
            for portatil in portatiles
        ]

        return jsonify(portatiles_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los productos portátiles: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            
            

# Leer un producto portátil por id
@producto_routes.route('/portatil/<int:id_producto>', methods=['GET'])
def get_portatil(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_producto, bateria, pulgadas
            FROM PORTATILES
            WHERE id_producto = %s
        ''', (id_producto,))
        portatiles = cur.fetchone()

        if not portatiles:
            return jsonify({"error": "Producto portátil no encontrado"}), 404

        return jsonify({
            "id_producto": portatiles[0],
            "bateria": portatiles[1],
            "pulgadas": portatiles[2]
        }), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el producto portátil: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Actualizar un producto portátil
@producto_routes.route('/portatil/<int:id_producto>', methods=['PUT'])
def update_portatiles(id_producto):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            UPDATE PORTATILES
            SET bateria = %s, pulgadas = %s
            WHERE id_producto = %s
        ''', (data['bateria'], data['pulgadas'], id_producto))
        conn.commit()

        return jsonify({"message": "Producto portátil actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el producto portátil: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Eliminar un producto portátil por id
@producto_routes.route('/portatil/<int:id_producto>', methods=['DELETE'])
def delete_portatiles(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            DELETE FROM PORTATILES
            WHERE id_producto = %s
        ''', (id_producto,))
        conn.commit()

        return jsonify({"message": "Producto portátil eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el producto portátil: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

#------------------------------------Dispositivos Moviles------------------------------------
# Crear un dispositivo móvil
@producto_routes.route('/movil/', methods=['POST'])
def create_dispositivos_moviles():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO DISPOSITIVOS_MOVILES (id_producto, bateria, pulgadas, camara)
            VALUES (%s, %s, %s, %s)
        ''', (data['id_producto'], data['bateria'], data['pulgadas'], data['camara']))
        conn.commit()
        return jsonify({"message": "Producto dispositivo móvil creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el producto dispositivo móvil: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
            
# Leer todos los dispositivos móviles
@producto_routes.route('/movil/', methods=['GET'])
def get_dispositivos_moviles():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_producto, bateria, pulgadas, camara
            FROM DISPOSITIVOS_MOVILES
        ''')
        dispositivos_moviles = cur.fetchall()

        if not dispositivos_moviles:
            return jsonify({"error": "No se encontraron productos dispositivo móvil"}), 404

        dispositivos_moviles_list = [
            {
                "id_producto": dispositivo_movil[0],
                "bateria": dispositivo_movil[1],
                "pulgadas": dispositivo_movil[2],
                "camara": dispositivo_movil[3]
            }
            for dispositivo_movil in dispositivos_moviles
        ]

        return jsonify(dispositivos_moviles_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los productos dispositivo móvil: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Leer un dispositivo móvil por id
@producto_routes.route('/movil/<int:id_producto>', methods=['GET'])
def get_dispositivo_movil(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_producto, bateria, pulgadas, camara
            FROM DISPOSITIVOS_MOVILES
            WHERE id_producto = %s
        ''', (id_producto,))
        dispositivos_moviles = cur.fetchone()

        if not dispositivos_moviles:
            return jsonify({"error": "Producto dispositivo móvil no encontrado"}), 404

        return jsonify({
            "id_producto": dispositivos_moviles[0],
            "bateria": dispositivos_moviles[1],
            "pulgadas": dispositivos_moviles[2],
            "camara": dispositivos_moviles[3]
        }), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el producto dispositivo móvil: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Actualizar un dispositivo móvil
@producto_routes.route('/movil/<int:id_producto>', methods=['PUT'])
def update_dispositivos_moviles(id_producto):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            UPDATE DISPOSITIVOS_MOVILES
            SET bateria = %s, pulgadas = %s, camara = %s
            WHERE id_producto = %s
        ''', (data['bateria'], data['pulgadas'], data['camara'], id_producto))
        conn.commit()

        return jsonify({"message": "Producto dispositivo móvil actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el producto dispositivo móvil: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Eliminar un dispositivo móvil por id
@producto_routes.route('/movil/<int:id_producto>', methods=['DELETE'])
def delete_dispositivos_moviles(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            DELETE FROM DISPOSITIVOS_MOVILES
            WHERE id_producto = %s
        ''', (id_producto,))
        conn.commit()

        return jsonify({"message": "Producto dispositivo móvil eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el producto dispositivo móvil: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

#------------------------------------Consolas------------------------------------
# Crear una consola
@producto_routes.route('/consola/', methods=['POST'])
def create_consola():
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            INSERT INTO CONSOLA (id_producto, portable)
            VALUES (%s, %s)
        ''', (data['id_producto'], data['portable']))
        conn.commit()
        return jsonify({"message": "Producto consola creado exitosamente"}), 201
    except Exception as e:
        return jsonify({"error": f"Error al crear el producto consola: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Leer todas las consolas
@producto_routes.route('/consola/', methods=['GET'])
def get_consolas():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_producto, portable
            FROM CONSOLA
        ''')
        consolas = cur.fetchall()

        if not consolas:
            return jsonify({"error": "No se encontraron productos consola"}), 404

        consolas_list = [
            {
                "id_producto": consola[0],
                "portable": consola[1]
            }
            for consola in consolas
        ]

        return jsonify(consolas_list), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener los productos consola: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Leer una consola por id
@producto_routes.route('/consola/<int:id_producto>', methods=['GET'])
def get_consola(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            SELECT id_producto, portable
            FROM CONSOLA
            WHERE id_producto = %s
        ''', (id_producto,))
        consola = cur.fetchone()

        if not consola:
            return jsonify({"error": "Producto consola no encontrado"}), 404

        return jsonify({
            "id_producto": consola[0],
            "portable": consola[1]
        }), 200
    except Exception as e:
        return jsonify({"error": f"Error al obtener el producto consola: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Actualizar una consola
@producto_routes.route('/consola/<int:id_producto>', methods=['PUT'])
def update_consola(id_producto):
    data = request.json
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            UPDATE CONSOLA
            SET portable = %s
            WHERE id_producto = %s
        ''', (data['portable'], id_producto))
        conn.commit()

        return jsonify({"message": "Producto consola actualizado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al actualizar el producto consola: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()

# Eliminar una consola por id
@producto_routes.route('/consola/<int:id_producto>', methods=['DELETE'])
def delete_consola(id_producto):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('''
            DELETE FROM CONSOLA
            WHERE id_producto = %s
        ''', (id_producto,))
        conn.commit()

        return jsonify({"message": "Producto consola eliminado exitosamente"}), 200
    except Exception as e:
        return jsonify({"error": f"Error al eliminar el producto consola: {str(e)}"}), 500
    finally:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
