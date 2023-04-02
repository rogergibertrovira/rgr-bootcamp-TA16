/* EJERCICIO 4 - PELICULAS Y SALAS */

USE actividades;

SELECT * FROM peliculas;
SELECT * FROM salas;

/* 4.1 */
SELECT nombre FROM peliculas;

/* 4.2 */
SELECT DISTINCT calificacionedad FROM peliculas;

/* 4.3 */
SELECT * FROM peliculas WHERE calificacionedad IS NULL;

/* 4.4 */
SELECT nombre FROM salas WHERE pelicula IS NULL;

/* 4.5 */
SELECT * FROM salas
LEFT JOIN peliculas ON salas.pelicula = peliculas.codigo;

/* 4.6 */
SELECT * FROM peliculas
LEFT JOIN salas ON peliculas.codigo = salas.pelicula;

/* 4.7 */
SELECT peliculas.nombre FROM peliculas
LEFT JOIN salas ON peliculas.codigo = salas.pelicula
WHERE salas.codigo IS NULL;

/* 4.8 */
INSERT INTO peliculas VALUES (10, 'Uno, Dos, Tres', '+7');

/* 4.9 */
UPDATE peliculas SET calificacionedad = 'PG-13' WHERE calificacionedad IS NULL AND codigo > 0;

/* 4.10 */
DELETE FROM salas WHERE pelicula IN 
(
    SELECT codigo FROM peliculas WHERE calificacionedad = 'G' AND codigo > 0
);
