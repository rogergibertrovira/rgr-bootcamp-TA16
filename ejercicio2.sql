/* EJERCICIO 2 - EMPLEADOS */

USE actividades;

/* 2.1 */
SELECT apellidos FROM empleados;

/* 2.2 */
SELECT DISTINCT apellidos FROM empleados;

/* 2.3 */
SELECT * FROM empleados WHERE apellidos = 'Smith';

/* 2.4 */
SELECT * FROM empleados WHERE apellidos = 'Smith' or apellidos = 'Rogers';

/* 2.5 */
SELECT * FROM empleados WHERE departamento = 14;

/* 2.6 */
SELECT * FROM empleados WHERE departamento = 37 OR departamento = 77;

/* 2.7 */
SELECT * FROM empleados WHERE apellidos LIKE 'P%';

/* 2.8 */
SELECT SUM(presupuesto) FROM departamentos;

/* 2.9 */
SELECT departamento, COUNT(dni) AS num_empleados FROM empleados GROUP BY departamento;

/* 2.10 */
SELECT * FROM empleados INNER JOIN departamentos ON empleados.departamento = departamentos.codigo;

/* 2.11 */
SELECT empleados.nombre, empleados.apellidos, departamentos.codigo, departamentos.presupuesto 
FROM empleados INNER JOIN departamentos ON empleados.departamento = departamentos.codigo;

/* 2.12 */
SELECT empleados.nombre, empleados.apellidos FROM empleados 
INNER JOIN departamentos ON empleados.departamento = departamentos.codigo
WHERE departamentos.presupuesto > 60000;

/* 2.13 */
SELECT * FROM departamentos
WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos);

/* 2.14 */
SELECT departamentos.nombre FROM departamentos
INNER JOIN empleados ON departamentos.codigo = empleados.departamento
GROUP BY departamento
HAVING (COUNT(empleados.dni) > 2);

/* 2.15 */
INSERT INTO departamentos VALUES (11, 'Calidad', 40000);
INSERT INTO empleados VALUES ('89267109', 'Esther', 'Vázquez', 11);

/* 2.16 */
UPDATE departamentos SET presupuesto = (0.9 * presupuesto) WHERE codigo > 0;

/* 2.17 */
UPDATE empleados SET departamento = 14 WHERE departamento = 77;

/* 2.18 */
DELETE FROM empleados WHERE departamento = 14;

/* 2.19 */
DELETE empleados FROM empleados 
INNER JOIN departamentos ON empleados.departamento = departamentos.codigo
WHERE departamentos.presupuesto > 60000;

/* 2.20 */
DELETE FROM empleados WHERE dni > 0;
