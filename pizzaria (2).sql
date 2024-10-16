drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);
select * from itens_pedido;

/*
select [distinct] <colunas>
from <tabelas>
[where condição]
[group by <colunas>]
having <condições>]
orden by <colunas>]
*/

select * from clientes order by id;
select * from pizzas;
select id,nome,valor from pizzas;
select valor,id,nome from pizzas;
select id as codigo,nome,valor as 'Valor R$' from pizzas;
select 10 + 2,10 - 2, 10/2,10*2;
select 10 + 2 as soma, 10 - 2 as subtracao, 10 / 2 as divisao, 10*2 as multiplicao;
select *, ((valor*10)/100) + valor as "+10%" from pizzas;

alter table pizzas add column custo decimal(15,2);
update pizzas set custo = valor * 0.6;

select * from pizzas where valor > 17;
select * from pizzas where valor >= 17;
select * from pizzas where valor < 17;
select * from pizzas where valor <= 17;
select * from pizzas where valor = 17;
select * from pizzas where valor != 17;
select * from pizzas where valor <> 17;
select * from pizzas where valor is null;
select * from pizzas where valor <=> null;
select * from pizzas where valor >= 15 and valor <= 20;
select * from pizzas where valor between 15 and 20;
select * from pizzas where valor <> 17;
select * from pizzas where valor != 17;
select * from pizzas where not (valor < 17 or valor > 17) ;
select * from pizzas where valor >= 17 and valor <= 20 ;
select * from pizzas where valor between 17 and 20;
select * from pizzas where valor < 17 or valor > 20;
select * from pizzas where not valor not between 17 and 20;
select * from pizzas where not (valor >= 17 and valor <=20) ;
select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15,20,99);
select * from pizzas where valor != 15 and valor !=20;
select * from pizzas where valor not in (15,20);
select * from pizzas where valor is not null;
select * from pizzas where valor > 0 ;
select * from pizzas where nome like 'e%';
select * from pizzas where nome like '%a' ;
select * from pizzas where nome like'%esa%' ;
-- order by <coluna1> [asc/desc] , >coluna 2> [asc/desc];
select * from pizzas order by nome;
select * from pizzas order by nome desc;
select * from pizzas order by valor desc, nome asc;
select * from pizzas order by valor> 17 limit 2;
select * from pizzas order by nome;
select * from pizzas where nome like 'e%' or nome like 'p%';

select * from pizzas order by 1;
select valor as outro, nome from pizzas order by outro;

-- selecionar os valores distintos
select distinct valor from pizzas order by valor;

/* funções de agregação
* Conhecidas como funções estatistícas, as funçoes de agregação obtêm informação sobre conjuntos de linhas especificados
* AVG (coluna) Média dos valores da coluna
* COUNT Número de linhas
* MAX (coluna) Maior valor da coluna
* MIN (coluna) Menor valor da coluna
* SUM (coluna) Soma dos valores da coluna
*/

-- contar quantidades na tabela  
select count(*) from pizzas;
select count(nome) from pizzas;
select count(valor) from pizzas;

-- média do preço das pizzas
-- as é apelido da coluna
select avg(valor) as media from pizzas;
select avg(valor) as media from pizzas where nome like '%esa';

-- Qual é o valor da pizza mais cara do cardápio da pizzaria?
select max(valor) as 'maior valor' from pizzas;

-- Qual é o valor da pizza mais barata do cardápio da pizzaria?
select min(valor) as 'menor valor' from pizzas;

-- Qual é o valor total do pedido número 7?
select sum(valor) from itens_pedido where pedido_id=7;

-- Quantos cada pedido consumiu
select * from itens_pedido;
select pedido_id as pedido, sum(valor) as 'valor pedido' from itens_pedido group by pedido_id;

select pedido_id as pedido, sum(valor) as 'valor pedido', sum(quantidade) as 'qtde pizzas' from itens_pedido group by pedido_id;
select pedido_id as pedido, sum(valor) as 'valor pedido', sum(quantidade) as 'qtde pizzas', avg (valor) as media, sum(valor) / sum(quantidade) as 'valor medio' from itens_pedido group by pedido_id;

-- INNER JOIN: Retorna registros quando há pelo menos uma correspondência em ambas as tabelas
select * from clientes as c inner join pedidos as p on p.cliente_id = c.id;
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes inner join pedidos on pedidos.cliente_id=clientes.id;

-- LEFT JOIN (ou LEFT OUTER JOIN): Retorna todos os registros da tabela da esquerda 
-- (primeira tabela mencionada) e os registros correspondentes da tabela da direita
-- (segunda tabela mencionada).
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes left join pedidos on pedidos.cliente_id=clientes.id;

-- RIGHT JOIN (ou RIGHT OUTER JOIN):Retorna todos os registros da tabela da direita
-- (segunda tabela mencionada) e os registros correspondentes da tabela da esquerda
-- primeira tabela mencionada.
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes right join pedidos on pedidos.cliente_id=clientes.id;
insert into pedidos (id,data, valor) values (9,'2024-10-02',0);


-- Quantidade de pedido(s) realizado(s) por cliente, exibir o nome do cliente e a quantidade de pedidos realizados
select nome, telefone, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id group by nome, telefone;
select * from pedidos;

-- 1. Quantos pedidos foram feitos no total?
select count(*)from pizzas;
-- 2. Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"?
select nome, count(clientes.id) from clientes inner join pedidos on clientes.id where nome='Alexandre Santos';
-- 3. Qual o valor total de todos os pedidos feitos até agora?
select sum(valor) as 'valor total' from itens_pedido;

-- 1. Liste todos os pedidos com o nome do cliente correspondente.

select clientes.nome,pedidos.id from pedidos inner join clientes on clientes.id = pedidos.cliente_id;

-- 2. Quantos pedidos foram feitos no total?

select count(*) as Pedidos from Pedidos;

-- 3. Liste os pedidos feitos após '2016-12-15' com o nome do cliente.

select pedidos.id as pedido, pedidos.data, clientes.nome from pedidos inner join clientes on pedidos.cliente_id = clientes.id where data > '2016-12-15 23:59:59';

-- 4. Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"

select nome, count(clientes.id) from clientes inner join pedidos on clientes.id where nome='Alexandre Santos';

-- 5. Liste todos os pedidos e seus respectivos clientes, incluindo pedidos feitos por clientes que foram excluídos da tabela clientes

select clientes.nome,pedidos.id from pedidos right join clientes on clientes.id = pedidos.cliente_id;

-- 6. Qual o valor total de todos os pedidos feitos até agora?

select sum(valor) as valor_total_pedidos from itens_pedido;

-- 7. Qual o total gasto por cada cliente?

select clientes.id,clientes.nome, sum(valor) from pedidos inner join clientes on clientes.id = pedidos.cliente_id group by nome;
 select * from clientes;
 -- 8. Liste todos os clientes e seus pedidos feitos no mês de dezembro de 2016 (inclua clientes sem pedidos).
 
 select clientes.nome, pedidos.id from clientes inner join pedidos on pedidos.cliente_id = clientes.id where pedidos.data between '2016-12-01' and '2016-12-31 23:59:59';

 -- 9. Qual o valor médio dos pedidos realizados?
 
 select count(pedidos.id) as total_pedidos, avg(valor) as media_valor from pedidos;  
 
 -- 10. Liste o valor total dos pedidos por cliente, incluindo pedidos feitos por clientes que foram excluídos (nome aparecerá como NULL).

select clientes.id,clientes.nome,sum(pedidos.valor) as valor_total from pedidos left join clientes on clientes.id = pedidos.cliente_id group by nome;

-- 11. Qual o valor do pedido mais caro registrado?

select max(valor) as pedido_mais_caro from pedidos;

-- 12. Qual o valor do pedido mais barato registrado?
select min(valor) as pedido_mais_barato from pedidos;

-- 13. Quantos pedidos cada cliente fez (mesmo que não tenham feito nenhum)?

 select clientes.id, clientes.nome, count(pedidos.id) from pedidos right join clientes on clientes.id = pedidos.cliente_id group by nome;
 
 -- 14. Qual o pedido mais caro, exibir o nome do cliente e o valor do pedido.
 
 select nome, valor from pedidos inner join clientes on  clientes.id = pedidos.cliente_id order by valor desc limit 1;
 
 -- 15. Qual a média de pizzas por pedido e quantos pedidos foram feitos?
 
 select count(distinct pedido_id) as pedidos_totais, avg(quantidade) as media_total from itens_pedido; 
 
 -- 16. Qual o total de pizzas vendidas e o número de pedidos do cliente "Bruna Dantas"?
 
select sum(quantidade) as total_pizzas,count(pedidos.id) as total_pedido from itens_pedido inner join pedidos on itens_pedido.pedido_id=pedidos.id inner join clientes on pedidos.cliente_id=clientes.id where clientes.nome= "Bruna Dantas"; 

-- 17. Qual o pedido mais caro e o mais barato do cliente "Laura Madureira"?

select clientes.nome, pedidos.id, max(valor) as maior_valor, min(valor) as menor_valor from pedidos inner join clientes on pedidos.cliente_id=clientes.id where clientes.nome= "Laura Madureira";

-- 18. Quantas pizzas cada cliente comprou no total?

select clientes.nome, sum(quantidade) as total_pizzas from itens_pedido inner join pedidos on itens_pedido.pedido_id=pedidos.id inner join clientes on cliente_id=clientes.id  group by nome;
select * from clientes;
select * from pedidos; 

-- 19. Qual o pedido mais barato, exibir o nome do cliente e o valor do pedido.

 select nome, valor from pedidos inner join clientes on  clientes.id = pedidos.cliente_id order by valor limit 1;

-- 20. Liste todos os clientes, mesmo que não tenham feito pedidos, com seus respectivos pedidos (se houver).

select nome, pedidos.id as pedidos, data, valor from clientes left join pedidos on pedidos.cliente_id=clientes.id;

-- 21. Liste todos os clientes com o valor total de seus pedidos (mesmo que não tenham feito pedidos).

select nome, sum(valor) as valor_total from clientes left join pedidos on  pedidos.cliente_id=clientes.id group by nome;

-- 22. Liste os 3 clientes que mais gastou, exibir nome do cliente e o valor gasto.

select nome, sum(valor) as valor_total from clientes inner join pedidos on  pedidos.cliente_id=clientes.id group by nome order by valor_total desc limit 3;