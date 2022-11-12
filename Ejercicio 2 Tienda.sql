USE TIENDA;
SELECT * FROM FABRICANTES;
SELECT * FROM PRODUCTOS;

SELECT NOMBRE FROM PRODUCTOS;
SELECT NOMBRE, PRECIO FROM PRODUCTOS;

SELECT NOMBRE, PRECIO, CODIGO, CODIGO_FABRICANTES FROM PRODUCTOS;

SELECT NOMBRE, floor(PRECIO) FROM PRODUCTOS;

SELECT DISTINCT F.NOMBRE 
FROM FABRICANTES AS F, PRODUCTOS AS P
WHERE F.CODIGO=P.CODIGO_FABRICANTES; 

SELECT NOMBRE 
FROM FABRICANTES 
ORDER BY NOMBRE ASC; 

SELECT NOMBRE, PRECIO 
FROM PRODUCTOS 
ORDER BY PRECIO ASC, NOMBRE DESC;	

SELECT NOMBRE, PRECIO 
FROM PRODUCTOS 
ORDER BY NOMBRE ASC, PRECIO DESC;

SELECT NOMBRE, CODIGO
FROM FABRICANTES
LIMIT 5;

SELECT NOMBRE, PRECIO
FROM PRODUCTOS
ORDER BY PRECIO DESC
LIMIT 1;

SELECT NOMBRE, PRECIO
FROM PRODUCTOS
ORDER BY PRECIO ASC
LIMIT 1;

SELECT NOMBRE, PRECIO
FROM PRODUCTOS 
WHERE PRODUCTOS.PRECIO<=120;

SELECT NOMBRE, PRECIO
FROM PRODUCTOS AS P
WHERE P.PRECIO BETWEEN 60 AND 200;

SELECT NOMBRE, CODIGO_FABRICANTES
FROM PRODUCTOS AS P
WHERE P.CODIGO_FABRICANTES IN (1,3,5);

SELECT NOMBRE
FROM PRODUCTOS AS P
WHERE P.NOMBRE LIKE '%PORTATIL%';

SELECT P.CODIGO, P.NOMBRE, P.CODIGO_FABRICANTES, F.NOMBRE
FROM PRODUCTOS AS P, FABRICANTES AS F;

SELECT P.CODIGO, P.NOMBRE, P.CODIGO_FABRICANTES, F.NOMBRE
FROM PRODUCTOS AS P, FABRICANTES AS F
ORDER BY F.NOMBRE ASC;

SELECT P.NOMBRE, P.PRECIO, F.NOMBRE
FROM PRODUCTOS AS P, FABRICANTES AS F
ORDER BY P.PRECIO DESC
LIMIT 1;

SELECT CODIGO
FROM FABRICANTES
WHERE FABRICANTES.NOMBRE='LENOVO';

SELECT P.NOMBRE
FROM PRODUCTOS AS P, FABRICANTES AS F
WHERE P.CODIGO_FABRICANTES=2;

SELECT P.NOMBRE
FROM PRODUCTOS AS P, FABRICANTES AS F
WHERE P.CODIGO_FABRICANTES=F.CODIGO
AND F.NOMBRE='LENOVO';

SELECT P.NOMBRE
FROM PRODUCTOS AS P, FABRICANTES AS F
WHERE P.CODIGO_FABRICANTES=F.CODIGO
AND F.NOMBRE='CRUCIAL'
AND P.PRECIO>200;

SELECT NOMBRE, CODIGO FROM FABRICANTES;

SELECT P.NOMBRE
FROM PRODUCTOS AS P, FABRICANTES AS F
WHERE P.CODIGO_FABRICANTES IN (1,3);

SELECT *
FROM FABRICANTES F
INNER JOIN PRODUCTOS P
ON P.CODIGO_FABRICANTES=F.CODIGO;

SELECT *
FROM PRODUCTOS P
LEFT OUTER JOIN FABRICANTES F
ON P.CODIGO_FABRICANTES=F.CODIGO;

SELECT NOMBRE
FROM FABRICANTES F 
RIGHT OUTER JOIN PRODUCTOS P 
ON P.CODIGO_FABRICANTES=F.CODIGO;

SELECT NOMBRE
FROM PRODUCTOS WHERE (SELECT CODIGO_FABRICANTES=2); 

SELECT * 
FROM PRODUCTOS AS P, FABRICANTES AS F
WHERE P.PRECIO = (SELECT MAX(P.PRECIO) WHERE P.CODIGO_FABRICANTES=2);

SELECT P.NOMBRE
FROM PRODUCTOS AS P
WHERE P.PRECIO=(SELECT MAX(PRECIO) FROM PRODUCTOS WHERE P.CODIGO_FABRICANTES=2);

SELECT *
FROM PRODUCTOS, FABRICANTES 
WHERE PRODUCTOS.CODIGO_FABRICANTES=2 AND PRODUCTOS.PRECIO>(SELECT AVG(PRECIO) FROM PRODUCTOS WHERE FABRICANTES.NOMBRE='ASUS');

SELECT NOMBRE
FROM FABRICANTES F
WHERE EXISTS(SELECT P.CODIGO
			 FROM PRODUCTOS P
             WHERE F.CODIGO=P.CODIGO_FABRICANTES);
             
SELECT NOMBRE 
FROM FABRICANTES F 
WHERE NOT EXISTS(SELECT P.CODIGO
                 FROM PRODUCTOS P
                 WHERE F.CODIGO=P.CODIGO_FABRICANTES);

select fabricantes.nombre, count(productos.codigo) from fabricantes, productos where productos.codigo_fabricante = fabricantes.codigo 
group by fabricantes.codigo having count(productos.codigo) = (SELECT count(codigo)
FROM productos WHERE  codigo_fabricante = 2 );
