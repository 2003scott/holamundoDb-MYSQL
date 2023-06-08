create database holamundo;
 
show databases;

use holamundo;

drop table animales;
create table animales(
	id int,
    tipo varchar(255),
    estado varchar(255),
    primary key(id)
);

-- insert into animales (tipo,estado) values ('Chanchito','Feliz');
-- esta linea no sera ejecutada

alter table animales modify column id int auto_increment;

-- select * from animales;

show create table animales;

CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

insert into animales (tipo,estado) values ('Chanchito','Feliz');
insert into animales (tipo,estado) values ('Dragon','Feliz');
insert into animales (tipo,estado) values ('Pollito','Triste');

select * from animales;
select * from animales where id=3;
select * from animales where estado='Feliz' and tipo='Dragon';

update animales set estado = 'Feliz' where id = 3;

select * from animales;

delete from animales where estado = 'Feliz';
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

delete from animales where id = 3;

select * from animales;

update animales set estado = 'triste' where tipo = 'Dragon';
-- esti tambien arroja error 1175


create table user(
	id int not null auto_increment,
    name varchar(50) not null,
    edad int not null,
    email varchar(100) not null,
    primary key(id)
);

insert into user (name,edad,email) values ('Oscar',25,'oscar@gmail.com');
insert into user (name,edad,email) values ('Layla',15,'layla@gmail.com');
insert into user (name,edad,email) values ('Nicolas',36,'nicolas@gmail.com');
insert into user (name,edad,email) values ('Chanchito',7,'chanchito@gmail.com');

select * from user;
select * from user limit 1;
select * from user where edad>15;
select * from user where edad>=15;
select * from user where edad>28 and email = "nicolas@gmail.com";
select * from user where edad > 20 or email = "layla@gmail.com";
select * from user where email != "layla@gmail.com";

select * from user where edad between 15 and 30;

select * from user where email like "%gmail%";
select * from user where email like "%oscar%";

select * from user order by edad asc;
select * from user order by edad desc;

select max(edad) as mayor from user;
select min(edad) as mayor from user;

select id, name from user;
select id,name as nombre from user;

create table products(
	id int not null auto_increment,
    name varchar(50) not null,
    create_by int not null,
    marca varchar(50) not null,
    primary key(id),
    foreign key (create_by) references user(id)
);

rename table products to product;

insert into product (name,create_by,marca) values
("ipad",1,"apple"),
("iphone",1,"apple"),
("watch",2,"apple"),
("macbook",1,"apple"),
("imac",3,"apple"),
("ipad",2,"apple");

select * from product;

select u.id,u.email,p.name from user u left join product p on u.id = p.create_by;

select u.id,u.email,p.name from user u right join product p on u.id = p.create_by;

select u.id, u.email, p.id, p.name from user u cross join product p;

select count(id), marca from product group by marca;

select count(p.id), u.name from product p left join user u on u.id = p.create_by group by p.create_by;

select count(p.id), u.name from product p left join user u on 
u.id = p.create_by group by p.create_by
having count(p.id) >=2;



