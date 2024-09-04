create database instagram;

use instagram;

create table usuarios (
id int not null unique auto_increment primary key,
nome varchar(50) not null unique,
email varchar(100) not null unique,
criacao date
);

create table postagem(
id int not null unique auto_increment primary key,
texto varchar(50),
criacao date ,
imagem varchar(45),
foreign key (usuarios_id) references usuarios(id)
);

create table comentarios(
texto varchar(100),
criacao date,
foreign key (usuarios_id) references usuarios(id),
foreign key (postagens_id) references postagens(id)

);

create table curtidas (
foreign key (usuarios_id) references usuarios(id),
foreign key (postagens_id) references postagens(id)
);