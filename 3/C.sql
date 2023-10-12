WITH ProyectoProducto AS (
    SELECT 
        pp.id_proyecto,
        pp.id_producto,
        COUNT(DISTINCT m.cod_mensaje) AS num_mensajes
    FROM 
        producto_proyecto pp
    LEFT JOIN 
        Mensaje m ON m.id_proyecto = pp.id_proyecto AND m.id_producto = pp.id_producto
    GROUP BY 
        pp.id_proyecto, 
        pp.id_producto
),
Proyecto AS (
    SELECT 
        p.id AS id_proyecto,
        p.proyecto,
        p.nombre,
        COUNT(DISTINCT pp.id_producto) AS num_productos,
        SUM(pp.num_mensajes) AS num_mensajes
    FROM 
        proyecto p
    LEFT JOIN 
        ProyectoProducto pp ON pp.id_proyecto = p.id
    GROUP BY 
        p.id, 
        p.proyecto, 
        p.nombre
),
Resultado AS (
    SELECT 
        pr.proyecto,
        pr.nombre,
        pd.producto,
        pd.descripcion,
        pp.num_mensajes
    FROM 
        ProyectoProducto pp
    INNER JOIN 
        Proyecto pr ON pr.id_proyecto = pp.id_proyecto
    INNER JOIN 
        producto pd ON pd.id = pp.id_producto
    WHERE 
        pr.num_mensajes > pp.num_mensajes
    UNION ALL
    SELECT 
        proyecto,
        nombre,
        'TODOS' AS producto,
        'TODOS' AS descripcion,
        num_mensajes
    FROM 
        Proyecto
    WHERE 
        num_productos = (SELECT COUNT(*) FROM producto)
)
SELECT * FROM Resultado;