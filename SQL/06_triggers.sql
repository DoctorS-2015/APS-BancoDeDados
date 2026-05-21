-- TRIGGER: Atualiza valor_total do pedido automaticamente
DELIMITER //
CREATE TRIGGER trg_atualiza_total_pedido
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    UPDATE pedidos
    SET valor_total = (
        SELECT SUM(subtotal)
        FROM itens_pedido
        WHERE id_pedido = NEW.id_pedido
    )
    WHERE id_pedido = NEW.id_pedido;
END; //
DELIMITER ;
