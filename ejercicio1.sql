/* EJERCICIO 1 - LA TIENDA DE INFORMATICA */

USE actividades;

/* 1.1 */
SELECT nombre FROM articulos;

/* 1.2 */
SELECT nombre, precio FROM articulos;

/* 1.3 */
SELECT nombre, precio FROM articulos WHERE precio <= 200;

/* 1.4 */
SELECT nombre, precio FROM articulos WHERE precio >= 60 AND precio <= 120;

/* 1.5 */
SELECT nombre, precio * 166.386 AS precio_pesetas FROM articulos;

/* 1.6 */
SELECT AVG(precio) AS precio_medio FROM articulos;

/* 1.7 */
SELECT AVG(precio) AS precio_medio FROM articulos WHERE fabricante = 2;

/* 1.8 */
SELECT COUNT(precio) FROM articulos WHERE precio >= 180;

/* 1.9 */
SELECT nombre, precio FROM articulos WHERE precio >= 180 ORDER BY precio DESC , nombre;

/* 1.10 */
SELECT * FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo;

/* 1.11 */
SELECT articulos.nombre, articulos.precio, fabricantes.nombre FROM articulos 
INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo;

/* 1.12 */
SELECT AVG(articulos.precio) AS precio_medio, fabricantes.codigo FROM articulos 
INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo 
GROUP BY fabricantes.codigo;

/* 1.13 */
SELECT AVG(articulos.precio) AS precio_medio, fabricantes.nombre FROM articulos 
INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo 
GROUP BY fabricantes.codigo;

/* 1.14 */
SELECT fabricantes.nombre FROM fabricantes 
INNER JOIN articulos ON fabricantes.codigo = articulos.fabricante
GROUP BY fabricantes.nombre
HAVING AVG((articulos.precio) >= 150);

/* 1.15 */
SELECT nombre, precio FROM articulos WHERE precio = (SELECT MIN(precio) FROM articulos);

/* 1.16 */
SELECT articulos.nombre AS Nombre_articulo, articulos.precio, fabricantes.nombre AS Nombre_fabricante FROM articulos 
INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo
WHERE precio IN (
	SELECT MAX(articulos.precio) FROM articulos 
	INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo
	GROUP BY fabricantes.nombre
);

/* 1.17 */
INSERT INTO articulos (codigo, nombre, precio, fabricante) VALUES (11, 'Altavoces', 70, 2);

/* 1.18 */
UPDATE articulos SET nombre = 'Impersora Laser' WHERE codigo = 8;
SELECT * FROM articulos;

/* 1.19 */
# Alteramos el tipo de precio para poder tener decimales
ALTER TABLE articulos MODIFY precio decimal(10,2);
UPDATE articulos SET precio = (0.9*precio) WHERE codigo > 0;

/* 1.20 */
UPDATE articulos SET precio = (precio - 10) WHERE precio >=  120 AND codigo > 0;
