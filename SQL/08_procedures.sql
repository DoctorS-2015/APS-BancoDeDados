-- PROCEDURE: Busca total consumido por um cliente específico
DELIMITER //
CREATE PROCEDURE sp_total_cliente(IN p_id_cliente INT)
BEGIN
    SELECT SUM(valor_total) as total
    FROM pedidos
    WHERE id_cliente = p_id_cliente AND status_pedido = 'Pago';
END; //
DELIMITER ;
