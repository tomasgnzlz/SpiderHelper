drop database if exists proyectoBD;
create database proyectoBD;

use proyectoBD;

create table Usuarios(
codUsuario int not null auto_increment,
nomUsuario varchar(50) not null,
correoElectronico varchar(50) not null,
tipoAdmin int not null default 0,
primary key(codUsuario)
);

create table Comprador(
codComprador int not null auto_increment,
nomComprador varchar(50) not null,
ape1Comprador varchar(50) not null,
ape2Comprador varchar(50) not null,
codUsuario int not null,
primary key(codComprador),
foreign key(codUsuario) references Usuarios(codUsuario)
);

create table Vendedor(
codVendedor int not null auto_increment,
nomVendedor varchar(50) not null,
ape1Vendedor varchar(50) not null,
ape2Vendedor varchar(50) not null,
codUsuario int not null,
primary key(codVendedor),
foreign key(codUsuario) references Usuarios(codUsuario)
);

create table Busqueda(
codBusqueda int not null auto_increment,
busqueda varchar(50) not null,
fechaBusqueda date not null,
cantHuellaCarbono double not null,
codComprador int not null,
primary key(codBusqueda),
foreign key(codComprador) references Comprador(codComprador)
);

create table Tienda(
codTienda int not null auto_increment,
dirTienda varchar(50) not null,
numTienda int not null,
codVendedor int not null,
primary key(codTienda),
foreign key(codVendedor) references Vendedor(codVendedor)
);

create table Productos(
codProductos int not null auto_increment,
descripcion varchar(50) not null,
nomProducto varchar(50) not null,
primary key(codProductos)
);

create table ResultadoTienda(
codProductos int not null,
codTienda int not null,
stock int not null,
cantHuellaCarbono double not null,
primary key(codProductos,codTienda),
foreign key(codProductos) references Productos(codProductos),
foreign key(codTienda) references Tienda(codTienda)
);

create table ResultadoBusqueda(
codBusqueda int not null,
codTienda int not null,
codProductos int not null,
listaTiendas varchar(50) not null,
primary key(codBusqueda,codTienda,codProductos),
foreign key(codBusqueda) references Busqueda(codBusqueda),
foreign key(codTienda) references Tienda(codTienda),
foreign key(codProductos) references Productos(codProductos)
);