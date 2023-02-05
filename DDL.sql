/*
	base de datos flota de vehículos

*/

create schema prueba_dll authorization webhllcd;


create table prueba_dll.coches
( 
	id_coche varchar(10) not null,  --PK
	matricula varchar(10) not null,
	km_total integer not null,
	dt_compra date not null,

	id_color varchar(100) not null,  --FK
	id_aseguradora varchar(100) not null,  --FK
	id_revision varchar(100) not null,  --FK
	id_modelo varchar(100) not null,  --FK
	id_estado varchar(20) not null  --FK
);

create table prueba_dll.type_color
( 
	id_color varchar(100) not null,  --PK
	name_color varchar(10) not null

);

create table prueba_dll.type_aseguradora
( 
	id_aseguradora varchar(100) not null,  --PK
	nombre_aseguradora varchar(10) not null,
	numero_poliza varchar(10) not null
);

create table prueba_dll.info_revision
( 
	id_revision varchar(100) not null,  --PK
	numero_revision integer not null,
	km_revision integer not null,
	dt_revision date not null,

	id_price varchar(100) not null --FK
);

create table prueba_dll.precio
( 
	id_price varchar(100) not null,   --PK
	importe varchar(10) not null,
	
	id_moneda varchar(100) not null  --FK
);

create table prueba_dll.monedas
( 
	id_moneda varchar(100) not null,  --PK
	nombre_moneda varchar(10) not null
);

create table prueba_dll.modelos_coches
( 
	id_modelo varchar(100) not null,  --PK
	nombre_modelo varchar(50) not null,
 
	id_marca varchar(100) not null  --FK
);
create table prueba_dll.marcas_coches
( 
	id_marca varchar(100) not null ,  --PK
	nombre_marca varchar(50) not null,
 
	id_grupoempresas varchar(100) not null  --FK
);
create table prueba_dll.grupo_empresas
( 
	id_grupoempresas varchar(100) not null,  --PK
	nombre_empresa varchar(50) not null
);

create table prueba_dll.type_estado
( 
	id_estado varchar(20) not null,  --PK
	nombre_estado varchar(50) not null
);

--añadimos la PK
alter table prueba_dll.coches
add constraint coches_PK  primary key (id_coche);

alter table prueba_dll.type_color
add constraint color_PK  primary key (id_color);

alter table prueba_dll.type_aseguradora
add constraint aseguradora_PK  primary key (id_aseguradora);

alter table prueba_dll.info_revision
add constraint revision_PK  primary key (id_revision);

alter table prueba_dll.precio
add constraint precio_PK  primary key (id_price);

alter table prueba_dll.monedas
add constraint monedas_PK  primary key (id_moneda);

alter table prueba_dll.modelos_coches
add constraint modelos_PK  primary key (id_modelo);

alter table prueba_dll.marcas_coches
add constraint marca_PK  primary key (id_marca);

alter table prueba_dll.grupo_empresas
add constraint grupos_PK  primary key (id_grupoempresas);

alter table prueba_dll.type_estado
add constraint estado_PK  primary key (id_estado);


--- Añadimos la FK
alter table prueba_dll.coches
add constraint type_color_coches_FK 
foreign key (id_color) references prueba_dll.type_color(id_color);

alter table prueba_dll.coches
add constraint type_aseguradora_coches_FK 
foreign key (id_aseguradora) references prueba_dll.type_aseguradora(id_aseguradora);

alter table prueba_dll.coches
add constraint info_revision_coches_FK 
foreign key (id_revision) references prueba_dll.info_revision(id_revision);

alter table prueba_dll.coches
add constraint modelos_coches_coches_FK 
foreign key (id_modelo) references prueba_dll.modelos_coches(id_modelo);

alter table prueba_dll.coches
add constraint type_estado_coches_FK 
foreign key (id_estado) references prueba_dll.type_estado(id_estado);


alter table prueba_dll.modelos_coches
add constraint marcas_modelos_FK 
foreign key (id_marca) references prueba_dll.marcas_coches(id_marca);

alter table prueba_dll.marcas_coches
add constraint grupos_marcas_FK 
foreign key (id_grupoempresas) references prueba_dll.grupo_empresas(id_grupoempresas);


alter table prueba_dll.info_revision
add constraint precio_info_revision_FK 
foreign key (id_price) references prueba_dll.precio(id_price);

alter table prueba_dll.precio
add constraint info_revision_coches_FK 
foreign key (id_moneda) references prueba_dll.monedas(id_moneda);


-- Insertamos los valores permitidos en las tablas y dejamos agregamos 3 coches de la flota --

INSERT INTO prueba_dll.type_color (id_color, name_color) VALUES('0', 'BLACK');
INSERT INTO prueba_dll.type_color (id_color, name_color) VALUES('1', 'RED');
INSERT INTO prueba_dll.type_color (id_color, name_color) VALUES('2', 'GREY');
INSERT INTO prueba_dll.type_color (id_color, name_color) VALUES('3', 'WHITE');

INSERT INTO prueba_dll.type_aseguradora (id_aseguradora, nombre_aseguradora, numero_poliza ) VALUES('000', 'MAFRE', 'NP0001');
INSERT INTO prueba_dll.type_aseguradora (id_aseguradora, nombre_aseguradora, numero_poliza ) VALUES('001', 'MMT', 'NP0002');
INSERT INTO prueba_dll.type_aseguradora (id_aseguradora, nombre_aseguradora, numero_poliza ) VALUES('002', 'AXA', 'NP0003');

INSERT INTO prueba_dll.monedas (id_moneda, nombre_moneda ) VALUES('001', 'EUR');
INSERT INTO prueba_dll.monedas (id_moneda, nombre_moneda ) VALUES('002', 'DOLAR');


INSERT INTO prueba_dll.precio (id_price, importe,id_moneda ) VALUES('001', '0', '001' );
INSERT INTO prueba_dll.precio (id_price, importe,id_moneda ) VALUES('002', '0', '002' );
INSERT INTO prueba_dll.precio (id_price, importe,id_moneda ) VALUES('003', '500', '001' );
INSERT INTO prueba_dll.precio (id_price, importe,id_moneda ) VALUES('004', '1000', '001' );
INSERT INTO prueba_dll.precio (id_price, importe,id_moneda ) VALUES('005', '500', '002' );
INSERT INTO prueba_dll.precio (id_price, importe,id_moneda ) VALUES('006', '1000', '002' );

INSERT INTO prueba_dll.info_revision (id_revision, numero_revision, km_revision, dt_revision, id_price) VALUES('01', '0', '0', '1800-1-1', '001' );
INSERT INTO prueba_dll.info_revision (id_revision, numero_revision, km_revision, dt_revision, id_price) VALUES('02', '1', '1000', '2018-5-3', '003' );
INSERT INTO prueba_dll.info_revision (id_revision, numero_revision, km_revision, dt_revision, id_price) VALUES('03', '2', '2000', '2019-5-3', '003' );

INSERT INTO prueba_dll.type_estado (id_estado, nombre_estado ) VALUES('0', 'INACTIVO' );
INSERT INTO prueba_dll.type_estado (id_estado, nombre_estado ) VALUES('1', 'ACTIVO' );

INSERT INTO prueba_dll.grupo_empresas (id_grupoempresas, nombre_empresa ) VALUES('0', 'Volkswagen Group' );
INSERT INTO prueba_dll.grupo_empresas (id_grupoempresas, nombre_empresa ) VALUES('1', 'Toyota' );
INSERT INTO prueba_dll.grupo_empresas (id_grupoempresas, nombre_empresa ) VALUES('2', 'General Motors' );
INSERT INTO prueba_dll.grupo_empresas (id_grupoempresas, nombre_empresa ) VALUES('3', 'PSA' );
INSERT INTO prueba_dll.grupo_empresas (id_grupoempresas, nombre_empresa ) VALUES('4', 'BMW Group' );


INSERT INTO prueba_dll.marcas_coches (id_marca, nombre_marca, id_grupoempresas ) VALUES('0', 'Porsche', '0' );
INSERT INTO prueba_dll.marcas_coches (id_marca, nombre_marca, id_grupoempresas ) VALUES('1', 'Lexus' , '1');
INSERT INTO prueba_dll.marcas_coches (id_marca, nombre_marca, id_grupoempresas ) VALUES('2', 'Chevrolet', '2' );
INSERT INTO prueba_dll.marcas_coches (id_marca, nombre_marca, id_grupoempresas ) VALUES('3', 'Peugeot' ,'3');
INSERT INTO prueba_dll.marcas_coches (id_marca, nombre_marca, id_grupoempresas ) VALUES('4', 'BMW', '4' );


INSERT INTO prueba_dll.modelos_coches (id_modelo, nombre_modelo, id_marca ) VALUES('0', 'Taycan', '0' );
INSERT INTO prueba_dll.modelos_coches (id_modelo, nombre_modelo, id_marca ) VALUES('1', 'RZ' , '1');
INSERT INTO prueba_dll.modelos_coches (id_modelo, nombre_modelo, id_marca ) VALUES('2', 'Stingray' ,'2');
INSERT INTO prueba_dll.modelos_coches (id_modelo, nombre_modelo, id_marca ) VALUES('3', '308' ,'3');
INSERT INTO prueba_dll.modelos_coches (id_modelo, nombre_modelo, id_marca ) VALUES('4', 'Z4', '4' );

INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000001','5456TXC','0','2022-3-6','1', '000', '01', '0','1');
INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000002','9427EWC','1000','2022-1-1','3', '002', '02', '3','0');
INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000003','5148WQD','2000','2022-3-6','1', '002', '03', '4','0');
INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000004','1842LKC','0','2022-3-6','1', '000', '01', '0','1');
INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000005','4916EOC','1000','2022-1-1','0', '001', '02', '4','1');
INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000006','7346DPD','2000','2022-3-6','1', '001', '03', '4','1');
INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000007','5446GPC','0','2022-3-6','0', '000', '01', '3','1');
INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000008','9164EQC','1000','2022-1-1','3', '001', '02', '3','1');
INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000009','1648COJ','2000','2022-3-6','2', '001', '03', '4','1');
INSERT INTO prueba_dll.coches (id_coche, matricula, km_total, dt_compra, id_color, id_aseguradora, id_revision, id_modelo, id_estado) VALUES('000010','7346WTD','2000','2022-3-6','2', '001', '03', '4','1');

-- Fin Scripts ---
