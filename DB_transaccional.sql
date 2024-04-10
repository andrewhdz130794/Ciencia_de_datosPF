create table categoria(
idcategoria int auto_increment primary key,
nombre varchar(50),
descripcion varchar(255),
estado bit
);

CREATE TABLE articulo (
    idarticulo INT AUTO_INCREMENT PRIMARY KEY,
    idcategoria INT NOT NULL,
    codigo VARCHAR(50),
    nombre VARCHAR(50),
    precio_venta DECIMAL(11,2),
    stock INT,
    descripcion VARCHAR(255),
    imagen VARCHAR(20),
    estado BIT,
    FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
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
estado varchar(20));

CREATE TABLE persona (
    idpersona INT AUTO_INCREMENT PRIMARY KEY,
    tipo_persona VARCHAR(20),
    nombre VARCHAR(100),
    tipo_documento VARCHAR(20),
    num_documento VARCHAR(20) NOT NULL,
    direccion VARCHAR(70),
    telefono VARCHAR(20),
    email VARCHAR(50),
    FOREIGN KEY (idpersona) REFERENCES ingreso(idproveedor)
);
CREATE TABLE rol (
    idrol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30),
    descripcion VARCHAR(255),
    estado BIT);
CREATE TABLE usuario (
    idusuario INT AUTO_INCREMENT PRIMARY KEY,
    idrol INT,
    nombre VARCHAR(100),
    tipo_documento VARCHAR(20),
    num_documento VARCHAR(20),
    direccion VARCHAR(70),
    telefono VARCHAR(20),
    email VARCHAR(50),
    clave VARBINARY(255),
    estado BIT,
    FOREIGN KEY (idusuario) REFERENCES ingreso(idusuario),
    FOREIGN KEY (idusuarioventa) REFERENCES venta(idusuario),
    FOREIGN KEY (idusuario) REFERENCES ingreso(idusuario)
);

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
FOREIGN KEY (idcliente) REFERENCES persona(idpersona)
FOREIGN KEY (idusuario) REFERENCES persona(idusuario)
);

/* Tablas detalle */
create table detalle_ingreso(
iddetalle_ingreso int auto_increment primary key,
idingreso int not null,
idarticulo int not null,
cantidad int not null,
precio decimal(11,2),
foreign key (idingreso) references ingreso(idingreso)
foreign key (idarticulo) references articulo(idarticulo)
);

create table detalle_venta(
iddetalle_venta int auto_increment primary key,
idventa int not null,
idarticulo int not null,
cantidad int not null,
precio decimal(11,2),
descuento decimal(11,2),
foreign key (idventa) references venta(idventa)
foreign key (idarticulo) references articulo(idarticulo)
);


