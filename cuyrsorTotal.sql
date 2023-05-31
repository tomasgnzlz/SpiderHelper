use proyectoBD;

DROP PROCEDURE IF EXISTS ObtenerTiendaMenorCO2_4;
DELIMITER $$
CREATE PROCEDURE ObtenerTiendaMenorCO2_4()
BEGIN
    DECLARE menorResultado INT;
    DECLARE codigoTienda INT;

    DECLARE cur CURSOR FOR
        SELECT t.codTienda, AVG(r.cantHuellaCarbono * r.stock) AS mediaCO2
        FROM ResultadoTienda r
        JOIN Tienda t ON t.codTienda = r.codTienda
        GROUP BY t.codTienda
        ORDER BY mediaCO2
        LIMIT 1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET menorResultado = NULL;

    OPEN cur;

    FETCH cur INTO codigoTienda, menorResultado;

    WHILE menorResultado IS NOT NULL DO
        SELECT concat('', 'La tienda con código ', codigoTienda, ' es la más verde') as TiendaRanking;

        FETCH cur INTO codigoTienda, menorResultado;
    END WHILE;

    CLOSE cur;
END $$
DELIMITER ;
call ObtenerTiendaMenorCO2_4();
