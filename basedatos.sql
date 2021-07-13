CREATE DATABASE IF NOT EXISTS master_python;

USE master_python;

CREATE TABLE usuarios(
    id int(255)auto_increment not null,
    nombre varchar(200),
    apellidos varchar(200),
    email varchar(255) not null,
    password varchar(255) not null,
    fecha date not null,
    CONSTRAINT pk_usuarios PRIMARY_KEY(id),
    CONSTRAINT uq_email UNIQUE(email)
)ENGINE= InnoDb;

CREATE TABLE notas(
    id int(255) auto_increment not null,
    usuario_id int(255) not null,
    titulo varchar(255) not null,
    descripcion MEDIUMTEXT,
    fecha date not null,
    CONSTRAINT pk_notas PRIMARY_KEY(id),
    CONSTRAINT fk_nota_usuario FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
)ENGINE=InnoDb;

