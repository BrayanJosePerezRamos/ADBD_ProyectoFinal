from flask import Flask, render_template_string
from routes import init_routes
from db import get_db_connection
from werkzeug.routing import BaseConverter
import datetime

# Registrar el convertidor 'date'
class DateConverter(BaseConverter):
    def to_python(self, value):
        return datetime.datetime.strptime(value, '%Y-%m-%d').date()

    def to_url(self, value):
        return value.strftime('%Y-%m-%d')

app = Flask(__name__)
app.url_map.converters['date'] = DateConverter

# Registrar rutas
init_routes(app)

# Ruta raíz para mostrar las rutas registradas
@app.route('/')
def home():
    routes = {
        "Producto": [
            {"Method": "GET", "Route": "/producto", "Description": "Lista todos los productos"},
            {"Method": "GET", "Route": "/producto/<id_producto>", "Description": "Obtiene un producto por su id"},
            {"Method": "POST", "Route": "/producto", "Description": "Crea un nuevo producto"},
            {"Method": "PUT", "Route": "/producto/<id_producto>", "Description": "Actualiza un producto existente por su id"},
            {"Method": "DELETE", "Route": "/producto/<id_producto>", "Description": "Elimina un producto por su id"}
        ],
        "Local": [
            {"Method": "GET", "Route": "/local", "Description": "Lista todos los locales"},
            {"Method": "GET", "Route": "/local/<id_local>", "Description": "Obtiene un local por su id"},
            {"Method": "POST", "Route": "/local", "Description": "Crea un nuevo local"},
            {"Method": "PUT", "Route": "/local/<id_local>", "Description": "Actualiza un local existente"},
            {"Method": "DELETE", "Route": "/local/<id_local>", "Description": "Elimina un local"}
        ],
        "Zona": [
            {"Method": "GET", "Route": "/local/<id_local>/zona", "Description": "Lista zonas de un local"},
            {"Method": "GET", "Route": "/local/<id_local>/zona/<id_zona>", "Description": "Obtiene una zona de un local"},
            {"Method": "POST", "Route": "/local/<id_local>/zona", "Description": "Crea una zona en un local"},
            {"Method": "PUT", "Route": "/local/<id_local>/zona/<id_zona>", "Description": "Actualiza una zona"},
            {"Method": "DELETE", "Route": "/local/<id_local>/zona/<id_zona>", "Description": "Elimina una zona"}
        ],
        "Zona Producto": [
            {"Method": "GET", "Route": "/local/<id_local>/zona/<id_zona>/producto", "Description": "Lista los productos de una zona"},
            {"Method": "GET", "Route": "/local/<id_local>/zona/<id_zona>/producto/<id_producto>", "Description": "Obtiene un producto de una zona"},
            {"Method": "POST", "Route": "/local/<id_local>/zona/<id_zona>/producto", "Description": "Añade un producto a una zona"},
            {"Method": "PUT", "Route": "/local/<id_local>/zona/<id_zona>/producto/<id_producto>", "Description": "Actualiza un producto de una zona"},
            {"Method": "DELETE", "Route": "/local/<id_local>/zona/<id_zona>/producto/<id_producto>", "Description": "Elimina un producto de una zona"}
        ],
        "Empleado": [
            {"Method": "GET", "Route": "/empleado", "Description": "Lista todos los empleados"},
            {"Method": "GET", "Route": "/empleado/<id_empleado>", "Description": "Obtiene un empleado por su id"},
            {"Method": "POST", "Route": "/empleado", "Description": "Crea un nuevo empleado"},
            {"Method": "PUT", "Route": "/empleado/<id_empleado>", "Description": "Actualiza un empleado existente"},
            {"Method": "DELETE", "Route": "/empleado/<id_empleado>", "Description": "Elimina un empleado"}
        ],
        "Socio": [
            {"Method": "GET", "Route": "/socio", "Description": "Lista todos los socios"},
            {"Method": "GET", "Route": "/socio/<id_socio>", "Description": "Obtiene un socio por su id"},
            {"Method": "POST", "Route": "/socio", "Description": "Crea un nuevo socio"},
            {"Method": "PUT", "Route": "/socio/<id_socio>", "Description": "Actualiza un socio existente"},
            {"Method": "DELETE", "Route": "/socio/<id_socio>", "Description": "Elimina un socio"}
        ],
        "Pedido": [
            {"Method": "GET", "Route": "/pedido", "Description": "Lista todos los pedidos"},
            {"Method": "GET", "Route": "/pedido/<id_pedido>", "Description": "Obtiene un pedido"},
            {"Method": "POST", "Route": "/pedido", "Description": "Crea un nuevo pedido"},
            {"Method": "PUT", "Route": "/pedido/<id_pedido>", "Description": "Actualiza un pedido existente"},
            {"Method": "DELETE", "Route": "/pedido/<id_pedido>", "Description": "Elimina un pedido"},
            {"Method": "GET", "Route": "/pedido/<int:id_pedido>/producto/", "Description": "Lista los productos de un pedido"},
            {"Method": "GET", "Route": "/pedido/<int:id_pedido>/producto/<int:id_producto>", "Description": "Obtiene la info de un producto en un pedido"},
            {"Method": "POST", "Route": "/pedido/<int:id_pedido>/producto", "Description": "Añade un producto a un pedido"},
            {"Method": "PUT", "Route": "/pedido/<int:id_pedido>/producto/<int:id_producto>", "Description": "Actualiza un producto de un pedido"},
            {"Method": "DELETE", "Route": "/pedido/<int:id_pedido>/producto/<int:id_producto>", "Description": "Elimina un producto de un pedido"}
        ],
        "Empleado Pedido": [
            {"Method": "GET", "Route": "/empleado/<int:id_empleado>/pedido", "Description": "Lista los pedidos de un empleado"},
            {"Method": "GET", "Route": "/empleado/<int:id_empleado>/pedido/<id_pedido>", "Description": "Obtiene un pedido de un empleado"},
            {"Method": "POST", "Route": "/empleado/<int:id_empleado>/pedido", "Description": "Crea un nuevo pedido para un empleado"},
            {"Method": "PUT", "Route": "/empleado/<int:id_empleado>/pedido/<id_pedido>", "Description": "Actualiza un pedido de un empleado"},
            {"Method": "DELETE", "Route": "/empleado/<int:id_empleado>/pedido/<id_pedido>", "Description": "Elimina un pedido de un empleado"}
        ],
        "Trabaja": [
            {"Method": "GET", "Route": "/trabaja", "Description": "Lista todas las relaciones de trabajo"},
            {"Method": "GET", "Route": "/trabaja/empleado/<id_empleado>", "Description": "Lista las relaciones de trabajo de un empleado por su id"},
            {"Method": "GET", "Route": "/trabaja/local/<id_local>", "Description": "Lista las relaciones de trabajo de un local por su id"},
            {"Method": "POST", "Route": "/trabaja", "Description": "Crea una nueva relación de trabajo"},
            {"Method": "PUT", "Route": "/trabaja/empleado/<id_empleado>", "Description": "Actualiza una relación de trabajo de un empleado"},
            {"Method": "DELETE", "Route": "/trabaja/empleado/<id_empleado>", "Description": "Elimina una relación de trabajo de un empleado"}
        ],
        "Libre": [
            {"Method": "GET", "Route": "/libre", "Description": "Lista todos los registros de libre"},
            {"Method": "GET", "Route": "/libre/<id>", "Description": "Obtiene un registro de libre por su id"},
            {"Method": "GET", "Route": "/libre/<string:motivo>", "Description": "Obtiene un registro de libre por su motivo"},
            {"Method": "POST", "Route": "/libre", "Description": "Crea un nuevo registro de libre"},
            {"Method": "PUT", "Route": "/libre/<id>", "Description": "Actualiza un registro de libre existente"},
            {"Method": "DELETE", "Route": "/libre/<id>", "Description": "Elimina un registro de libre"}
        ],
        "Tipos de Producto (se repite cada metodo para las ditintas rutas)": [
            {"Method": "GET", "Route": "/producto/sobremesa", "Description": "Lista todos los productos de tipo sobremesa"},
            {"Method": "GET", "Route": "/producto/sobremesa/<id_producto>", "Description": "Obtiene un producto de tipo sobremesa por su id"},
            {"Method": "POST", "Route": "/producto/sobremesa", "Description": "Crea un nuevo producto de tipo sobremesa"},
            {"Method": "PUT", "Route": "/producto/sobremesa/<id_producto>", "Description": "Actualiza un producto de tipo sobremesa existente"},
            {"Method": "DELETE", "Route": "/producto/sobremesa/<id_producto>", "Description": "Elimina un producto de tipo sobremesa"},
            {"Method": "GET", "Route": "/producto/portatil", "Description": "Lista todos los productos de tipo portátil"},
            {"Method": "GET", "Route": "/producto/movil", "Description": "Lista todos los productos de tipo móvil"},
            {"Method": "GET", "Route": "/producto/consola", "Description": "Lista todos los productos de tipo consola"},
        ]
    }

    page_html = '''
    <html>
        <head>
            <title>Guía de Rutas de la API de TechStore</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 20px;
                }
                table {
                    border-collapse: collapse;
                    width: 100%;
                    margin-bottom: 20px;
                }
                th, td {
                    border: 1px solid #ddd;
                    padding: 8px;
                }
                th {
                    background-color: #f2f2f2;
                    text-align: left;
                }
                tr:hover {
                    background-color: #f5f5f5;
                }
                a {
                    text-decoration: none;
                    color: blue;
                }
                h2 {
                    color: #333;
                }
            </style>
        </head>
        <body>
            <h1>Rutas Disponibles en la API</h1>
            {% for section, crud in routes.items() %}
                <h2>{{ section }}</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Método</th>
                            <th>Ruta</th>
                            <th>Descripción</th>
                        </tr>
                    </thead>
                    <tbody>
                        {% for route in crud %}
                        <tr>
                            <td>{{ route.Method }}</td>
                            <td>
                                <a href="{{ route.Route }}" target="_blank">{{ route.Route }}</a>
                            </td>
                            <td>{{ route.Description }}</td>
                        </tr>
                        {% endfor %}
                    </tbody>
                </table>
            {% endfor %}
        </body>
    </html>
    '''
    return render_template_string(page_html, routes=routes)

if __name__ == '__main__':
    app.run(debug=True)
