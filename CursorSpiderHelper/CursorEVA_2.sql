USE proyectoBD;

DROP PROCEDURE IF EXISTS ObtenerTiendaMenorCO2_5;
DELIMITER $$
CREATE PROCEDURE ObtenerTiendaMenorCO2_5()
BEGIN
    DECLARE menorResultado INT;
    DECLARE codigoTienda INT;


    DECLARE cur CURSOR FOR
        SELECT t.codTienda, AVG(r.cantHuellaCarbono * r.stock) AS mediaCO2
        FROM ResultadoTienda r
        JOIN Tienda t ON t.codTienda = r.codTienda
        GROUP BY t.codTienda
        ORDER BY mediaCO2;
     --    LIMIT 1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET menorResultado = NULL;

    OPEN cur;

    FETCH cur INTO codigoTienda, menorResultado;

    WHILE menorResultado IS NOT NULL DO
        -- Insertar el código de la tienda en la tabla 'ranking'
        INSERT INTO ranking (TiendaVerde) VALUES (codigoTienda);

        FETCH cur INTO codigoTienda, menorResultado;
    END WHILE;

    CLOSE cur;
END $$
DELIMITER ;

call ObtenerTiendaMenorCO2_5();

