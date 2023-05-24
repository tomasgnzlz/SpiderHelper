drop database if exists SpiderHelper;
create database if not exists SpiderHelper;
use SpiderHelper;
drop table if exists usuarios;
create table if not exists usuarios (
codusuario int,
    nomusuario varchar(60),
    correoelectronico varchar(60),
    tipoAdministrador int,
constraint pk_codusuario primary key (codusuario)
);

drop table if exists comprador;
create table if not exists comprador (
codcomprador int,
codusuario int,
constraint pk_codcomprador primary key (codcomprador),
constraint fk_codusuario_comprador foreign key (codusuario) references usuarios (codusuario)
on delete no action on update cascade
);

create table if not exists vendedor (
codvendedor int,
codusuario int,
constraint pk_codvendedor primary key (codvendedor),
constraint fk_codusuario_vendedor foreign key (codusuario) references usuarios (codusuario)
on delete no action on update cascade
);

CREATE TABLE IF NOT EXISTS busqueda (
    codbusqueda INT,
    busqueda VARCHAR(60),
    fechabus DATE,
    canhuellacarb DOUBLE,
    codcomprador INT,
    codvendedor INT,
    codusuario INT,
    CONSTRAINT pk_codbusqueda PRIMARY KEY (codbusqueda),
    CONSTRAINT fk_codcomprador FOREIGN KEY (codcomprador)
        REFERENCES comprador (codcomprador)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_codvendedor FOREIGN KEY (codvendedor)
        REFERENCES vendedor (codvendedor)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_codusuario FOREIGN KEY (codusuario)
        REFERENCES usuarios (codusuario)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

