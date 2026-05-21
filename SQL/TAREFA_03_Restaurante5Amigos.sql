DROP DATABASE IF EXISTS Restaurante5Amigos;

CREATE DATABASE Restaurante5Amigos
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE Restaurante5Amigos;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    cidade VARCHAR(50),
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
    status_cliente ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo',

    CONSTRAINT chk_cliente_nome
        CHECK (CHAR_LENGTH(nome) >= 3)
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo ENUM('Garçom', 'Caixa', 'Gerente', 'Cozinheiro', 'Atendente') NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    data_admissao DATE NOT NULL,
    status_funcionario ENUM('Ativo', 'Afastado', 'Desligado') NOT NULL DEFAULT 'Ativo',

    CONSTRAINT chk_funcionario_nome
        CHECK (CHAR_LENGTH(nome) >= 3)
);

CREATE TABLE mesas (
    id_mesa INT PRIMARY KEY AUTO_INCREMENT,
    numero_mesa INT NOT NULL UNIQUE,
    capacidade INT NOT NULL,
    status_mesa ENUM('Livre', 'Ocupada', 'Reservada', 'Inativa') NOT NULL DEFAULT 'Livre',

    CONSTRAINT chk_mesa_capacidade
        CHECK (capacidade > 0)
);

CREATE TABLE categorias_produto (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(60) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    nome_produto VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    disponibilidade ENUM('Disponível', 'Indisponível') NOT NULL DEFAULT 'Disponível',

    CONSTRAINT chk_produto_preco
        CHECK (preco > 0),

    CONSTRAINT chk_produto_estoque
        CHECK (estoque >= 0),

    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias_produto(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_mesa INT NOT NULL,
    data_reserva DATE NOT NULL,
    hora_reserva TIME NOT NULL,
    quantidade_pessoas INT NOT NULL,
    status_reserva ENUM('Agendada', 'Confirmada', 'Cancelada', 'Concluída') NOT NULL DEFAULT 'Agendada',
    observacao VARCHAR(255),

    CONSTRAINT chk_reserva_qtd_pessoas
        CHECK (quantidade_pessoas > 0),

    CONSTRAINT fk_reserva_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_reserva_mesa
        FOREIGN KEY (id_mesa)
        REFERENCES mesas(id_mesa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_mesa INT NOT NULL,
    data_pedido DATE NOT NULL DEFAULT (CURRENT_DATE),
    hora_pedido TIME NOT NULL DEFAULT (CURRENT_TIME),
    status_pedido ENUM('Aberto', 'Em preparo', 'Finalizado', 'Cancelado', 'Pago') NOT NULL DEFAULT 'Aberto',
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT chk_pedido_valor_total
        CHECK (valor_total >= 0),

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_pedido_funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_pedido_mesa
        FOREIGN KEY (id_mesa)
        REFERENCES mesas(id_mesa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE itens_pedido (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED,

    PRIMARY KEY (id_pedido, id_produto),

    CONSTRAINT chk_item_quantidade
        CHECK (quantidade > 0),

    CONSTRAINT chk_item_preco_unitario
        CHECK (preco_unitario > 0),

    CONSTRAINT fk_item_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_item_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL UNIQUE,
    forma_pagamento ENUM('Dinheiro', 'Pix', 'Cartão de Crédito', 'Cartão de Débito') NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL DEFAULT (CURRENT_DATE),
    hora_pagamento TIME NOT NULL DEFAULT (CURRENT_TIME),
    status_pagamento ENUM('Pendente', 'Aprovado', 'Recusado', 'Estornado') NOT NULL DEFAULT 'Pendente',

    CONSTRAINT chk_pagamento_valor
        CHECK (valor_pago >= 0),

    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE INDEX idx_cliente_nome
ON clientes(nome);

CREATE INDEX idx_produto_nome
ON produtos(nome_produto);

CREATE INDEX idx_pedido_data
ON pedidos(data_pedido);

CREATE INDEX idx_pedido_cliente
ON pedidos(id_cliente);

CREATE INDEX idx_pedido_funcionario
ON pedidos(id_funcionario);

CREATE INDEX idx_reserva_data_hora
ON reservas(data_reserva, hora_reserva);

CREATE INDEX idx_pagamento_status
ON pagamentos(status_pagamento);
