## 1. Consulta simples com SELECT

sql
SELECT 
    id_cliente,
    nome,
    telefone,
    email,
    cidade
FROM clientes;


*Explicação:*
Retorna a lista básica de clientes cadastrados no sistema, exibindo identificação, nome, telefone, e-mail e cidade.

---

## 2. Consulta com WHERE

sql
SELECT 
    id_produto,
    nome_produto,
    preco,
    estoque,
    disponibilidade
FROM produtos
WHERE disponibilidade = 'Disponível'
  AND estoque > 0;


*Explicação:*
Retorna apenas os produtos disponíveis no cardápio e que ainda possuem estoque.

---

## 3. Consulta com ORDER BY

sql
SELECT 
    id_produto,
    nome_produto,
    preco
FROM produtos
ORDER BY preco DESC;


*Explicação:*
Lista os produtos do maior para o menor preço, permitindo identificar os itens mais caros do cardápio.

---

## 4. JOIN entre duas tabelas

sql
SELECT 
    p.id_pedido,
    c.nome AS cliente,
    p.data_pedido,
    p.hora_pedido,
    p.status_pedido,
    p.valor_total
FROM pedidos p
INNER JOIN clientes c 
    ON p.id_cliente = c.id_cliente;


*Explicação:*
Retorna os pedidos com o nome do cliente responsável. Essa consulta demonstra o relacionamento *CLIENTE 1:N PEDIDO*.

---

## 5. JOIN entre três ou mais tabelas

sql
SELECT 
    p.id_pedido,
    c.nome AS cliente,
    f.nome AS funcionario,
    m.numero_mesa,
    p.data_pedido,
    p.status_pedido,
    p.valor_total
FROM pedidos p
INNER JOIN clientes c 
    ON p.id_cliente = c.id_cliente
INNER JOIN funcionarios f 
    ON p.id_funcionario = f.id_funcionario
INNER JOIN mesas m 
    ON p.id_mesa = m.id_mesa
ORDER BY p.data_pedido, p.hora_pedido;


*Explicação:*
Retorna uma visão completa dos pedidos, mostrando cliente, funcionário responsável, mesa utilizada, data, status e valor total.

---

## 6. Consulta com função agregada

sql
SELECT 
    COUNT(*) AS total_pedidos,
    SUM(valor_total) AS faturamento_registrado,
    AVG(valor_total) AS ticket_medio,
    MIN(valor_total) AS menor_valor_pedido,
    MAX(valor_total) AS maior_valor_pedido
FROM pedidos
WHERE status_pedido <> 'Cancelado';


*Explicação:*
Calcula indicadores gerais dos pedidos não cancelados: quantidade de pedidos, faturamento total, ticket médio, menor valor e maior valor.

---

## 7. Consulta com GROUP BY

sql
SELECT 
    status_pedido,
    COUNT(*) AS quantidade_pedidos,
    SUM(valor_total) AS total_por_status
FROM pedidos
GROUP BY status_pedido
ORDER BY quantidade_pedidos DESC;


*Explicação:*
Agrupa os pedidos por status, permitindo analisar quantos pedidos estão pagos, abertos, cancelados, finalizados ou em preparo.

---

## 8. Consulta com GROUP BY e JOIN

sql
SELECT 
    c.nome AS cliente,
    COUNT(p.id_pedido) AS quantidade_pedidos,
    SUM(p.valor_total) AS valor_total_consumido
FROM clientes c
INNER JOIN pedidos p 
    ON c.id_cliente = p.id_cliente
WHERE p.status_pedido <> 'Cancelado'
GROUP BY c.id_cliente, c.nome
ORDER BY valor_total_consumido DESC;


*Explicação:*
Mostra quanto cada cliente consumiu no restaurante, desconsiderando pedidos cancelados. Essa consulta é útil para identificar clientes mais frequentes ou de maior valor.

---

## 9. Consulta com subconsulta

sql
SELECT 
    id_pedido,
    id_cliente,
    data_pedido,
    valor_total
FROM pedidos
WHERE valor_total > (
    SELECT AVG(valor_total)
    FROM pedidos
    WHERE status_pedido <> 'Cancelado'
);


*Explicação:*
Retorna os pedidos cujo valor total é maior que a média dos pedidos não cancelados.

---

## 10. Consulta com cálculo ou regra de negócio

sql
SELECT 
    ip.id_pedido,
    pr.nome_produto,
    ip.quantidade,
    ip.preco_unitario,
    ip.subtotal,
    (ip.quantidade * ip.preco_unitario) AS subtotal_calculado
FROM itens_pedido ip
INNER JOIN produtos pr 
    ON ip.id_produto = pr.id_produto;


*Explicação:*
Demonstra a regra de negócio do subtotal do item:

text
subtotal = quantidade × preço unitário


Essa consulta permite validar se o valor gravado/calculado no banco está coerente com a regra de negócio.

---

## 11. Consulta de produtos mais vendidos

sql
SELECT 
    pr.id_produto,
    pr.nome_produto,
    SUM(ip.quantidade) AS quantidade_total_vendida,
    SUM(ip.subtotal) AS receita_total_produto
FROM itens_pedido ip
INNER JOIN produtos pr 
    ON ip.id_produto = pr.id_produto
INNER JOIN pedidos p
    ON ip.id_pedido = p.id_pedido
WHERE p.status_pedido <> 'Cancelado'
GROUP BY pr.id_produto, pr.nome_produto
ORDER BY quantidade_total_vendida DESC;


*Explicação:*
Retorna os produtos mais vendidos, somando as quantidades vendidas e a receita gerada por produto.

---

## 12. Consulta de faturamento por forma de pagamento

sql
SELECT 
    forma_pagamento,
    COUNT(id_pagamento) AS quantidade_pagamentos,
    SUM(valor_pago) AS total_recebido
FROM pagamentos
WHERE status_pagamento = 'Aprovado'
GROUP BY forma_pagamento
ORDER BY total_recebido DESC;


*Explicação:*
Agrupa os pagamentos aprovados por forma de pagamento, mostrando quanto foi recebido em Pix, dinheiro, crédito ou débito.