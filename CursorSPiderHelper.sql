DELIMITER //

-- Crear un procedimiento almacenado
CREATE PROCEDURE CalcularVentasCO2()
BEGIN
  -- Variables
  DECLARE done INT DEFAULT FALSE;
  DECLARE totalVentas INT;
  DECLARE codProductos INT;
  DECLARE cantHuellaCarbono DOUBLE;
  DECLARE ventasCO2 DOUBLE;

  -- Cursor para obtener los productos y su CO2
  DECLARE productosCursor CURSOR FOR
    SELECT P.codProductos, P.cantHuellaCarbono
    FROM Productos AS P;

  -- Manejo de errores
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  -- Inicializar variables
  SET totalVentas = 0;

  -- Abrir el cursor
  OPEN productosCursor;

  -- Iniciar el bucle
  productoLoop: WHILE NOT done DO
    -- Obtener los valores del cursor
    FETCH productosCursor INTO codProductos, cantHuellaCarbono;

    -- Calcular las ventas totales del producto
    SET ventasCO2 = 0;

    -- Cursor para obtener las ventas de cada producto
    DECLARE ventasCursor CURSOR FOR
      SELECT RT.stock
      FROM ResultadoTienda AS RT
      WHERE RT.codProductos = codProductos;

    -- Abrir el cursor de ventas
    OPEN ventasCursor;

    -- Iniciar el bucle de ventas
    WHILE EXISTS (SELECT 1 FROM ventasCursor) DO
      -- Variables para almacenar las ventas
      DECLARE ventasProducto INT;

      -- Obtener las ventas del cursor de ventas
      FETCH ventasCursor INTO ventasProducto;

      -- Sumar las ventas del producto
      SET ventasCO2 = ventasCO2 + ventasProducto;
    END WHILE;

    -- Cerrar el cursor de ventas
    CLOSE ventasCursor;

    -- Dividir las ventas totales por el CO2 del producto
    SET ventasCO2 = ventasCO2 / cantHuellaCarbono;

    -- Imprimir los resultados
    SELECT codProductos, ventasCO2;

  END WHILE;

  -- Cerrar el cursor de productos
  CLOSE productosCursor;

END //

DELIMITER ;

-- Llamar al procedimiento almacenado
CALL CalcularVentasCO2();
