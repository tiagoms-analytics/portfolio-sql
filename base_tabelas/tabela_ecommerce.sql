CREATE DATABASE e_commerce;

use e_commerce;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    email VARCHAR(150)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(150),
    categoria VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    data_venda DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_venda (
    id_item INT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);



INSERT INTO clientes SELECT * FROM clientes_backup;
INSERT INTO produtos SELECT * FROM produtos_backup;
INSERT INTO vendas SELECT * FROM vendas_backup;
INSERT INTO itens_venda SELECT * FROM itens_venda_200;

ALTER TABLE vendas
ADD COLUMN data_hora_venda TIMESTAMP;

/*
1. Preencher com base na data_venda

Se quiser “simular” horários, pode atualizar a nova coluna pegando a data.
Já existente e adicionando uma hora aleatória (ou fixa). Exemplo no MySQL:
*/
UPDATE vendas
SET data_hora_venda = data_venda + INTERVAL FLOOR(RAND() * 24) HOUR;
-- inclusão para estudos
ALTER TABLE itens_venda
ADD COLUMN valor_desconto_item DECIMAL(10,2);

-- novas inserções

-- Garante que a coluna exista para o próximo INSERT
ALTER TABLE itens_venda
ADD COLUMN valor_desconto_item DECIMAL(10,2);

-- I. DESATIVA CHECAGENS DE SEGURANÇA para evitar FK/PK
SET SQL_SAFE_UPDATES = 0; 
SET FOREIGN_KEY_CHECKS = 0; 

-- II. INSERÇÃO DE NOVOS ITENS DE VENDA COM DESCONTO
-- Usando IDs de item (10, 11, 12, 13) que não conflitam com seu backup.
-- II. INSERÇÃO DE NOVOS ITENS DE VENDA COM DESCONTO
-- Usando IDs de item (9010, 9011, etc.) para garantir que não haverá conflito.
INSERT INTO itens_venda (id_item, id_venda, id_produto, quantidade, valor_desconto_item) VALUES
(9010, 1001, 201, 2, 10.00),  -- Vincula-se à Venda 1001 (que deve existir)
(9011, 1001, 202, 1, 0.00),   
(9012, 1003, 203, 5, 25.00),  -- Vincula-se à Venda 1003 (que deve existir)
(9013, 1003, 204, 3, 15.00); 

-- III. REATIVA AS CHECAGENS DE SEGURANÇA
SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS = 1;





-- 1. DESATIVA CHECAGENS DE SEGURANÇA
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;

-- 2. LIMPA TUDO (TRUNCATE)
TRUNCATE TABLE itens_venda;
TRUNCATE TABLE vendas;
TRUNCATE TABLE produtos;
TRUNCATE TABLE clientes;

-- 3. INSERE DADOS NOVOS E VÁLIDOS (Obrigatório para o teste)
-- CLIENTES
INSERT INTO clientes (id_cliente, nome, cidade, email) VALUES
(101, 'Ana Silva', 'São Paulo', 'ana.s@email.com'),
(102, 'Bruno Costa', 'Rio de Janeiro', 'bruno.c@email.com');

-- PRODUTOS (IDs 201 e 202)
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES
(201, 'Mouse Gamer', 'Perifericos', 150.00),
(202, 'Teclado Mecânico', 'Perifericos', 450.00);

-- VENDAS (AQUI ESTÁ A CORREÇÃO DA DATA)
INSERT INTO vendas (id_venda, id_cliente, data_venda, valor_total) VALUES
(1001, 101, '2025-01-10', 500.00), -- Venda em Janeiro/2025
(1002, 102, '2025-02-15', 1200.00); -- Venda em Fevereiro/2025

-- ITENS VENDA (Com os IDs corretos)
INSERT INTO itens_venda (id_item, id_venda, id_produto, quantidade) VALUES
(1, 1001, 201, 2),
(2, 1002, 202, 1);


-- DADOS PARA CLIENTES (Novos IDs 103 e 104)
INSERT INTO clientes (id_cliente, nome, cidade, email) VALUES
(101, 'Ana Silva', 'São Paulo', 'ana.s@email.com'),
(102, 'Bruno Costa', 'Rio de Janeiro', 'bruno.c@email.com'),
(103, 'Carla Diaz', 'São Paulo', 'carla.d@email.com'),
(104, 'Davi Lima', 'Belo Horizonte', 'davi.l@email.com');

-- DADOS PARA PRODUTOS (Novos IDs 203, 204, 205, 206)
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES
(203, 'Monitor Ultrawide', 'Eletronicos', 1800.00),
(204, 'Caderno Pautado', 'Papelaria', 30.00),
(205, 'Caneta Gel Azul', 'Papelaria', 12.00),
(206, 'Fone Bluetooth', 'Eletronicos', 500.00);

-- DADOS PARA VENDAS (Novos IDs 1003, 1004, 1005)
INSERT INTO vendas (id_venda, id_cliente, data_venda, valor_total) VALUES
(1003, 101, '2025-10-06', 450.00),  -- Ana (SP) - Duas compras no mesmo dia (Importante para Ex. 5)
(1004, 102, '2025-10-05', 1830.00), -- Bruno (RJ)
(1005, 103, '2025-10-04', 12.00),   -- Carla (SP)
(1006, 104, '2025-10-04', 500.00);  -- Davi (BH)

-- DADOS PARA ITENS_VENDA (Novos IDs 3 a 6)
-- Incluindo descontos para testar o Exercício 3
INSERT INTO itens_venda (id_item, id_venda, id_produto, quantidade, valor_desconto_item) VALUES
(3, 1003, 202, 1, 0.00),    -- Sem desconto
(4, 1004, 203, 1, 5.00),    -- COM desconto (Para Ex. 3)
(5, 1005, 205, 1, 0.00),    -- Sem desconto
(6, 1006, 206, 1, 10.00);   -- COM desconto (Para Ex. 3)
-- 4. REATIVA CHECAGENS DE SEGURANÇA
SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS = 1;

