from .producto import producto_routes
from .zona import zona_routes
from .local import local_routes
from .zona_producto import zona_producto_routes
from .empleado import empleado_routes
from .socio import socio_routes
from .pedido import pedido_routes
from .empleado_pedido import empleado_pedido_routes
from .trabaja import trabaja_routes
from .libre import libre_routes

def init_routes(app):
    app.register_blueprint(producto_routes, url_prefix='/producto')
    app.register_blueprint(local_routes, url_prefix='/local')
    app.register_blueprint(zona_routes, url_prefix='/local/<int:id_local>/zona')
    app.register_blueprint(zona_producto_routes, url_prefix='/local/<int:id_local>/zona/<int:id_zona>/producto')
    app.register_blueprint(empleado_routes, url_prefix='/empleado')
    app.register_blueprint(socio_routes, url_prefix='/socio')
    app.register_blueprint(pedido_routes, url_prefix='/pedido')
    app.register_blueprint(empleado_pedido_routes, url_prefix='/empleado/<int:id_empleado>/pedido')
    app.register_blueprint(trabaja_routes, url_prefix='/trabaja')
    app.register_blueprint(libre_routes, url_prefix='/libre')
