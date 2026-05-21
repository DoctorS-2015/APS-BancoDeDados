USE Restaurante5Amigos;

-- ==========================================================
-- INSERÇÃO DE CLIENTES
-- ==========================================================

INSERT INTO clientes 
(nome, cpf, telefone, email, cidade, data_cadastro, status_cliente)
VALUES
('João Henrique Silva', '111.222.333-44', '(85) 98888-1001', 'joao.silva@email.com', 'Fortaleza', '2025-03-01', 'Ativo'),
('Mariana Costa Lima', '222.333.444-55', '(85) 98888-1002', 'mariana.lima@email.com', 'Caucaia', '2025-03-05', 'Ativo'),
('Carlos Eduardo Rocha', '333.444.555-66', '(85) 98888-1003', 'carlos.rocha@email.com', 'Maracanaú', '2025-03-08', 'Ativo'),
('Ana Beatriz Moura', '444.555.666-77', '(85) 98888-1004', 'ana.moura@email.com', 'Fortaleza', '2025-03-10', 'Ativo'),
('Ricardo Alves Pereira', '555.666.777-88', '(85) 98888-1005', 'ricardo.pereira@email.com', 'Eusébio', '2025-03-12', 'Ativo'),
('Fernanda Gomes Martins', '666.777.888-99', '(85) 98888-1006', 'fernanda.gomes@email.com', 'Fortaleza', '2025-03-15', 'Inativo');

-- ==========================================================
-- INSERÇÃO DE FUNCIONÁRIOS
-- ==========================================================

INSERT INTO funcionarios
(nome, cargo, telefone, email, data_admissao, status_funcionario)
VALUES
('Paulo Sérgio Almeida', 'Garçom', '(85) 97777-2001', 'paulo.almeida@restaurante5amigos.com', '2024-01-15', 'Ativo'),
('Camila Nogueira Sousa', 'Caixa', '(85) 97777-2002', 'camila.sousa@restaurante5amigos.com', '2024-02-01', 'Ativo'),
('Roberto Lima Ferreira', 'Gerente', '(85) 97777-2003', 'roberto.ferreira@restaurante5amigos.com', '2023-08-10', 'Ativo'),
('Larissa Teixeira Costa', 'Garçom', '(85) 97777-2004', 'larissa.costa@restaurante5amigos.com', '2024-04-20', 'Ativo'),
('Márcio Vinícius Castro', 'Cozinheiro', '(85) 97777-2005', 'marcio.castro@restaurante5amigos.com', '2023-11-05', 'Ativo'),
('Juliana Andrade Melo', 'Atendente', '(85) 97777-2006', 'juliana.melo@restaurante5amigos.com', '2024-05-12', 'Afastado');

-- ==========================================================
-- INSERÇÃO DE MESAS
-- ==========================================================

INSERT INTO mesas
(numero_mesa, capacidade, status_mesa)
VALUES
(1, 2, 'Livre'),
(2, 4, 'Ocupada'),
(3, 4, 'Reservada'),
(4, 6, 'Livre'),
(5, 8, 'Ocupada'),
(6, 2, 'Inativa'),
(7, 6, 'Livre');

-- ==========================================================
-- INSERÇÃO DE CATEGORIAS DE PRODUTO
-- ==========================================================

INSERT INTO categorias_produto
(nome_categoria, descricao)
VALUES
('Entrada', 'Pratos leves servidos antes do prato principal'),
('Prato Principal', 'Refeições principais do restaurante'),
('Bebida', 'Bebidas naturais, refrigerantes e sucos'),
('Sobremesa', 'Doces e sobremesas servidos após as refeições'),
('Acompanhamento', 'Porções complementares aos pratos principais');

-- ==========================================================
-- INSERÇÃO DE PRODUTOS
-- ==========================================================

INSERT INTO produtos
(id_categoria, nome_produto, descricao, preco, estoque, disponibilidade)
VALUES
(1, 'Bolinho de Carne de Sol', 'Porção com 8 unidades de bolinho artesanal', 28.90, 40, 'Disponível'),
(1, 'Tábua de Queijos Regionais', 'Seleção de queijos regionais com geleia da casa', 39.90, 20, 'Disponível'),
(2, 'Filé de Frango Grelhado', 'Filé de frango com arroz, salada e batata rústica', 34.90, 35, 'Disponível'),
(2, 'Picanha Sertaneja', 'Picanha com baião de dois, farofa e vinagrete', 72.90, 18, 'Disponível'),
(2, 'Peixe ao Molho de Camarão', 'Filé de peixe grelhado com molho especial de camarão', 64.90, 15, 'Disponível'),
(3, 'Suco Natural de Laranja', 'Suco natural preparado na hora', 9.90, 60, 'Disponível'),
(3, 'Refrigerante Lata', 'Refrigerante lata 350ml', 7.50, 80, 'Disponível'),
(3, 'Água Mineral', 'Água mineral sem gás 500ml', 4.50, 100, 'Disponível'),
(4, 'Pudim da Casa', 'Pudim tradicional com calda de caramelo', 14.90, 25, 'Disponível'),
(4, 'Brownie com Sorvete', 'Brownie quente servido com sorvete de creme', 22.90, 18, 'Disponível'),
(5, 'Batata Rústica', 'Porção de batata rústica com molho especial', 21.90, 30, 'Disponível'),
(5, 'Baião de Dois Extra', 'Porção extra de baião de dois', 18.90, 22, 'Disponível');

-- ==========================================================
-- INSERÇÃO DE RESERVAS
-- Tabela de movimentação com mais de 10 registros.
-- ==========================================================

INSERT INTO reservas
(id_cliente, id_mesa, data_reserva, hora_reserva, quantidade_pessoas, status_reserva, observacao)
VALUES
(1, 3, '2025-04-01', '19:00:00', 4, 'Confirmada', 'Reserva para jantar em família'),
(2, 4, '2025-04-01', '20:00:00', 5, 'Agendada', 'Cliente solicitou mesa próxima à janela'),
(3, 1, '2025-04-02', '18:30:00', 2, 'Concluída', 'Reserva compareceu no horário'),
(4, 5, '2025-04-02', '21:00:00', 8, 'Confirmada', 'Comemoração de aniversário'),
(5, 7, '2025-04-03', '19:30:00', 6, 'Agendada', 'Reserva para grupo de amigos'),
(1, 2, '2025-04-04', '20:30:00', 4, 'Cancelada', 'Cliente cancelou por telefone'),
(2, 1, '2025-04-05', '18:00:00', 2, 'Concluída', 'Atendimento realizado normalmente'),
(3, 4, '2025-04-05', '19:00:00', 6, 'Confirmada', 'Solicitou cadeira infantil'),
(4, 3, '2025-04-06', '20:00:00', 4, 'Agendada', 'Mesa reservada para casal e convidados'),
(5, 5, '2025-04-06', '21:30:00', 7, 'Confirmada', 'Grupo empresarial'),
(6, 7, '2025-04-07', '19:45:00', 6, 'Cancelada', 'Cliente inativo realizou cancelamento');

-- ==========================================================
-- INSERÇÃO DE PEDIDOS
-- Tabela de movimentação com mais de 10 registros.
-- ==========================================================

INSERT INTO pedidos
(id_cliente, id_funcionario, id_mesa, data_pedido, hora_pedido, status_pedido, valor_total)
VALUES
(1, 1, 2, '2025-04-01', '19:15:00', 'Pago', 113.20),
(2, 4, 4, '2025-04-01', '20:20:00', 'Pago', 128.30),
(3, 1, 1, '2025-04-02', '18:45:00', 'Pago', 48.90),
(4, 4, 5, '2025-04-02', '21:10:00', 'Finalizado', 211.60),
(5, 1, 7, '2025-04-03', '19:40:00', 'Em preparo', 159.20),
(1, 4, 2, '2025-04-04', '20:40:00', 'Cancelado', 0.00),
(2, 1, 1, '2025-04-05', '18:15:00', 'Pago', 87.30),
(3, 4, 4, '2025-04-05', '19:10:00', 'Pago', 177.70),
(4, 1, 3, '2025-04-06', '20:15:00', 'Aberto', 57.70),
(5, 4, 5, '2025-04-06', '21:45:00', 'Pago', 246.40),
(6, 1, 7, '2025-04-07', '19:55:00', 'Pago', 72.30),
(1, 4, 4, '2025-04-08', '20:10:00', 'Pago', 104.60);

-- ==========================================================
-- INSERÇÃO DE ITENS DOS PEDIDOS
-- Relaciona pedidos e produtos.
-- Tabela intermediária do relacionamento N:N.
-- O subtotal é calculado automaticamente.
-- ==========================================================

INSERT INTO itens_pedido
(id_pedido, id_produto, quantidade, preco_unitario)
VALUES
-- Pedido 1: total 113.20
(1, 1, 1, 28.90),
(1, 3, 2, 34.90),
(1, 6, 1, 9.90),
(1, 8, 1, 4.50),

-- Pedido 2: total 128.30
(2, 4, 1, 72.90),
(2, 11, 1, 21.90),
(2, 6, 2, 9.90),
(2, 9, 1, 14.90),

-- Pedido 3: total 48.90
(3, 3, 1, 34.90),
(3, 6, 1, 9.90),
(3, 8, 1, 4.10),

-- Pedido 4: total 211.60
(4, 4, 2, 72.90),
(4, 11, 2, 21.90),
(4, 7, 2, 7.50),
(4, 10, 1, 22.90),

-- Pedido 5: total 159.20
(5, 5, 2, 64.90),
(5, 12, 1, 18.90),
(5, 6, 1, 9.90),
(5, 8, 1, 0.60),

-- Pedido 7: total 87.30
(7, 2, 1, 39.90),
(7, 3, 1, 34.90),
(7, 7, 1, 7.50),
(7, 8, 1, 5.00),

-- Pedido 8: total 177.70
(8, 4, 1, 72.90),
(8, 5, 1, 64.90),
(8, 6, 1, 9.90),
(8, 9, 2, 14.90),

-- Pedido 9: total 57.70
(9, 1, 1, 28.90),
(9, 11, 1, 21.90),
(9, 8, 1, 6.90),

-- Pedido 10: total 246.40
(10, 4, 2, 72.90),
(10, 5, 1, 64.90),
(10, 11, 1, 21.90),
(10, 10, 1, 22.90),

-- Pedido 11: total 72.30
(11, 3, 1, 34.90),
(11, 12, 1, 18.90),
(11, 6, 1, 9.90),
(11, 8, 2, 4.30),

-- Pedido 12: total 104.60
(12, 5, 1, 64.90),
(12, 6, 1, 9.90),
(12, 9, 2, 14.90);

-- ==========================================================
-- INSERÇÃO DE PAGAMENTOS
-- Cada pagamento está associado a um pedido.
-- Pedidos cancelados ou ainda abertos/em preparo podem não ter pagamento.
-- ==========================================================

INSERT INTO pagamentos
(id_pedido, forma_pagamento, valor_pago, data_pagamento, hora_pagamento, status_pagamento)
VALUES
(1, 'Pix', 113.20, '2025-04-01', '20:05:00', 'Aprovado'),
(2, 'Cartão de Crédito', 128.30, '2025-04-01', '21:10:00', 'Aprovado'),
(3, 'Dinheiro', 48.90, '2025-04-02', '19:20:00', 'Aprovado'),
(7, 'Cartão de Débito', 87.30, '2025-04-05', '19:00:00', 'Aprovado'),
(8, 'Pix', 177.70, '2025-04-05', '20:15:00', 'Aprovado'),
(10, 'Cartão de Crédito', 246.40, '2025-04-06', '22:40:00', 'Aprovado'),
(11, 'Dinheiro', 72.30, '2025-04-07', '20:45:00', 'Aprovado'),
(12, 'Pix', 104.60, '2025-04-08', '21:00:00', 'Aprovado'),
(4, 'Cartão de Crédito', 211.60, '2025-04-02', '22:05:00', 'Pendente'),
(5, 'Pix', 159.20, '2025-04-03', '20:30:00', 'Pendente');