/* EJERCICIO 3 - LOS ALMACENES */

USE actividades;

/* 3.1 */
SELECT * FROM almacenes;

/* 3.2 */
SELECT * FROM cajas WHERE valor > 150;

/* 3.3 */
SELECT DISTINCT contenido FROM cajas;

/* 3.4 */
SELECT AVG(valor) FROM cajas;

/* 3.5 */
SELECT almacen, AVG(valor) FROM cajas GROUP BY almacen;

/* 3.6 */
SELECT almacenes.codigo FROM almacenes
INNER JOIN cajas ON almacenes.codigo = cajas.almacen
WHERE (AVG(cajas.precio) > 150);

/* 3.7 */
SELECT cajas.numreferencia, almacenes.lugar FROM cajas
INNER JOIN almacenes ON cajas.almacen = almacenes.codigo;

/* 3.8 */
SELECT almacenes.codigo, COUNT(cajas.numreferencia) AS num_cajas FROM cajas
INNER JOIN almacenes ON cajas.almacen = almacenes.codigo
GROUP BY almacenes.codigo;

/* 3.9 */
SELECT codigo FROM almacenes
WHERE capacidad < (SELECT COUNT(numreferencia) FROM cajas WHERE cajas.almacen = almacenes.codigo);

/* 3.10 */
SELECT cajas.numreferencia FROM cajas
INNER JOIN almacenes ON cajas.almacen = almacenes.codigo
WHERE almacenes.lugar = 'Bilbao';

/* 3.11 */
INSERT INTO almacenes VALUES (6, 'Barcelona', 3);

/* 3.12 */
INSERT INTO cajas VALUES ('H5RT', 'Papel', 200.0, 2);

/* 3.13 */
UPDATE cajas SET valor = valor * 0.85 WHERE numreferencia <> '0';

/* 3.14 */
UPDATE cajas SET valor = valor * 0.8 
WHERE numreferencia <> '0' AND valor > (SELECT AVG(cajas2.valor) FROM (SELECT * FROM cajas) AS cajas2);

/* 3.15 */
DELETE FROM cajas WHERE valor < 100;

/* 3.16 */
DELETE FROM cajas WHERE almacen IN(
	SELECT codigo FROM almacenes 
    WHERE capacidad < (SELECT COUNT(*) FROM (SELECT * FROM cajas) AS cajas2 WHERE cajas2.almacen = almacenes.codigo)	
);
