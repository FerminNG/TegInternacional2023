DROP DATABASE IF EXISTS beoro;
CREATE DATABASE beoro;
USE beoro;

CREATE TABLE categoriaProducto(
    Id int(5) not null auto_increment,
    Nombre varchar(100),
    PRIMARY KEY(Id)
);

CREATE TABLE productos(
    Id int(10) not null auto_increment,
    Nombre varchar(150),
    Descripcion text,
    Stock int(10),
    StockMinimo int(4),
    PrecioVenta varchar(20),
    categoria int(5),
    PRIMARY KEY(Id),
    FOREIGN KEY (categoria) REFERENCES categoriaProducto(Id)
);

CREATE TABLE cliente(
    Id int(5) not null auto_increment,
    NombreCompleto varchar(200),
    Telefono varchar(20),
    Email varchar(200),
    PRIMARY KEY (Id)
);

CREATE TABLE empleados(
    Id int(5) not null auto_increment,
    Nombre varchar(100),
    Apellidos varchar(150),
    Telefono varchar(20),
    Direccion varchar(100),
    Email varchar(200),
    DIP varchar(20),
    PRIMARY KEY (Id)
);

CREATE TABLE ventas(
    Id int(10) not null auto_increment,
    fechaVenta date,
    empleado int(5),
    cliente int(5),
    PRIMARY KEY (Id),
    FOREIGN KEY (empleado) REFERENCES empleados(Id),
    FOREIGN KEY (cliente) REFERENCES cliente(Id)
);

CREATE TABLE DetalleVenta(
    Id int(10) not null auto_increment,
    cantidad int(10),
    precioUnitario varchar(45),
    importeTotal varchar(45),
    descuento varchar(45),
    venta int(10),
    producto int(10),
    PRIMARY KEY(Id),
    FOREIGN KEY (venta) REFERENCES ventas(Id),
    FOREIGN KEY (producto) REFERENCES productos(Id)
);

CREATE TABLE compras(
    Id int(10) not null auto_increment,
    fechaCompra date,
    NumFacturaCompra varchar(50),
    empleado int(5),
    PRIMARY KEY (Id),
    FOREIGN KEY (empleado) REFERENCES empleados (Id)
);

CREATE TABLE detalleCompra(
    Id int(10) not null auto_increment,
    cantidad varchar(10),
    precioUnitario varchar(45),
    importeTotal varchar(45),
    compra int(10),
    producto int(10),
    PRIMARY KEY (Id),
    FOREIGN KEY (compra) REFERENCES compras(Id),
    FOREIGN KEY (producto) REFERENCES productos(Id)
);
