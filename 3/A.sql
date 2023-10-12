SELECT proyecto.nombre, producto.producto
FROM proyecto
JOIN producto_proyecto ON proyecto.id = producto_proyecto.id_proyecto
JOIN producto ON producto_proyecto.id_producto = producto.id
WHERE proyecto.id = 1;