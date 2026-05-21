# Restaurante 5 Amigos - Sistema de Banco de Dados

![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=postgresql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Concluído-success?style=for-the-badge)

Este repositório contém a modelagem, os scripts de criação, a carga inicial de dados e as consultas SQL para o banco de dados relacional do Restaurante 5 Amigos. O sistema foi projetado para gerenciar operações completas de um estabelecimento gastronômico, garantindo integridade de dados e alta performance.


## Pré-requisitos e Execução

Para rodar este projeto na sua máquina, você precisará de um SGBD (Sistema Gerenciador de Banco de Dados) compatível com a sintaxe MySQL/MariaDB.

Ordem de execução dos scripts:
1. Execute `TAREFA_03_Restaurante5Amigos.sql` para criar o banco de dados, as tabelas, as restrições e os índices.
2. Execute `TAREFA_04_Insercao_Dados.sql` para popular o banco com a carga de dados inicial (clientes, cardápio, pedidos, etc.).
3. Utilize `TAREFA_05_Consultas_SQL.sql` para testar as queries de relatório e análise de dados.


## Arquitetura do Banco de Dados

O banco é estruturado em 8 tabelas, divididas entre entidades de domínio (cadastros) e tabelas de transação (movimentações).

| Tabela | Tipo | Descrição |
| :--- | :--- | :--- |
| `clientes` | Cadastro | Dados dos consumidores (Nome, CPF, Contato, Status). |
| `funcionarios` | Cadastro | Equipe do restaurante dividida por cargos operacionais e gerenciais. |
| `mesas` | Cadastro | Controle de infraestrutura, capacidade de assentos e status atual. |
| `categorias_produto` | Cadastro | Classificação do cardápio (Entradas, Pratos Principais, Bebidas, etc). |
| `produtos` | Cadastro | Itens do cardápio, com controle de estoque, precificação e disponibilidade. |
| `reservas` | Transação | Agendamentos feitos pelos clientes, vinculados às mesas e datas específicas. |
| `pedidos` | Transação | Relaciona o cliente, o garçom e a mesa em um único atendimento. |
| `itens_pedido` | Transação | Tabela N:N que armazena os produtos de cada pedido com cálculo automático de subtotal. |
| `pagamentos` | Transação | Gestão financeira de cada pedido (Pix, Cartão, Dinheiro) e controle de aprovação. |


## Integridade e Regras de Negócio (Constraints)

O projeto utiliza amplamente os recursos de segurança do SQL para garantir a consistência das informações:

Validações (`CHECK`): Impede a inserção de valores inválidos. Exemplo: Preços e quantidades devem ser `> 0`, estoques devem ser `>= 0`, e nomes de clientes/funcionários devem ter no mínimo 3 caracteres.
Valores Padrão (`DEFAULT`): Automatização de campos de auditoria, como `CURRENT_DATE` para data de cadastro de clientes e pedidos.
Integridade Referencial (`FOREIGN KEY`): Uso de `ON UPDATE CASCADE` para sincronia de IDs.
Uso de `ON DELETE RESTRICT` em dados sensíveis para evitar a exclusão acidental de histórico de vendas.
Uso de `ON DELETE CASCADE` na tabela `itens_pedido` para limpeza automática caso um pedido principal seja removido.


## Otimização (Índices)

Para garantir escalabilidade e consultas rápidas mesmo com alto volume de dados, foram implementados índices (`CREATE INDEX`) nas seguintes colunas estratégicas:
* Nomes de clientes e produtos (para buscas textuais rápidas).
* Datas de pedidos e reservas (para geração ágil de relatórios temporais).
* Chaves estrangeiras de clientes e funcionários na tabela de pedidos.
* Status de pagamento (para conciliação financeira).


## Consultas SQL e Relatórios

O script de consultas contempla 12 queries que extraem inteligência de negócio do sistema, abrangendo:

Buscas Simples: Filtragem de produtos disponíveis em estoque.
Junções (JOINs): Consultas complexas unindo 3 ou mais tabelas para exibir o detalhamento completo dos pedidos (Cliente, Funcionário, Mesa e Status).
Agregações (`GROUP BY`): Cálculo de métricas como faturamento total, ticket médio, quantidade de pedidos por status e receita gerada por forma de pagamento.
Subconsultas (`Subqueries`): Identificação de pedidos que superaram o ticket médio do restaurante.
Rankings: Listagem dos produtos mais vendidos e dos clientes com maior volume de consumo.