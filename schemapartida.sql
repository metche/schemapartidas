drop table if exists clientes;
-- -----------------------------------------------------
-- Table `partidas_rodrigo`.`cliente`
-- -----------------------------------------------------
create table clientes (
  id integer primary key autoincrement,
  dni varchar(255) not null,
  nombre VARCHAR(255) not null,
  apellido VARCHAR(255) not null,
  direccion VARCHAR(255) not null,
  email VARCHAR(255) not null,
  telefono1 VARCHAR(255) NOT NULL,
  telefono2 VARCHAR(255),
  localidad VARCHAR(255) not null,
  pais VARCHAR(255) not null,
  descripcion VARCHAR(1500) null,
  codigo_confirmacion VARCHAR(255) not null,
  provincia_id integer not null,
  FOREIGN KEY(provincia_id) REFERENCES provincias(id)
);

drop table if exists motivo_solicitudes;
-- -----------------------------------------------------
-- Table `partidas_rodrigo`.`motivo solicitud`
-- -----------------------------------------------------
create table motivo_solicitudes (
  id integer primary key autoincrement,
  tipo_solicitud varchar(255) not null
);

drop table if exists partida_nacimientos;
-- -----------------------------------------------------
-- Table `partidas_rodrigo`.`Partidas de nacimiento`
-- -----------------------------------------------------
CREATE TABLE partida_nacimientos (
  id integer primary key AUTOINCREMENT,
  fecha_nacimiento VARCHAR(255) NOT NULL,
  lugar_nacido VARCHAR(255) NOT NULL,
  nombre_nacido VARCHAR(255) NOT NULL,
  apellido_nacido VARCHAR(255) NOT NULL,
  dni_nacido VARCHAR(255) NOT NULL,
  nombre_padre VARCHAR(255) NOT NULL,
  dni_padre VARCHAR(255) NOT NULL,
  nombre_madre VARCHAR(255) NOT NULL,
  dni_madre VARCHAR(255) NOT NULL,
  descripcion TEXT,
  --activo TINYINT(1) DEFAULT 0,
  observacion LONGTEXT NOT NULL,
  partido VARCHAR(255) NOT NULL,
  cliente_id integer,
  urgente_id integer,
  provincia_id integer,
  motivo_solicitud_id integer,
  comment 'CONSTRAINT FOREIGN KEY(cliente_id) REFERENCES clientes(id)
           constraint FOREIGN KEY(urgente_id) REFERENCES urgentes(id)
           FOREIGN KEY(provincia_id) REFERENCES provincias(id)
           FOREIGN KEY(motivo_solicitud_id) REFERENCES motivo_solicitudes(id)' 
);

drop table if exists partida_matrimonios;
-- -----------------------------------------------------
-- Table `partidas_rodrigo`.`Partidas de matrimonio`
-- -----------------------------------------------------
create table partida_matrimonios (
  id integer primary key autoincrement,
  nombre_conyuge_1 varchar(255) not null,
  dni_conyuge_1 varchar(255) not null, 
  nombre_conyuge_2 varchar(255) not null,
  dni_conyuge_2 varchar(255) not null,
  fecha_matrimonio varchar(255) not null,
  localidad varchar(255) not null,
  descripcion TEXT NULL,
  --activo TINYINT(1) DEFAULT 0,
  observacion LONGTEXT NOT NULL,
  partido varchar(255) not null,
  cliente_id integer,
  urgente_id integer,
  provincia_id integer,
  motivo_solicitud_id integer,
  comment 'CONSTRAINT FOREIGN KEY(cliente_id) REFERENCES clientes(id)
           constraint FOREIGN KEY(urgente_id) REFERENCES urgentes(id)
           FOREIGN KEY(provincia_id) REFERENCES provincias(id)
           FOREIGN KEY(motivo_solicitud_id) REFERENCES motivo_solicitudes(id)' 

);

drop table if exists partida_defunciones;
-- -----------------------------------------------------
-- Table `partidas_rodrigo`.`Partidas de defuncion`
-- -----------------------------------------------------
create table partida_defunciones (
  id integer primary key autoincrement,
  nombre_difunto varchar(255) not null,
  lugar_defuncion varchar(255) not null, 
  fecha_defuncion varchar(255) not null,
  casado_con varchar(255) not null,
  nombre_padre varchar(255) not null,
  dni_padre varchar(255) not null,
  nombre_madre VARCHAR(255) NOT NULL,
  dni_madre VARCHAR(255) NOT NULL,
  lugar_nacimiento varchar(255) not null, 
  fecha_nacimiento varchar(255) not null,
  descripcion TEXT NULL,
  --activo TINYINT(1) DEFAULT 0,
  observacion LONGTEXT NOT NULL,
  partido varchar(255) not null,
  cliente_id integer,
  urgente_id integer,
  provincia_id integer,
  motivo_solicitud_id integer,
  comment 'CONSTRAINT FOREIGN KEY(cliente_id) REFERENCES clientes(id)
           constraint FOREIGN KEY(urgente_id) REFERENCES urgentes(id)
           FOREIGN KEY(provincia_id) REFERENCES provincias(id)
           FOREIGN KEY(motivo_solicitud_id) REFERENCES motivo_solicitudes(id)' 

);

drop table if exists provincias;
-- -----------------------------------------------------
-- Table `partidas_rodrigo`.`Provincias`
-- -----------------------------------------------------
create table provincias (
  id integer primary key autoincrement,
  nombre varchar(255) not null
); 

drop table if exists consultas;
-- -----------------------------------------------------
-- Table `partidas_rodrigo`.`Consultas`
-- -----------------------------------------------------
create table consultas (
  id integer primary key autoincrement,
  descripcion text not null
);

drop table if exists urgentes;
-- -----------------------------------------------------
-- Table `partidas_rodrigo`.`Urgentes`
-- -----------------------------------------------------
create table urgentes (
  id integer primary key autoincrement, 
  acta varchar(255) not null,
  seccion_circunscripcion varchar(255) not null,
  tomo varchar(255)
);
  

