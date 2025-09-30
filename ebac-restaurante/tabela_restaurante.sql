/* 
Scripts para criação do banco de dados 'restaurante'
e suas tabelas principais (clientes, funcionarios, produtos e pedidos).

Obs: Nomes de tabelas e colunas foram padronizados para minúsculas e sem acentos.
 */
CREATE database restaurante;

use restaurante;

-- criando tabela funcionarios
CREATE table funcionários (
   id_funcionario int auto_increment primary key,
   nome varchar (255) not null,
   CPF  varchar (14) not null unique,
   data_nascimento date,
   endereco varchar (255),
   telefone varchar (15),
   email varchar (100) unique,
   cargo varchar (100),
   salário decimal (10,  2),  
  data_admissao date
);
-- exemplo de como renomear a tabela

RENAME TABLE funcionários TO funcionarios;

-- exemplo de como alterar o nome da coluna
ALTER TABLE funcionarios RENAME COLUMN `salário` TO `salario`;

-- criando tabela clientes
CREATE table clientes (
   id_cliente int auto_increment primary key,
   nome varchar (255) not null,
   CPF  varchar (14) not null unique,
   data_nascimento date,
   endereco varchar (255),
   telefone varchar (15),
   email varchar (100) unique,
   data_cadastro date
);

-- criando tabela produtos
CREATE table produtos (
   id_produto int auto_increment primary key,
   nome varchar (255) not null,
   descricao text,
   preço decimal (10, 2),
   categoria varchar (100)
);

-- exemplo como renomear a coluna preco

ALTER TABLE produtos RENAME COLUMN `preço` TO `preco`;

-- criando a tabela pedidos e suas chaves estrangeiras

create table pedidos (
   id_pedido int auto_increment primary key,
   id_cliente int,  
   id_funcionario int,
   id_produto int,
   quantidade int,
   preço decimal (10,  2),
   data_pedido date,
   status_pedidos varchar (50),
   foreign key (id_cliente) REFERENCES clientes(id_cliente),
   foreign key (id_funcionario) references funcionarios (id_funcionario),
   foreign key (id_produto) references produtos (id_produto)
);

-- criando a tabela info_produtos e suas chaves estrangeiras

create table info_produtos (
id_info int auto_increment primary key,
id_produto int,
ingredientes text,
fornecedor varchar (255),
foreign key (id_produto) references produtos (id_produto)
);




