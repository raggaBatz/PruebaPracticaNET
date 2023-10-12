SELECT mensaje.cod_mensaje, proyecto.nombre, producto.producto
FROM mensaje
JOIN proyecto ON mensaje.id_proyecto = proyecto.id
JOIN producto ON mensaje.id_producto = producto.id;