
/* Entities */
CREATE TABLE articulo (
    idarticulo INT AUTO_INCREMENT PRIMARY KEY,
    idcategoria INT,
    codigo VARCHAR(50),
    nombre VARCHAR(50),
    precio_venta DECIMAL(11,2),
    stock INT,
    descripcion VARCHAR(255),
    imagen VARCHAR(20),
    estado BIT,
    FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);


CREATE TABLE persona (
    idpersona INT AUTO_INCREMENT PRIMARY KEY,
    idcliente INT,
    idproveedor INT,
    tipo_persona VARCHAR(20),
    nombre VARCHAR(100),
    tipo_documento VARCHAR(20),
    num_documento VARCHAR(20) NOT NULL,
    direccion VARCHAR(70),
    telefono VARCHAR(20),
    email VARCHAR(50),
    FOREIGN KEY (idpersona) REFERENCES venta(idcliente),
    FOREIGN KEY (idpersona) REFERENCES ingreso(idproveedor)
);


CREATE TABLE usuario (
    idusuario INT AUTO_INCREMENT PRIMARY KEY,
    idrol INT NOT NULL,
    nombre VARCHAR(100),
    tipo_documento VARCHAR(20),
    num_documento VARCHAR(20),
    direccion VARCHAR(70),
    telefono VARCHAR(20),
    email VARCHAR(50),
    clave VARBINARY(255),
    estado BIT,
    FOREIGN KEY (idrol) REFERENCES rol(idrol),
    FOREIGN KEY (idusuario) REFERENCES ingreso(idusuario),
    FOREIGN KEY (idusuarioventa) REFERENCES venta(idusuario)
);

/* Tablas uno a uno con las Entities */
CREATE TABLE categoria (
    idcategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(255),
    estado BIT,
    idcategoria_padre INT,
    FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);

CREATE TABLE rol (
    idrol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30),
    descripcion VARCHAR(255),
    estado BIT,
    FOREIGN KEY (idrol) REFERENCES usuario(idrol)
);


/* Tablas venta e ingreso */
create table venta(
idventa int auto_increment primary key,
idcliente int not null,
idusuario int not null,
tipo_comprobante varchar(20),
serie_comprobante varchar(7),
num_comprabante varchar(10),
fecha datetime,
impuesto decimal(4,2),
total decimal(11,2),
estado varchar(20),
constraint fk_idcliente foreign key (idcliente) references persona(idpersona)
	on delete set null
	on update cascade,
constraint fk_idusuario_vta foreign key (idusuario) references usuario(idusuario)
	on delete set null
	on update cascade
);

create table ingreso(
idingreso int auto_increment primary key,
idproveedor int not null,
idusuario int not null,
tipo_comprobante varchar(20),
serie_comprobante varchar(7),
num_comprobante varchar(10),
fecha datetime,
impuesto decimal(4,2),
total decimal(11,2),
estado varchar(20),
constraint fk_idproveedor foreign key (idproveedor) references persona(idpersona)
	on delete set null
	on update cascade,
constraint fk_idusuario_ing foreign key (idusuario) references usuario(idusuario)
	on delete set null
	on update cascade
);

/* Tablas detalle */
create table detalle_ingreso(
iddetalle_ingreso int auto_increment primary key,
idingreso int not null,
idarticulo int not null,
cantidad int not null,
precio decimal(11,2),
constraint fk_idingreso foreign key (idingreso) references ingreso(idingreso)
	on delete cascade
	on update cascade,
constraint fk_idarticulo_ing foreign key (idarticulo) references articulo(idarticulo)
	on delete cascade
	on update cascade
);

create table detalle_venta(
iddetalle_venta int auto_increment primary key,
idventa int not null,
idarticulo int not null,
cantidad int not null,
precio decimal(11,2),
descuento decimal(11,2),
constraint fk_idventa foreign key (idventa) references venta(idventa)
	on delete cascade
	on update cascade,
constraint fk_idarticulo_vta foreign key (idarticulo) references articulo(idarticulo)
	on delete cascade
	on update cascade
);


