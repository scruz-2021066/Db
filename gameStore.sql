drop database if exists tienda_de_juegos;
create database tienda_de_juegos;
use tienda_de_juegos;

create table roles( 
id_rol integer not null auto_increment,
descripcion_rol varchar(25) not null,
primary key(id_rol));

create table generos( 
id_genero integer not null auto_increment,
tipo_genero varchar(50), 
primary key(id_genero));

create table suscripciones( 
id_suscripcion integer not null auto_increment,
tipo_suscripcion varchar(25),
primary key(id_suscripcion));

create table empresas_desarrolladoras( 
id integer auto_increment not null,
nombre_desarrolladora varchar(50) not null,
primary key(id));

create table distribuidoras( 
id integer auto_increment not null,
nombre_distribuidora varchar(50),
primary key(id));

create table personas( 
id_persona integer auto_increment not null,
nombre1 varchar(20),
nombre2 varchar(20),
nombre3 varchar(20),
apellido1 varchar(20),
apellido2 varchar(20),
email varchar(45),
fecha_nacimiento date,
telefono varchar(8),
direccion varchar(150),
primary key(id_persona));

create table empleados( 
id_empleado integer auto_increment not null,
persona_id integer,
primary key(id_empleado),
foreign key(persona_id) references personas(id_persona));

create table usuarios( 
user integer,
pass varchar(50) not null,
correo_electronico varchar(50),
persona_id integer,
rol_id integer,
primary key(user),
foreign key(rol_id) references roles(id_rol),
foreign key(persona_id) references personas(id_persona));

create table juegos( 
id_juego integer auto_increment not null,
nombre_juego varchar(50),
fecha_lanzamiento year,
precio integer,
desarrolladora_id integer,
distribuidora_id integer,
genero_id integer,
primary key(id_juego),
foreign key(desarrolladora_id) references empresas_desarrolladoras(id),
foreign key(distribuidora_id) references distribuidoras(id),
foreign key(genero_id) references generos(id_genero));

create table clientes( 
id_cliente integer auto_increment not null,
nit varchar(10),
persona_id integer,
suscripcion_id integer,
primary key(id_cliente),
foreign key(persona_id) references personas(id_persona),
foreign key(suscripcion_id) references suscripciones(id_suscripcion));

create table listas_deseados( 
id_lista integer not null auto_increment,
juego_id integer,
fecha_agregado date,
cliente_id integer,
primary key(id_lista),
foreign key(juego_id) references juegos(id_juego),
foreign key(cliente_id) references clientes(id_cliente));

insert into roles(descripcion_rol)
values("Administrador");
insert into roles(descripcion_rol)
values("Usuario");

insert into generos(tipo_genero)
values("Acción");
insert into generos(tipo_genero)
values("Acción Roguelike");
insert into generos(tipo_genero)
values("Aventura");
insert into generos(tipo_genero)
values("Disparos en tercera persona");
insert into generos(tipo_genero)
values("Terror");
insert into generos(tipo_genero)
values("Disparos en primera persona");
insert into generos(tipo_genero)
values("Indie");
insert into generos(tipo_genero)
values("Mundo abierto");
insert into generos(tipo_genero)
values("Plataforma y corredores");
insert into generos(tipo_genero)
values("Ciencia ficción");

insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('Andres', 'Eduardo', "", 'Hernandez', 'Castillo', '5ta avenida', 'Andres@gmail.com', '64581245', '1998-04-21');
insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('Juan', 'Esteban', "", 'Vasquez', 'Ramirez', '6ta avenida', 'Juan@gmail.com', '34685946', '2000-09-15');
insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('Luis', 'Eduardo', "", 'Rodriguez', 'Campos', '4ta avenida', 'luis@gmail.com', '49567812', '2003-01-12');
insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('Vicente', 'Francisco', "", 'Martinez', 'Salazar', '2da avenida', 'Vicente@gmail.com', '34695168', '1994-12-24');
insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('David', 'Miguel', "", 'Mazariegos', 'Diaz', '8va avenida', 'David@gmail.com', '64951234', '1990-03-10');
insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('Guillermo', 'Sebastian', "", 'Ramirez', 'Monterroso', '11va avenida', 'Guillermo@gmail.com', '19468579', '1999-10-29');
insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('Jose', 'Omar', "", 'Leon', 'Castillo', '15va avenida', 'Jose@gmail.com', '34916582', '2004-05-16');
insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('Maria', 'Isabel', "", 'Gallardo', 'Herrera', '5ta avenida', 'Maria@gmail.com', '86495261', '1995-11-03');
insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('Fernanda', 'Beatriz', "", 'Monterroso', 'Guadalupe', '1ra avenida', 'Fernanda@gmail.com', '48613562', '1976-08-23');
insert into personas (nombre1, nombre2, nombre3, apellido1, apellido2, direccion, email, telefono, fecha_nacimiento)
values ('Lucas', 'Raul', "", 'Enriqez', 'Galvez', '2da avenida', 'Lucas@gmail.com', '79231648', '1984-09-16');

insert into suscripciones(tipo_suscripcion)
values("free");
insert into suscripciones(tipo_suscripcion)
values("premium");

insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(1,"12345",1,"Luis@gmail.com",1);
insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(2,"54321",2,"Andres@gmail.com",2);
insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(3,"98765",1,"Javier@gmail.com",3);
insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(4,"56789",1,"Jaime@gmail.com",4);
insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(5,"15935",2,"Alan@gmail.com",5);
insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(6,"75321",1,"Esteban@gmail.com",6);
insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(7,"85648",1,"Miguel@gmail.com",7);
insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(8,"12456",1,"José@gmail.com",8);
insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(9,"73954",2,"Lucas@gmail.com",9);
insert into usuarios(user,pass,rol_id,correo_electronico,persona_id)
values(10,"24685",1,"Marcos@gmail.com",10);

insert into empresas_desarrolladoras(nombre_desarrolladora)
values("FromSoftware");
insert into empresas_desarrolladoras(nombre_desarrolladora)
values("Rockstar Games");
insert into empresas_desarrolladoras(nombre_desarrolladora)
values("Supergiant Games");
insert into empresas_desarrolladoras(nombre_desarrolladora)
values("id Software");
insert into empresas_desarrolladoras(nombre_desarrolladora)
values("KOJIMA PRODUCTIONS");
insert into empresas_desarrolladoras(nombre_desarrolladora)
values("Riot Games");
insert into empresas_desarrolladoras(nombre_desarrolladora)
values("Team Cherry");
insert into empresas_desarrolladoras(nombre_desarrolladora)
values("Valve");
insert into empresas_desarrolladoras(nombre_desarrolladora)
values("BlueTwelve Studio");
insert into empresas_desarrolladoras(nombre_desarrolladora)
values("Playground Games");

insert into distribuidoras(nombre_distribuidora)
values("Bandai Namco");
insert into distribuidoras(nombre_distribuidora)
values("Rockstar Games");
insert into distribuidoras(nombre_distribuidora)
values("Supergiant Games");
insert into distribuidoras(nombre_distribuidora)
values("Bethesda Softworks");
insert into distribuidoras(nombre_distribuidora)
values("Sony Interactive Entertainment");
insert into distribuidoras(nombre_distribuidora)
values("Riot Games");
insert into distribuidoras(nombre_distribuidora)
values("Team Cherry");
insert into distribuidoras(nombre_distribuidora)
values("Valve");
insert into distribuidoras(nombre_distribuidora)
values("Annapurna Interactive");
insert into distribuidoras(nombre_distribuidora)
values("Xbox Game Studios");

insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Elden Ring",2022, 100, 1 ,1, 1);
insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Grand Theft Auto V",2013, 150, 2 ,2 ,2);
insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Hades",2018, 95, 3 ,3, 3);
insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Doom Eternal",2020, 60, 4 ,4, 4);
insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Death Stranding",2019, 300, 5 ,5, 5);
insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Valorant",2020, 0, 6 ,6, 6);
insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Hollow Knight",2017, 45, 7 ,7, 7);
insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Team Fortress 2",2007, 10, 8 ,8, 8);
insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Stray",2022, 100, 9 ,9, 9);
insert into juegos(nombre_juego,fecha_lanzamiento, precio,desarrolladora_id,distribuidora_id ,genero_id)
values("Forza Horizon 5",2021, 15, 10 ,10, 10);

insert into clientes(nit, persona_id, suscripcion_id)
values("4417264-1",1,1);
insert into clientes(nit, persona_id, suscripcion_id)
values("5648217-5",6,2);
insert into clientes(nit, persona_id, suscripcion_id)
values("6457125-4",4,1);
insert into clientes(nit, persona_id, suscripcion_id)
values("7654851-2",8,1);
insert into clientes(nit, persona_id, suscripcion_id)
values("1865748-7",3,2);
insert into clientes(nit, persona_id, suscripcion_id)
values("1236547-1",7,2);
insert into clientes(nit, persona_id, suscripcion_id)
values("4856485-2",10,1);
insert into clientes(nit, persona_id, suscripcion_id)
values("9578468-7",9,1);
insert into clientes(nit, persona_id, suscripcion_id)
values("6485213-2",2,2);
insert into clientes(nit, persona_id, suscripcion_id)
values("1657842-3",5,1);

insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(1, "2022-02-25", 7);
insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(2, "2013-09-17", 5);
insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(3, "2018-12-06", 1);
insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(4, "2020-05-20", 8);
insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(5, "2019-11-08", 2);
insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(6, "2020-06-02", 3);
insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(7, "2017-02-24", 10);
insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(8, "2007-09-10", 6);
insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(9, "2022-07-19", 9);
insert into listas_deseados(juego_id, fecha_agregado ,cliente_id)
values(10, "2021-11-05", 4);

insert into empleados(persona_id)
values(1);
insert into empleados(persona_id)
values(2);
insert into empleados(persona_id)
values(3);
insert into empleados(persona_id)
values(4);
insert into empleados(persona_id)
values(5);
insert into empleados(persona_id)
values(6);
insert into empleados(persona_id)
values(7);
insert into empleados(persona_id)
values(8);
insert into empleados(persona_id)
values(9);
insert into empleados(persona_id)
values(10);