create database filtro_SQL;

use filtro_SQL;

create table departamento(
id_departamento int primary key auto_increment,
nombre varchar(50)
);

create table grado(
id_grado int primary key auto_increment,
nombre varchar(100)
);

create table alumno(
id_alumno int primary key auto_increment,
nif varchar(9),
nombre varchar(25),
apeliido1 varchar(50),
apellido2 varchar(50),
ciudad varchar(25),
direcccion varchar(50),
telefono varchar(9),
fecha_nacimiento date,
sexo enum('H','M')
);

create table curso_escolar(
id_curso_escolar int primary key auto_increment,
anyo_inicio year(4),
anyo_fin year(4)
);


create table profesor(
id_profesor int primary key auto_increment,
nif varchar(9),
nombre varchar(25),
apeliido1 varchar(50),
apellido2 varchar(50),
ciudad varchar(25),
direcccion varchar(50),
telefono varchar(9),
fecha_nacimiento date,
sexo enum('H','M'),
id_departamento int,
foreign key (id_departamento) references departamento(id_departamento)
);

create table asignatura(
id_asignatura int primary key auto_increment,
nombre varchar(100),
creditos float,
tipo enum('basica','obligatoria','optativa'),
curso tinyint(3),
cuatrimestre tinyint(3),
id_profesor int,
foreign key (id_profesor) references profesor(id_profesor),
id_grado int,
foreign key (id_grado) references grado(id_grado)
);


create table alumno_se_matricula_asignatura(
id_alumno int,
foreign key (id_alumno) references alumno(id_alumno),
id_asignatura int,
foreign key (id_asignatura) references asignatura(id_asignatura),
id_curso_escolar int,
foreign key (id_curso_escolar) references curso_escolar(id_curso_escolar)
);




