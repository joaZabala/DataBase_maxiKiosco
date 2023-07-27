create database Maxikiosco
go
use maxikiosco
go 
create table PROVINCIAS(
id_provincia int identity (1,1), 
nombre_provincia varchar(50), 
constraint pk_provincias primary key (id_provincia)  
)  
create table LOCALIDADES(
id_localidad int identity (1,1), 
nombre_localidad varchar(50), 
id_provincia int,  
constraint pk_localidades primary key (id_localidad), 
constraint fk_localidades_provincias foreign key (id_provincia) 
references PROVINCIAS (id_provincia)  
)  
create table BARRIOS(
id_barrio int identity (1,1), 
nombre_barrio varchar(50), 
id_localidad int,  
constraint pk_barrios primary key (id_barrio), 
constraint fk_barrios_localidades foreign key (id_localidad) 
references LOCALIDADES (id_localidad)  
)  
create table TIPOS_CONTACTOS(
id_tipo_contacto int identity (1,1), 
tipo_contacto varchar(100),  
constraint pk_tipos_contactos primary key (id_tipo_contacto)  
)  
create table FABRICANTES(
id_fabricante int identity (1,1), 
fabricante varchar(50), 
direccion varchar(50), 
id_barrio int, 
latitud varchar(50), 
longitud varchar(50),  
constraint pk_fabricantes primary key (id_fabricante), 
constraint fk_fabricantes_barrios foreign key (id_barrio) 
references BARRIOS (id_barrio)  
)   
create table PROVEEDORES(
id_proveedor int identity (1,1), 
nombre varchar(50),  
cuil int, 
razón_social varchar(50), 
direccion varchar(30), 
id_barrio int, 
latitud varchar(30), 
longitud varchar(30),  
constraint pk_proveedores primary key (id_proveedor), 
constraint fk_proveedores_barrios foreign key (id_barrio) 
references BARRIOS (id_barrio)  
) 
create table CONTACTOS(
id_contacto int identity (1,1), 
contacto varchar(50), 
id_proveedor int, 
id_tipo_contacto int, 
id_fabricante int,  
constraint pk_contactos primary key (id_contacto), 
constraint fk_contactos_proveedores foreign key (id_proveedor) 
references PROVEEDORES (id_proveedor),  
constraint fk_contactos_tipos_contactos foreign key (id_tipo_contacto) 
references TIPOS_CONTACTOS (id_tipo_contacto), 
constraint fk_contactos_fabricantes foreign key (id_fabricante) 
references FABRICANTES (id_fabricante)  
)  
Create Table SUCURSALES(
id_sucursal int identity (1,1), 
nombre varchar (50), 
direccion varchar (30), 
id_barrio int, 
latitud varchar (30),  
longitud varchar (30),  
CONSTRAINT pk_sucursales Primary Key (id_sucursal),  
CONSTRAINT fk_sucursales_barrios Foreign Key (id_barrio)  
References BARRIOS (id_barrio)  
) 
create table PROVEEDORES_SUCURSALES(
id_proveedor_sucursal int identity (1,1), 
id_proveedor int, 
id_sucursal int,  
CONSTRAINT pk_proveedores_sucursales Primary Key (id_proveedor_sucursal),  
CONSTRAINT fk_proveedores_sucursales_proveedores Foreign Key (id_proveedor)  
References PROVEEDORES (id_proveedor),  
CONSTRAINT fk_proveedores_sucursales_sucursales Foreign Key (id_sucursal)  
References SUCURSALES (id_sucursal)  
)   
create table TIPOS_PRODUCTOS(
id_tipo_producto int identity (1,1), 
tipo_producto varchar(100),  
constraint pk_tipos_productos primary key (id_tipo_producto)  
)  
create table PRODUCTOS(
id_producto int identity (1,1), 
nombre varchar(30),
marca varchar(30), 
cod_barra int,  
descripcion varchar(100), 
id_tipo_producto int, 
precio_venta decimal (8,2), 
vencimiento date, 
id_fabricante int,  
constraint pk_productos primary key (id_producto), 
constraint fk_productos_tipos_productos foreign key (id_tipo_producto) 
references TIPOS_PRODUCTOS (id_tipo_producto), 
constraint fk_productos_fabricantes foreign key (id_fabricante) 
references FABRICANTES (id_fabricante)  
) 
create table TIPOS_MOVIMIENTOS(
id_tipo_movimiento int identity (1,1), 
tipo_movimiento varchar (150),  
constraint pk_tipos_movimientos primary key (id_tipo_movimiento)  
)  
create table STOCKS(
id_stock int identity (1,1), 
id_producto int, cantidad int, 
id_sucursal int, 
cant_venta int, 
id_tipo_movimiento int, 
motivo varchar(100), 
fecha_movimiento date, 
constraint pk_stocks primary key (id_stock), 
constraint fk_stocks_productos foreign key (id_producto) 
references PRODUCTOS (id_producto), 
constraint fk_stocks_sucursales foreign key (id_sucursal) 
references SUCURSALES (id_sucursal),  
constraint fk_stocks_tipos_movimientos foreign key (id_tipo_movimiento) 
references TIPOS_MOVIMIENTOS (id_tipo_movimiento)  
)  

CREATE table TRANSFERENCIAS(
id_transferencia int identity (1,1), 
id_sucursal_origen int, 
id_sucursal_destino int, 
id_producto int, 
cantidad int, 
fecha date,  
constraint pk_transferencias primary key (id_transferencia),  
constraint fk_transferencias_sucursal_origen foreign key (id_sucursal_origen) 
references SUCURSALES (id_sucursal),  
constraint fk_transferencias_sucursal_destino foreign key (id_sucursal_destino) 
references SUCURSALES (id_sucursal),  
constraint fk_transferencias_productos foreign key (id_producto) 
references PRODUCTOS (id_producto)  
)  
create table DETALLES_PAGOS(
id_detalle_pago int identity (1,1), 
detalle_pago varchar(150),  
constraint pk_detalle_pago primary key (id_detalle_pago)  
)   
Create Table PROVEEDORES_DETALLES_PAGOS(
id_proveedor_detalle_pago int identity (1,1), 
id_proveedor int, 
id_detalle_pago int,  
CONSTRAINT pk_proveedores_detalles_pagos Primary Key (id_proveedor_detalle_pago),  
CONSTRAINT fk_proveedores_detalles_pagos_proveedores Foreign Key (id_proveedor)  
References PROVEEDORES (id_proveedor),  
CONSTRAINT fK_proveedores_detalles_pagos_detalles_pagos Foreign Key (id_detalle_pago)  
References DETALLES_PAGOS (id_detalle_pago)  
)  
create table DETALLES_ENTREGAS (  
id_detalle_entrega int identity (1,1) , 
detalle_entrega varchar(150),  
constraint pk_detalles_entregas primary key (id_detalle_entrega)  
)  
Create Table PROVEEDORES_DETALLES_ENTREGAS(
id_proveedor_detalle_entrega int identity (1,1), 
id_proveedor int, 
id_detalle_entrega int,  
CONSTRAINT pk_proveedores_detalles_entregas Primary Key (id_proveedor_detalle_entrega),  
CONSTRAINT fk_proveedores_detalles_entregas_proveedores Foreign Key (id_proveedor)  
References PROVEEDORES (id_proveedor),  
CONSTRAINT fK_proveedores_detalles_entregas_detalles_entregas Foreign Key (id_detalle_entrega) 
References DETALLES_ENTREGAS (id_detalle_entrega)  
)  
create table MEDIOS_PEDIDOS(
id_medio_pedido int identity (1,1), 
medio varchar(150),  
constraint pk_medio_pedido primary key (id_medio_pedido)  
) 
create table PEDIDOS(
id_pedido int identity (1,1), 
id_proveedor int, 
id_medio_pedido int, 
fecha_pedido date,  
constraint pk_pedidos primary key (id_pedido), 
constraint fk_pedidos_proveedor foreign key (id_proveedor) 
references PROVEEDORES (id_proveedor),  
constraint fk_pedidos_medios_pedidos foreign key (id_medio_pedido) 
references MEDIOS_PEDIDOS (id_medio_pedido)  
)  
create table DETALLES_PEDIDOS(
id_detalle_pedido int identity (1,1), 
id_pedido int, 
id_producto int,  
cantidad int, 
precio_final decimal (8,2),  
constraint pk_detalles_pedidos primary key (id_detalle_pedido), 
constraint fk_detalles_pedidos_pedidos foreign key (id_pedido) 
references PEDIDOS (id_pedido),  
constraint fk_detalles_pedidos_productos foreign key (id_producto) 
references PRODUCTOS (id_producto)  
)  

create table FORMAS_PAGOS(
id_forma_pago int identity (1,1), 
forma_pago varchar (150),
recargo int,  
constraint pk_formas_pagos primary key (id_forma_pago)  
) 
create table PEDIDOS_FORMAS_PAGOS(
id_pedido_forma_pago int identity (1,1), 
id_pedido int, 
id_forma_pago int, 
monto decimal (8,2),  
constraint pk_pedidos_formas_pagos primary key (id_pedido_forma_pago), 
constraint fk_pedidos_formas_pagos_pedidos foreign key (id_pedido) 
references PEDIDOS (id_pedido),  
constraint fk_pedidos_formas_pagos_formas_pagos foreign key (id_forma_pago) 
references FORMAS_PAGOS (id_forma_pago)  
)  
create table PLAZOS_ENTREGAS(
id_plazo_entrega int identity (1,1), 
plazo_entrega date,  
constraint pk_plazos_entregas primary key (id_plazo_entrega)  
)
create table PEDIDOS_PLAZOS_ENTREGAS(
id_pedido_plazo_entrega int identity (1,1), 
id_pedido int, 
id_plazo_entrega int,  
constraint pk_pedidos_plazos_entrega primary key (id_pedido_plazo_entrega), 
constraint fk_pedidos_plazos_entrega_pedidos foreign key (id_pedido) 
references PEDIDOS (id_pedido),  
constraint fk_pedidos_plazos_entrega_plazos_entregas foreign key (id_plazo_entrega) 
references PLAZOS_ENTREGAS (id_plazo_entrega)  
) 
create table CONDICIONES(
id_condicion int identity (1,1),  
condicion varchar(100),  
constraint pk_condiciones primary key (id_condicion)   
)
create table PEDIDOS_CONDICIONES(
id_pedido_condicion int identity (1,1), 
id_pedido int, 
id_condicion int, 
id_proveedor int,  
constraint pk_pedidos_condiciones primary key (id_pedido_condicion), 
constraint fk_pedidos_condiciones_pedidos foreign key (id_pedido)  
references PEDIDOS (id_pedido),  
Constraint fk_pedidos_condiciones_condiciones foreign key  (id_condicion) 
references CONDICIONES (id_condicion),  
constraint fk_pedidos_condiciones_proveedores foreign key (id_proveedor) 
references PROVEEDORES (id_proveedor)  
)  
Create Table PROVEEDORES_PRECIOS_COMPRAS(
id_proveedor_precio_compra int identity (1,1), 
id_proveedor int, 
id_producto int, 
precio_compra decimal (8,2),  
CONSTRAINT pk_proveedores_precios_compras Primary Key (id_proveedor_precio_compra), 
CONSTRAINT fk_proveedores_precios_compras_proveedores Foreign Key (id_proveedor) 
References PROVEEDORES (id_proveedor),  
CONSTRAINT fk_proveedores_precios_compra_productos Foreign Key (id_producto)  
References PRODUCTOS (id_producto)  
)     
create table SUCURSALES_UNIDADES(
id_sucursal_unidad int identity (1,1), 
id_sucursal int, 
id_producto int, 
unidad_max int, 
unidad_min int,  
constraint pk_sucursales_unidades primary key (id_sucursal_unidad), 
constraint fk_sucursales_unidades_sucursales foreign key (id_sucursal) 
references SUCURSALES (id_sucursal),  
constraint fk_sucursales_unidades_productos foreign key (id_producto) 
references PRODUCTOS (id_producto)  
)  
create table FORMAS_ALMACENAMIENTOS(
id_forma_almacenamiento int identity (1,1), 
descripcion varchar(150),   
constraint pk_formas_almacenamientos primary key (id_forma_almacenamiento)  
)  
create table PRODUCTOS_FORMAS_ALMACENAMIENTOS(
id_producto_forma_almacenamiento int identity (1,1), 
id_producto int, 
id_forma_almacenamiento int,  
constraint pk_productos_formas_almacenamientos primary key (id_producto_forma_almacenamiento), 
constraint fk_productos_formas_almacenamientos_productos foreign key (id_producto)  
references PRODUCTOS (id_producto),  
constraint fk_productos_formas_almacenamientos_formas_almacenamientos foreign key (id_forma_almacenamiento)  
references FORMAS_ALMACENAMIENTOS (id_forma_almacenamiento)  
)
go
set dateformat dmy
go
insert into PROVINCIAS (nombre_provincia)
values ('Buenos Aires');
insert into PROVINCIAS (nombre_provincia)
values ('Catamarca');
insert into PROVINCIAS (nombre_provincia)
values ('Chaco');
insert into PROVINCIAS (nombre_provincia)
values ('Chubut');
insert into PROVINCIAS (nombre_provincia)
values ('Córdoba');
insert into PROVINCIAS (nombre_provincia)
values ('Corrientes');
insert into PROVINCIAS (nombre_provincia)
values ('Entre Ríos');
insert into PROVINCIAS (nombre_provincia)
values ('Formosa');
insert into PROVINCIAS (nombre_provincia)
values ('Jujuy');
insert into PROVINCIAS (nombre_provincia)
values ('La Pampa');
insert into PROVINCIAS (nombre_provincia)
values ('La Rioja');
insert into PROVINCIAS (nombre_provincia)
values ('Mendoza');
insert into PROVINCIAS (nombre_provincia)
values ('Misiones');
insert into PROVINCIAS (nombre_provincia)
values ('Neuquén');
insert into PROVINCIAS (nombre_provincia)
values ('Río Negro');
insert into PROVINCIAS (nombre_provincia)
values ('Salta');
insert into PROVINCIAS (nombre_provincia)
values ('San Juan');
insert into PROVINCIAS (nombre_provincia)
values ('San Luis');
insert into PROVINCIAS (nombre_provincia)
values ('Santa Cruz');
insert into PROVINCIAS (nombre_provincia)
values ('Santa Fe');
insert into PROVINCIAS (nombre_provincia)
values ('Santiago del Estero');
insert into PROVINCIAS (nombre_provincia)
values ('Tierra del Fuego');
insert into PROVINCIAS (nombre_provincia)
values ('Tucumán');

insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Vicente López', 1);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Tigre', 1);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('La Plata', 1);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Capital Federal', 1);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Antofagasta', 2);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Andalgala', 2);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Poman', 2);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('San Fernando del Valle', 2);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Machagai', 3);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Puerto Tirol', 3);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Resistencia', 3);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Las Breñas', 3);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('El Hoyo', 4);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Trelew', 4);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Rada Tilly', 4);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Comodoro Rivadavia', 4);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Córdoba Capital', 5);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Rio Cuarto', 5);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('San Francisco', 5);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Villa María', 5);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Corrientes Capital', 6);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Curuzu Cuatia', 6);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Goya', 6);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Virasoro', 6);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Concordia', 7);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Concepcion del Uruguay', 7);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Gualeguaychu', 7);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Piedras Blancas', 7);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Formosa Capital', 8);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Clorinda', 8);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Las Lomitas', 8);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Herradura', 8);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('San Salvador de Jujuy', 9);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Purmamarca', 9);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Humahuaca', 9);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Hornillos', 9);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Santa Rosa', 10);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Realico', 10);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('General Acha', 10);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Chacharramendi', 10);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('La Rioja Capital', 11);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Aminga', 11);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Anillaco', 11);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Guandacol', 11);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Mendoza Capital', 12);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Tunuyan', 12);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Uspallata', 12);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Tupungato', 12);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Posadas', 13);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Garupa', 13);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Tobuna', 13);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Puerto Piray', 13);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('San Martín de los Andes', 14);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Neuquén Capital', 14);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Junin de los Andes', 14);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Villa La Angostura', 14);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Viedma', 15);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Las Grutas', 15);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('San Antonio Este', 15);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('San Antonio Oeste', 15);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Salta Capital', 16);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Cafayate', 16);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Tartagal', 16);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Cachi', 16);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('San Juan Capital', 17);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Vallecito', 17);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Calingasta', 17);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Zonda', 17);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('San Luis Capital', 18);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Merlo', 18)
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Juana Koslay', 18);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Villa Elena', 18);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Rio Gallegos', 19);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('El Calafate', 19);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Caleta Olivia', 19);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Puerto San Julian', 19);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Rosario', 20);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Santa Fe Capital', 20);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Rufino', 20);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Firmat', 20);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Sgo. del Estero Capital', 21);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Añatuya', 21);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Termas del Rio Hondo', 21)
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Pinto', 21);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Ushuaia', 22);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Tolhuin', 22);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Rio Grande', 22);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('San Miguel de Tucumán', 23)
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Famailla', 23);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('El Mollar', 23);
insert into LOCALIDADES (nombre_localidad, id_provincia)
values ('Tafi del Valle', 23);

insert into BARRIOS (nombre_barrio, id_localidad)
values ('Olivos', 1);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Florida', 1);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Garrote', 2);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Nueva Esperanza', 2);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Aeropuerto', 3);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Gigante del Oeste', 3);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Palermo', 4);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Puerto Madero', 4);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Tala', 5);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Mirador', 5);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('20 de Febrero', 6);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Milagro', 6);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('San Sebastian', 7);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('20 de Enero', 7);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Villa Cubas', 8);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Choya', 8);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Publo Viejo', 9);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Los Pinos', 9);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('San Francisco', 10);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Av. Italia', 10);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('San José Obrero', 11);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Santa Inés', 11);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Pasión', 12);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Santa Teresita Prol.', 12);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Boysemberry', 13);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Saihueque', 13);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Toma Barrio Norte', 14);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Toma Primera Junta', 14);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('24 de Junio', 15);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Urtubey', 15);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Saavedra', 16);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Laprida', 16);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('San Vicente', 17);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Alberdi', 17);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Villa Alem', 18);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Oncativo', 18);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Sarmiento Zona Sur', 19);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Galpones del Ferrocarril', 19);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Florida', 20);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Barrancas del Sur', 20);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Sol de Mayo', 21);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('La Olla', 21);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('66 Viviendas', 22);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Yagua Rincón', 22);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Los Chakales', 23);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Pando', 23);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Conin', 24);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Circunvalación Norte', 24);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Itati', 25);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Pompeya Sur', 25);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('San Cayetano', 26);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Cantera 25', 26);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Tropas', 27);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Renabap 3644', 27);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Tuyango', 28);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Ruiseñor', 28);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('La Paz', 29);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('San José Obrero', 29);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Juan Domingo Perón', 30);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('29 de Septiembre', 30);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Nueva Esperanza', 31);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Triángulo', 31);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Cáceres', 32);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('2 de Abril', 32);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('San Pedrito', 33);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Cuyaya', 33);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Los Colorados', 34);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Partaleón Cruz', 34);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Quebrada La Cancha', 35);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('7 de Agosto', 35);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Chueche', 36);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Lanlar', 36);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Los Hornos', 37);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Esperanza', 37);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Balbín', 38);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Witru', 38);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Fraga', 39);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Iguña', 39);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Amit', 40);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Balla', 40);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Susana Quintela', 41);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('8 de Diciembre', 41);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Nuni', 42);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Barrium', 42);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Terebiritos', 43);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Juanas', 43);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Copiapó', 44);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('San Martín', 44);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Champagnat', 45);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Residencial Norte', 45);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Luz del Futuro', 46);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('República de Venezuela', 46);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Guildo', 47);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Cerro Negro', 47);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Renabap 3404', 48);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Costal Canal Anchayuyo', 48);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Villa Cabello', 49);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Villa del Barrio Rocamora', 49);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Ñu Porá', 50);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Horacio Quiroga', 50);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Niunba', 51);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Riohay', 51);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Obrero', 52);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Badaraco', 52);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Arenal', 53);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Villa Paur', 53);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Espartaco', 54);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Auka Mawida', 54);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('2 de Abril', 55);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Toscablanca', 55);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Progreso', 56);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Unión', 56);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Los Pulperos', 57);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('23 de Septiembre', 57);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Las Perdices', 58);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Bahía Ballenas', 58);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Renabap 3736', 59);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Malvinas', 59);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Cambio', 60);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Floresta', 60);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Calchaqui', 61);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Toscano', 61);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Fatima', 62);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Romero', 62);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Zorilla', 63);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Tavella', 63);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Portal', 64);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Porres', 64);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Renaba 5826', 65);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('SaS', 65);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Aniceto Tinto', 66);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Costanera Sur', 66);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Roza Oeste', 67);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Laprida', 67);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Cerra de la Cruz', 68);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('La Merced', 68);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Caldén', 69);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Las Lajas', 69);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Cruz de Piedra', 70);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Pringles', 70);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Ferrocarril', 71);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Oca', 71);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Los Lolos', 72);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('San Benito', 72);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Calafate', 73);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Zorrillo', 73);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Gran Jardín', 74);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('17 de Octubre', 74);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Unadepre', 75);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Ción', 75);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Centro', 76);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Del Abasto', 76);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Santa Rosa de Lima', 77);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Candiotti', 77);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Presidente Perón', 78);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Newbery', 79);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Fredriksson', 80);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Colón', 80);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Chumillo', 81);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Tradición', 81);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('La Leñera', 82);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Nestor Kirchner', 82);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('La Paludica', 83);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Maipú', 83);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Nonai', 84);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Nana', 84);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Cerro Cóndor', 85);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Arroyo Grande', 85);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('9 de Octubre', 86);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Provincias Unidas', 86);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Evita', 87);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Barrio Unido', 87);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Microcentro', 88);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Villa 9 de Julio', 88);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Condarco', 89);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Larrea', 89);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Menhires', 90);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('El Sauce', 90);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Tafí', 91);
insert into BARRIOS (nombre_barrio, id_localidad)
values ('Pujillay', 91);

INSERT INTO TIPOS_CONTACTOS(tipo_contacto) VALUES('EMAIL');
INSERT INTO TIPOS_CONTACTOS(tipo_contacto) VALUES('TELEFONO');
INSERT INTO TIPOS_CONTACTOS(tipo_contacto) VALUES('INSTAGRAM');
INSERT INTO TIPOS_CONTACTOS(tipo_contacto) VALUES('TELEGRAM');
INSERT INTO TIPOS_CONTACTOS(tipo_contacto) VALUES('TWITTER');
INSERT INTO TIPOS_CONTACTOS(tipo_contacto) VALUES('WHATSAPP');  
INSERT INTO TIPOS_CONTACTOS(tipo_contacto) VALUES('LINKEDIN');
INSERT INTO TIPOS_CONTACTOS(tipo_contacto) VALUES('SKYPE');
INSERT INTO TIPOS_CONTACTOS(tipo_contacto) VALUES('MESSENGER');

insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Trompito', 'C.606 733', 5,'-34.956624' , '-57.898994');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Rosa alfajores', 'Obispo Esquiú', 14, '-28.396973', '-66.218916');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Dulce Flor','Tucuman 671' , 36, '-33.129515', '-64.330672');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Cedros', 'Pablo Lorentz 551', 52, '-32.475341', ' -58.231416');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Los oros', 'Soldado Argentino 1256', 64, '-26.487911', '-58.315632');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Lirios del bosque', 'Los Guindos 1342', 25, '-42.064769', ' -71.520868');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Abril dulces', 'Fleming 2342', 53, '-33.030818', ' -58.522727');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ( 'Lagos jose', 'Lima 654', 37,'-31.432561', ' -62.107664');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Donas luna', 'Los aromos 321', 31, '-45.842293', '-67.505649');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('candys','Heroes civiles 1424', 47, '-28.046427', '-56.022751');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Masas libertad', 'Del buho 245', 55, '-31.184735', '-59.951411');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('arcel','Antartida Argentina 3412', 35, '-33.099120',' -64.349370');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('las mejores bebidas', 'Jorge Newbery 234', 62, '-24.704836','-60.599188');
insert into FABRICANTES (fabricante, direccion, id_barrio, latitud, longitud)
values ('Las moras','Argandoña 2654', 33, '-31.420052',' -64.149093');

insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud )
                values('ANKA' , 'ANKA S R L ' , 20232 , 'AV FUERZA AEREA 300' , 2 ,'-31.422346767010243', '-64.20101475402744');
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud ) 
                values('ORTIZ' , 'ORTIZ S.A' , 2522 , 'AV FUERZA AEREA 650' , 3 ,'-31.422346767010293', '-64.201014754565744');
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud ) 
                values('ARISTOS DISTRIBUIDORA' , 'FRANCISCO COLOMBO ' , 5050, 'COLON 1000' , 34 ,'-31.42234676656599', '-64.20101585873'); 
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud )
                values('OMELETTE' , 'OMELETTE S.A ' , 878 , 'CUCHA CUCHA 214' , 9 ,'-31.42656988423', '-64.201014754');
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud )
                values('EL TREBOL BEBIDAS' , ' EL TREBOL ' , 25632 , 'MANUEL BELGRANO 202' , 156 ,'-31.23467010243', '-64.1012744');
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud ) 
                values('YRIGOYEN' , 'JUAN PERDO ' , 2099 , 'CORDERO 111' , 1 ,'-31.4246767010243', '-64.201475402744');
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud )
                values('LITO ' , 'LITO S.A ' , 20232 , 'CAPIBARA 700' , 2 ,'-31.422346767010243', '-64.20101475402744');
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud )
                values('HORNERO DISTRI' , 'HORNERO CIA ' , 2772 , 'HORNERO 1100' , 10 ,'-31.4223467010243', '-6401475402744');
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud ) 
                values('ALALA ' , 'ALALA SRL ' , 882 , 'COLON 566' , 6,'-31.422346767010243', '-64.20101475402744');
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion,id_barrio , latitud , longitud ) 
                values('GOODNES' , 'GOODNES SA' , 2099 , 'AV FUERZA AEREA 30' , 54 ,'-31.4223467610243', '-64.201014754027');
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud ) 
                values('FILIOL ' , 'FILIOL ' , 50232 , 'Carakai 210' , 20 ,'-31.422346767013', '-64.20102744'); 
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud ) 
                values(' DARSIE ' , 'DARSIE S.A' , 50232 , 'DUARTE QUIROS 100' , 10 ,'-30.422346736369', '-52.555454'); 
insert into PROVEEDORES( nombre , razón_social, cuil  ,direccion, id_barrio , latitud , longitud ) 
                values(' ARSE ' , 'LUIS Y SIA ' , 50232 , 'QUEBRACHAL 500' , 11 ,'-30.4223467', '-50.55577');

insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('3516789083', 1, 2, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('contacme@hotmail.com', 2, 1, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@Lopez12', 3, 5, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@SoloMensajes', 4, 9, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('24/7 calls', 5, 4, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('luisgutierrez3453@gmail.com', 6, 1, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('Carlos Luis Juez', 7, 8, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('+54 9 139123123', 8, 6, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('Prof. Nelson Jacobo Cantreras', 9, 7, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@SiempreEnLinea', 10, 3, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@Jeronimo321132', 11, 5, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('40249103', 12, 2, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('Marcos Gomez', 13, 4, null);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('43934-3534', null, 2, 1);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('fabricanluis@hotmail.com', null, 1, 2);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@factorysms', null, 3, 3);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('Contacto Secreto Co.', null, 4, 4);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@Mejor_Fabrica', null, 5, 5);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('+54 9 234929324', null, 6, 6);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('Empresa Super Seria', null, 7, 7);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('Fabrica_Contacto_Casi_Muerto777', null, 8, 8);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@menesajes8amfabric', null, 9, 9);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('contactofabrica@yahoo.com', null, 1, 10);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('48242-12342', null, 2, 11);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@EugeSinitra', null, 3, 12);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@JuanDelgado', null, 4, 13);
insert into CONTACTOS (contacto, id_proveedor, id_tipo_contacto, id_fabricante)
values ('@999223_34', null, 5, 14);

insert into SUCURSALES (nombre, direccion, id_barrio, latitud, longitud)
values ('SuperNorte', 'Almirante Brown 123', 4, '-34.43137485688785', '-58.563052501297165');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('SucuLto', 'Calle 7 1234', 5, '-34.91868704376356', '-57.94399795767028');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('El Marce', 'Av. 9 de Julio 567', 21, '-27.455205570440885', '-58.981333257670286');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('LocoTutti', 'Rivadavia 789', 27, '-43.25891049867424', '-65.30525782883514');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Ricardo´s', 'Av.General Paz 1082', 35, '-33.127838416427686', '-64.34868472675622');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Furmacoi', 'San Martín 987', 34, '-31.406222183315254', '-64.18013202873418');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('ConcordiaMax', 'Av. Entre Ríos 654', 49, '-31.396364272737046', '-58.01877374232972');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Pedritensen', 'Maipú 321', 167, '-54.80651315792647', '-68.30221469999817');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Lucia n Bros', 'Av. Belgrano 272', 175, '-27.053145', '-65.405399');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Fermesha', 'España 73', 57, '-26.195432975222086', '-58.211955234164435');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('San Martin', 'Av. San Martín 123', 89, '-32.90257046613415', '-68.84217431349458');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('El Mejor', 'Belgrano 432', 65, '-24.1850561445942', '-65.29919181349457');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Captain McGill', 'Salta', 67, '-23.747225', '-65.499878');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Pampa Cumbre', 'Sarmiento 232', 73, '-36.617787', '-64.294339'); 
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('HiperMendoza', 'Santa Cruz 270', 91, '-33.586232', '-69.020328');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Inmortal', 'Juan B. Justo 1543', 107, '-38.953910', '-68.080974');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Black River', 'Schieroni 475', 113, '-40.81834862661814', '-62.994364999999995');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('El Calafate', 'Gobernador Moyano 567', 147, '-50.33533590577789', '-72.2597460134916');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Susy', 'Av. Belgrano 4321', 121, '-24.785197999810837', '-65.43513334232772');
insert into SUCURSALES(nombre, direccion, id_barrio, latitud, longitud)
values ('Cafayutuy', 'Calixto Mamaní 101', 123, '-26.071382', '-65.972573');


Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values ( 4, 5);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (13, 7);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (2, 15);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (10, 7);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (3, 16);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (1, 3);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (8, 20);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (5, 5);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (2, 6);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (1, 9);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (4, 7);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (8, 19);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (11, 6);
Insert into proveedores_sucursales (id_proveedor, id_sucursal)
values (6, 11);

INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('LACTEO');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('ALIMENTO PERECEDERO');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('GOLOSINA');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('BEBIDA SIN ALCOHOL');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('CIGARRILLOS');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('ENCENDEDOR');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('CEREALES');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('GALLETAS');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('BEBIDA ALCOHOLICA');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('PRODUCTO ELECTRONICO');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('ADEREZOS');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('CARNES');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('ELECTRODOMESTICOS');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('ESPECIAS');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('ALIMENTOS CON TACC');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('ALIMENTOS SIN TACC');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('FRUTAS');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('VERDURAS');
INSERT INTO TIPOS_PRODUCTOS(tipo_producto) VALUES('JUGUETES');

insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Leche Buen Dia Entera', 'Buen Dia', 778234, 'Leche Larga Vida Entera 1 Ltr', 1, 250.99, '12/05/2024', 1);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Leche Sancor Descremada', 'Sancor', 7834, 'Leche Larga Vida Descremada 1 Ltr', 1, 350.99, '02/06/2024', 5);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Arroz Justo', 'Justo', 7034, 'Arroz Blanco Justo 1 Kg', 2, 360,'03/07/2027', 2);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Arroz Sushi', 'Dos Hermanos', 734, 'Arroz para Sushi Dos Hermanos 1 Kg', 2, 500,'22/04/2027', 1);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Gominola Super', 'Gomex', 70133, 'Gomitas Sabor Frutilla', 3, 150.99,'01/03/2024', 3);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Chicle LoL', 'LoL', 733, 'Chicle Sabor Menta', 3, 180,'22/03/2024', 11);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Coca Cola Original', 'Coca Cola', 7045, 'Gaseosa Coca Cola Sabor Cola de 1 Ltr', 4, 400,'15/03/2024', 4);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Doble Cola Sabor Cola', 'Doble Cola', 7445, 'Gaseosa Doble Cola Sabor Cola de 3 Ltr', 4, 550,'15/01/2024', 10);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('ChesterField Convertible 20', 'ChesterField', 7234, 'Cigarrillos ChesterField Convertible de 20', 5, 600, '05/08/2025', 5);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('RedPoint Convertible 20', 'RedPoint', 734, 'Cigarrillos RedPoint Convertible de 20', 5, 1200, '05/04/2025', 3);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('LightUp', 'Lumix', 7453, 'Encendedor LightUp Azul', 6, 250,'14/06/2026', 6);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Lumos', 'Luminos', 7253, 'Encendedor Lumos Verde', 6, 200,'25/06/2026', 6);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('ChocoCrispis Extra Crunch', 'ChocoCripies', 70242, 'Cereal de Copos de Maiz con Chocolate 400 Gr', 7, 500, '20/07/2025', 7);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Frutigram Aros', 'Frutigram', 7042, 'Cereal Aros de Frutas 400 Gr', 7, 450, '20/02/2025', 9);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Chips Pepitos', 'Pepitos', 732, 'Galletas Chips de Chocolate Pepitos 320 Gr', 8, 300, '03/05/2024', 8);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Marias', 'Maria Co', 7832, 'Galletas Vainilla Suave 320 Gr', 8, 400, '03/08/2024', 1);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Quilmes Clásica', 'Quilmes', 7023, 'Cerveza Quilmes Clásica 500 Ml', 9, 450, '04/06/2025', 9);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Tequila Monseñor', 'Monseñor', 7423, 'Tequila Monseñor Extra Fuerte 1 Ltr', 9, 2450, '04/06/2027', 6);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Auriculares Noga', 'Noga', 703342, 'Auriculares de Cable Noga', 10, 600, null, 10);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Parlante JBL', 'JBL', 7342, 'Parlante Bluethoot JBL Pro', 10, 5600, null, 14);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Savora Clásica', 'Savora', 7084, 'Mostaza Savora Clásica 350 Gr', 11, 300, '22/09/2025', 11);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Ketchup Hellman´s', 'Hellman´s', 7244, 'Ketchup Hellman´s Clásica 350 Gr', 11, 400, '22/09/2025', 8);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Molida Express', 'Del Sur', 7032, 'Carne Especial Molida 1 Kg', 12, 1000, '15/10/2023', 12);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Chorizo Cerro', 'Cerro', 70232, 'Chorizo Cerro de Cerdo Premium', 12, 400, '15/10/2023', 1);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Lavarropa Dream', 'Dream', 7323, 'Lavarropa Dream Blanco Capacidad 30 Kg', 13, 88000, null, 13);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Batidora Nuncrem', 'Nuncrem', 72323, 'Batidora Automatica Nuncrem', 13, 8000, null, 13);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Pimentón Rojo Alicante', 'Alicante', 70842, 'Polvo Pimentón Rojo Alicante 100 Gr', 14, 350, '22/07/2024', 14);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Ajo en Polvo Alicante', 'Alicante', 70842, 'Polvo de Ajo Alicante 100 Gr', 14, 350, '22/07/2024', 14);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Harina Enriquecida', 'Luana', 792923, 'Harina Blanca de Trigo Enriquecida 1 Kg', 15, 600, '09/09/2024', 2);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Harina Enriquecida de Arroz', 'La Otra', 724923, 'Harina de Arroz Enriquecida 1 Kg', 15, 800, '10/09/2024', 5);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Brownies Tutti', 'Chocopex', 723422, 'Brownies de Chocolate Sin TACC 300 Gr', 16, 500, '15/03/2024', 6);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Galletas Si', 'Familia Co', 72422, 'Galletas de Chocolate Sin TACC 300 Gr', 16, 450, '15/12/2024', 8);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Manzana Verde', 'Yuli', 982, 'Manzana Verde Rionegrina 180 Gr', 17, 100, '03/08/2023', 4);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Pera Especial', 'Yell', 7032, 'Pera Especial Pampeana 120 Gr', 17, 120, '03/08/2023', 4);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Puerro', 'Verdul', 794, 'Puerro de Estación', 18, 170, '06/10/2023', 8);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Remolacha', 'Verdul', 72234, 'Remolacha de Estación', 18, 110, '06/06/2023', 8);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Buzz Lightyear SuperSonic', 'Mattel', 7043, 'Juguete de BuzzLightyear con Pilas Incluídas', 19, 5500, null, 10);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Woody Cowboy', 'Mattel', 743, 'Juguete de Woody con Pilas Incluídas', 19, 5500, null, 10);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('Televisor BRAVIA 4K AMOLED 55´', 'Sony', 70234, 'Televisor Sony Bravia 4K AMOLED 55´ 120Hz', 13, 358680.99, null, 14);
insert into PRODUCTOS (nombre, marca, cod_barra, descripcion, id_tipo_producto, precio_venta, vencimiento, id_fabricante)
values ('PS5 c/ Lector', 'Sony', 2234, 'PlayStation 5 c/ lector 850 GB SSD', 13, 850000, null, 14);

INSERT INTO TIPOS_MOVIMIENTOS(tipo_movimiento)VALUES('ENTRADA');
INSERT INTO TIPOS_MOVIMIENTOS(tipo_movimiento)VALUES('SALIDA');



INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 5 , 40 ,2, 15 , 2 ,'SE VENDIERON LOS PRODUCTOS', '19/05/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 14 , 50 , 15 , 20 , 2 ,'SE VENDIERON LOS PRODUCTOS', '02/01/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 37 , 5 , 10 , NULL , 1 ,'ESCACEZ DE JUGUETES', '10/03/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 21 , 20 ,17, 15 , 2 ,'SE VENDIERON LOS PRODUCTOS', '31/05/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 20 , 2 ,9, 1 , 2 ,'SE VENDIERON LOS PRODUCTOS', '31/03/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 17 , 21 , 5 ,NULL , 1 ,'SE AGOTO STOCK', '25/06/2020')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 10 , 100 ,8, NULL , 1 ,'ESCACEZ DE CIGARRILLOS', '19/05/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 16 , 12 ,11, 3 , 2 ,'SE VENDIERON LOS PRODUCTOS', '10/04/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 22 , 13 ,18, NULL , 1 ,'RELLENAR STOCK', '1/01/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 15 , 23 , 6, 15 , 2 ,'SE VENDIERON LOS PRODUCTOS', '19/05/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 6 , 20 ,4, NULL , 1 ,'RELLENAR STOCK', '14/05/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 7 , 100 ,7, NULL , 1 ,'ESCACEZ DE PRODUCTO', '19/05/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 18 , 10 ,13, 12 , 2 ,'SE VENDIERON LOS PRODUCTOS', '19/05/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 1 , 12 ,16, NULL , 1 ,'ESCACEZ DE PRODUCTO', '13/11/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 17, 1 ,1, 1 , 2 ,'SE VENDIO EL PRODUCTO', '03/09/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 11 , 11 ,14, 10 , 2 ,'SE VENDIERON LOS PRODUCTOS', '12/10/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 4 , 34 ,18, 15 , 1 ,'REPOSICION DE STOCK', '11/11/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 12 , 10 ,3, 2 , 1 ,'REPOSICION DE STOCK', '19/05/2020')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 2 , 51 ,12, 8 , 1 ,'REPOSICION DE STOCK', '14/05/2023')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 5 , 10 ,5, 15 , 2 ,'SE VENDIERON LOS PRODUCTOS', '04/05/2021')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 9 , 9 ,9, 9 , 2 ,'SE VENDIERON LOS PRODUCTOS', '05/05/2021')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 4 , 30 ,3, 28 , 1 ,'REPOSICION DE STOCK', '07/08/2021')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 10 , 21 ,12, 15 , 2 ,'SE VENDIERON LOS PRODUCTOS', '13/12/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 12 , 21 ,6, 15 , 2 ,'SE VENDIERON LOS PRODUCTOS', '13/12/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 10 , 21 ,7, 1 , 2 ,'REPOSICION DE STOCK', '13/12/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 10 , 23 ,2, 5 , 1 ,'REPOSICION DE STOCK', '13/12/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 1 , 6 ,20, 15 , 1 ,'REPOSICION DE STOCK', '13/12/2022')
INSERT INTO STOCKS(id_producto,cantidad,id_sucursal,cant_venta,id_tipo_movimiento,motivo,fecha_movimiento)
             VALUES( 4 , 21 ,9, 15 , 2 ,'SE VENDIERON LOS PRODUCTOS', '13/12/2022')

insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 1, 2, 20, 32, '02/07/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 2, 3, 10, 100, '15/09/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 3, 4, 12, 15, '25/09/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 5, 6, 38, 90, '05/09/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 7, 8, 4, 31, '19/08/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 8, 9, 19, 100, '27/07/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 10, 11, 36, 35, '21/06/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 12, 13, 8, 50, '28/12/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 13, 14, 24, 31, '16/06/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 14, 15, 14, 70, '04/12/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 16, 17, 23, 50, '30/06/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 17, 18, 6, 500, '11/08/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 18, 19, 40, 4, '25/12/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 20, 1, 24, 17, '09/07/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 1, 5, 9, 79, '23/11/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 7, 11, 26, 100, '13/06/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 15, 8, 7, 500, '31/07/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 20, 1, 34, 33, '08/09/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 9, 8, 2, 132, '26/10/2023');
insert into TRANSFERENCIAS (id_sucursal_origen, id_sucursal_destino, id_producto, cantidad, fecha)
values ( 5, 3, 11, 600, '18/12/2023');

insert into DETALLES_PAGOS (detalle_pago)
values ('Ofrece descuentos por pagos anticipados');
insert into DETALLES_PAGOS (detalle_pago)
values ('Acepta efectivo únicamente');
insert into DETALLES_PAGOS (detalle_pago)
values ('Ofrece descuentos por pagos en efectivo');
insert into DETALLES_PAGOS (detalle_pago)
values ('Permite pagos mediante transferencia bancaria');
insert into DETALLES_PAGOS (detalle_pago)
values ('Acepta pagos con tarjeta de crédito');
insert into DETALLES_PAGOS (detalle_pago)
values ('Permite pagos con tarjetas de débito');
insert into DETALLES_PAGOS (detalle_pago)
values ('Ofrece plazos de pago flexibles');
insert into DETALLES_PAGOS (detalle_pago)
values ('Ofrece condiciones de pago especiales para compras recurrentes');
insert into DETALLES_PAGOS (detalle_pago)
values ('Otorga bonificaciones por pagos puntuales');
insert into DETALLES_PAGOS (detalle_pago)
values ('Permite el pago en cuotas sin interés');
insert into DETALLES_PAGOS (detalle_pago)
values ('Permite pagos a través de aplicaciones móviles');

insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (5, 8);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (9, 5);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (11, 7);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (6, 3);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (2, 1);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (7, 9);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (10, 4);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (3, 11);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (8, 6);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (4, 2);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (12, 10);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (1, 11);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (7, 1);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (2, 8);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (9, 6);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (5, 3);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (11, 10);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (3, 5);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (6, 4);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (8, 7);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (1, 2);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (10, 9);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (4, 1);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (12, 8);
insert into PROVEEDORES_DETALLES_PAGOS (id_proveedor, id_detalle_pago)
values (7, 5);

insert into DETALLES_ENTREGAS (detalle_entrega)
values ('Limite de Entrega de 15 dias');
insert into DETALLES_ENTREGAS (detalle_entrega)
values ('Entrega en menos de 24 horas');
insert into DETALLES_ENTREGAS (detalle_entrega)
values  ('Limite de entrega de 20 dias');
insert into DETALLES_ENTREGAS (detalle_entrega)
values ('Limite de entrega de 7 dias');
insert into DETALLES_ENTREGAS (detalle_entrega)
values ('Busqueda por sucursal mas cercana');
insert into DETALLES_ENTREGAS (detalle_entrega)
values ('Entrega por empresa externa');

insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (5, 4);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (11, 1);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (8, 5);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (2, 3);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (7, 6);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (3, 2);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (9, 1);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (10, 5);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (1, 6);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (12, 4);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (6, 3);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (13, 2);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (4, 1);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (5, 6);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (11, 4);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (8, 3);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (2, 2);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (7, 1);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (3, 5);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (9, 6);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (10, 4);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (1, 3);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (12, 2);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (6, 1);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (13, 5);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (4, 6);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (5, 3);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (11, 2);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (8, 1);
insert into PROVEEDORES_DETALLES_ENTREGAS (id_proveedor, id_detalle_entrega)
values (2, 5);

INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por Telefono');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por medio escrito');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por nota de pedido');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por agente comercial');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por correo electrónico');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('A traves de una aplicacion movil');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Mediante un formulario en linea');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por fax');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por chat en vivo');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('En una tienda física');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('A traves de una plataforma de comercio electronico');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por medio de redes sociales');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por medio de un distribuidor autorizado');
INSERT INTO MEDIOS_PEDIDOS (medio) VALUES ('Por medio de un portal de clientes en linea');

insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (7, 5, '03/04/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (3, 3, '03/07/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (11, 1 , '04/11/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (8, 4, '05/04/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (1, 5, '02/05/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (6, 2, '17/04/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (13, 8, '30/04/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (10, 1, '03/04/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (4, 3, '27/05/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (12, 4, '14/04/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values  (9, 2, '05/09/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values ( 3, 5, '21/03/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values ( 7, 1, '05/11/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (5, 3, '30/04/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (13, 1, '23/03/2023');
insert into Pedidos (id_proveedor, id_medio_pedido, fecha_pedido)
values (3, 5, '13/04/2023');

insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 1 , 1 , 20 , 5019.8)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 12 , 17 , 10 , 4500)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 3, 10 , 5 , 6000)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 10 , 8 , 20 , 11000 )
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 5 , 3  , 5 , 1800)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 6 , 6 , 40 , 7200)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 14 , 2 , 23 , 8072.77)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 9 , 20, 2 , 11200)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 8 , 22 , 15 , 6000)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 4 , 21 , 9 , 2700)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 7, 1 , 20 ,5019.8)
insert into DETALLES_PEDIDOS(id_pedido , id_producto , cantidad, precio_final)
values( 2, 4 , 11 ,6050)

INSERT INTO FORMAS_PAGOS(forma_pago , recargo) VALUES('EFECTIVO' , NULL);
INSERT INTO FORMAS_PAGOS(forma_pago , recargo) VALUES('TRANSFERENCIA ' , NULL);
INSERT INTO FORMAS_PAGOS(forma_pago , recargo) VALUES('TARJETA DE DÉBITO' , 10 );
INSERT INTO FORMAS_PAGOS(forma_pago , recargo) VALUES('TARJETA DE CRÉDITO' , 30);
INSERT INTO FORMAS_PAGOS(forma_pago , recargo) VALUES('FINANCIAMIENTO' , 20);
INSERT INTO FORMAS_PAGOS(forma_pago , recargo) VALUES('CRIPTOMONEDA' , NULL);
INSERT INTO FORMAS_PAGOS(forma_pago , recargo) VALUES('CHEQUES', NULL)

insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 1, 1, 1250.25);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 2, 1, 569.34);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 3, 2, 3980.99);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 4, 2, 780.10);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 5, 3, 2290.55);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 6, 3, 650.78);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 7, 4, 1465.43);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 8, 4, 831.91);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 9, 5, 2015.76);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 10, 5, 420.88);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 11, 6, 1087.67);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 12, 6, 3090.22);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 13, 7, 935.44);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 14, 7, 1762.13);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 15, 1, 521.82);
insert into PEDIDOS_FORMAS_PAGOS (id_pedido, id_forma_pago, monto)
values ( 16, 3, 2798.09);

INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('30/06/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('15/07/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('30/07/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('15/08/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('30/08/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('15/09/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('30/09/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('15/10/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('30/10/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('15/11/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('30/11/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('15/12/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('30/12/2023');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('15/01/2024');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('30/01/2024');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('15/02/2024');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('03/02/2024');
INSERT INTO PLAZOS_ENTREGAS (plazo_entrega) VALUES ('15/03/2024');

insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 1, 2);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 2, 6);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 3, 8);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 4, 12);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 5, 9);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 6, 3);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 7, 14);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 8, 9);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 9, 5);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 10, 7);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 11, 17);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 12, 14);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 13, 7);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 14, 11);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 15, 9);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 16, 18);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 1, 12);
insert into PEDIDOS_PLAZOS_ENTREGAS (id_pedido, id_plazo_entrega)
values ( 8, 10);

insert into CONDICIONES (condicion)
values ('Pago anticipado requerido');
insert into CONDICIONES (condicion)
values ('Descuento por volumen de la compra');
insert into CONDICIONES (condicion)
values ('Envío gratuito');
insert into CONDICIONES (condicion)
values ('Precio especial para cliente recurrente');
insert into CONDICIONES (condicion)
values ('Garantía extendida');
insert into CONDICIONES (condicion)
values ('Devolución gratuita');
insert into CONDICIONES (condicion)
values ('Promoción especial por tiempo limitado');
insert into CONDICIONES (condicion)
values ('Disponibilidad sujeta a stock');
insert into CONDICIONES (condicion)
values ('Impuestos y tasas adicionales');
insert into CONDICIONES (condicion)
values ('Tine una/as restricción/es geográfica/as de entrega/as');
insert into CONDICIONES (condicion)
values ('Exclusividad para cliente VIP o premium');

insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (8, 2, 7);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (15, 6, 9);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (3, 5, 1);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (12, 8, 3);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (6, 4, 10);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (9, 3, 6);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (11, 10, 2);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (14, 1, 11);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (2, 9, 8);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (13, 7, 4);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (5, 11, 12);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (1, 1, 7);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (4, 2, 9);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (16, 6, 3);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (7, 4, 10);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (10, 3, 6);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (8, 10, 2);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (15, 1, 11);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (3, 9, 8);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (12, 7, 4);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (6, 5, 1);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (9, 8, 3);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (11, 4, 10);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (14, 3, 6);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (2, 11, 12);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (13, 1, 7);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (5, 2, 9);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (1, 6, 3);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (4, 4, 10);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (16, 3, 6);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (7, 10, 2);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (10, 1, 11);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (8, 9, 8);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (15, 7, 4);
insert into PEDIDOS_CONDICIONES (id_pedido, id_condicion, id_proveedor)
values (3, 5, 1);

insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  1 , 4 , 500)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  7 , 1, 241.20)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  13 , 11 , 300)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  10 , 8, 620.50)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  2 , 4 , 450.99)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  8 , 4 , 520)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  11 , 13 , 500)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  9 , 13 , 503.99)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  10 , 13 , 490)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  4 , 13 , 500)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  3 , 12 , 500)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  11 , 12 ,200)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values( 1 , 12, 201.99)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  6 , 12 , 200)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  13 , 34 , 190)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  12 , 34 ,120)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  2 , 35 , 100)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  9 , 35 , 170)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  12 , 40 , 850000.00)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  4 , 40 , 855500.00)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  2 , 40 , 800000.00)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  1 , 40 , 450000.00)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  3 , 33 , 100)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  4 , 33 , 98.00)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  7 , 36 , 110.00)
insert into PROVEEDORES_PRECIOS_COMPRAS(id_proveedor , id_producto ,precio_compra)
values(  3 , 1 , 250.99)

insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (7, 32, 255, 120);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (12, 16, 187, 53);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (5, 10, 240, 15);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (18, 27, 290, 30);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (3, 5, 173, 65);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (14, 36, 192, 80);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (9, 20, 120, 60);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (2, 1, 290, 35);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (11, 13, 250, 90);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (17, 29, 180, 50);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (6, 8, 210, 70);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (19, 37, 280, 95);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (1, 2, 150, 20);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (13, 25, 290, 100);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (8, 18, 220, 75);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (4, 6, 200, 40);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (15, 31, 270, 110);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (10, 22, 130, 25);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (20, 39, 175, 55);
insert into SUCURSALES_UNIDADES (id_sucursal, id_producto, unidad_max, unidad_min) 
values (16, 34, 260, 85);

insert into formas_almacenamientos (descripcion)
values ('Mantener en la heladera');
insert into formas_almacenamientos (descripcion)
values ('Ante temperaturas elevadas mantener en la heladera');
insert into formas_almacenamientos (descripcion)
values ('Permanecer en un lugar seco y fresco');
insert into formas_almacenamientos (descripcion)
values ('No necesitan almacenamiento específico');

insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 1, 1);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 2, 1);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 3, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 4, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 5, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 6, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 7, 2);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 8, 2);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 9, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 10, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 11, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 12, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 13, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 14, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 15, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 16, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 17, 1);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 18, 1);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 19, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 20, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 21, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 22, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 23, 1);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 24, 1);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 25, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 26, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 27, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 28, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 29, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 30, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 31, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 32, 3);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 33, 2);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 34, 2);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 35, 2);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 36, 2);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 37, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 38, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 39, 4);
insert into PRODUCTOS_FORMAS_ALMACENAMIENTOS (id_producto, id_forma_almacenamiento)
values ( 40, 4);


----------------------------------------------------------------------------------------------

select p.cod_barra 'COD.BARRA', p.descripcion 'PRODUCTO', P.marca 'MARCA', P.vencimiento 'VENCIMIENTO' , P.precio_venta 'PRECIO ' , su.nombre 'SUCURSAL' , B.nombre_barrio 'BARRIO'
from SUCURSALES su , PRODUCTOS p , STOCKS st , BARRIOS B
where su.id_sucursal = st.id_sucursal and st.id_producto = p.id_producto
AND B.id_barrio = SU.id_sucursal
AND B.nombre_barrio LIKE '%LOS PINOS%'

SELECT p.fecha_pedido 'FECHA' , PR.nombre 'PRODUCTO' , PR.descripcion 'DESCRIPCION', DP.cantidad'CANTIDAD'  ,PR.precio_venta 'PRECIO_VTA', DP.precio_final 'PRECIO FINAL'
, MP.medio 'MEDIO DE PEDIDO' , FP.forma_pago 'FORMA DE PAGO'  , FP.recargo 'RECARGO'
FROM PEDIDOS P
JOIN DETALLES_PEDIDOS DP ON DP.id_pedido = P.id_pedido
JOIN PRODUCTOS PR ON DP.id_producto = PR.id_producto
JOIN MEDIOS_PEDIDOS MP ON MP.id_medio_pedido = P.id_medio_pedido
JOIN PEDIDOS_FORMAS_PAGOS PFP ON PFP.id_pedido = p.id_pedido
JOIN FORMAS_PAGOS FP ON FP.id_forma_pago = PFP.id_forma_pago 
WHERE DATEDIFF(MONTH , FECHA_PEDIDO , GETDATE()) = 2
AND precio_final BETWEEN 1000 AND 20000
AND forma_pago NOT LIKE '[tarjeta]%'
