-- VIEW: Resumo de Faturamento por Cliente
CREATE VIEW vw_faturamento_clientes AS
SELECT 
    c.nome, 
    COUNT(p.id_pedido) as total_pedidos, 
    SUM(p.valor_total) as total_gasto
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.status_pedido = 'Pago'
GROUP BY c.id_cliente;
