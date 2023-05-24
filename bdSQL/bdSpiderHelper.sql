drop database if exists SpiderHelper2;
create database if not exists SpiderHelper2;

drop table if exists usuarios;
create table if not exists usuarios (
codusuario int,
    nomusuario varchar(60),
    correoelectronico varchar(60),
    tipoAdmimistrador int,
constraint pk_codusuario primary key (codusuario)
);

drop table if exists comprador;
create table if not exists comprador (
codcomprador int,
codusuario int,
constraint pk_codcomprador primary key (codcomprador),
constraint fk_codusuario foreign key (codusuario) references usuarios (codusuario)
on delete no action on update cascade
);

create table if not exists vendedor (
codvendedor int,
codusuario int,
constraint pk_codvendedor primary key (codvendedor),
constraint fk_codusuario foreign key (codusuario) references usuarios (codusuario)
on delete no action on update cascade
);

create table if not exists busqueda (
codbusqueda int,
busqueda varchar(60),
    fechabus  date,
    canhuellacarb double,
    codcomprador int,
constraint pk_codbusqueda primary key (codbusqueda),
constraint fk_codcomprador foreign key (codusuario) references comprador (codcomprador)
on delete no action on update cascade,
constraint pk_codvendedor primary key (codvendedor),
constraint fk_codusuario foreign key (codusuario) references usuarios (codusuario)
on delete no action on update cascade
);