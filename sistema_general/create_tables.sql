CREATE TABLE [servicio]
(
    [ser_id]          int PRIMARY KEY ,
    [ser_nombre]      varchar(50),
    [ser_descripcion] varchar(50),
    [ser_precio]      decimal,
    [ser_creacion]    datetime,
    [ser_estado]      bit
)
GO

CREATE TABLE [producto]
(
    [pro_id]          int PRIMARY KEY ,
    [pro_nombre]      nvarchar(255),
    [pro_descripcion] nvarchar(255),
    [pro_precio]      decimal
)
GO

CREATE TABLE [sucursal]
(
    [suc_id]        int PRIMARY KEY ,
    [suc_nombre]    varchar(100),
    [suc_direccion] varchar(150),
    [suc_estado]    bit,
    [suc_creacion]  datetime
)
GO

CREATE TABLE [empleado]
(
    [emp_id]       int PRIMARY KEY ,
    [emp_nombre]   varchar(50),
    [emp_apellido] varchar(50),
    [emp_creacion] datetime,
    [emp_estado]   bit,
    [emp_salario]  decimal,
    [suc_id]       int,
    [dep_id]       int,
    [car_id]       int
)
GO

CREATE TABLE [cargo]
(
    [car_id]       int PRIMARY KEY ,
    [car_nombre]   varchar(50) UNIQUE,
    [car_estado]   bit,
    [car_creacion] datetime
)
GO

CREATE TABLE [departamento]
(
    [dep_id]       int PRIMARY KEY ,
    [dep_nombre]   varchar(50),
    [dep_creacion] datetime,
    [dep_estado]   bit
)
GO

CREATE TABLE [beneficio]
(
    [ben_id]          int PRIMARY KEY ,
    [ben_nombre]      varchar(50),
    [ben_descripcion] varchar(100),
    [ben_estado]      bit,
    [ben_creacion]    datetime
)
GO

CREATE TABLE [capacitacion]
(
    [cap_id]       int PRIMARY KEY ,
    [cap_tema]     nvarchar(255),
    [cap_ini]      datetime,
    [cap_fin]      datetime,
    [cap_creacion] datetime,
    [cap_estado]   bit
)
GO

CREATE TABLE [evaluacion]
(
    [eva_id]       int PRIMARY KEY ,
    [eva_nombre]   varchar(50),
    [eva_ini]      datetime,
    [eva_fin]      datetime,
    [eva_creacion] datetime,
    [eva_estado]   bit,
    [emp_id]       int
)
GO

CREATE TABLE [empleado_capacitacion]
(
    [emp_id]       int,
    [cap_id]       int,
    [emc_creacion] datetime,
    [emc_estado]   bit
)
GO

CREATE TABLE [empleado_beneficio]
(
    [emp_id]       int,
    [ben_id]       int,
    [emb_creacion] datetime,
    [emp_estado]   bit
)
GO

CREATE TABLE [ticket]
(
    [tic_id]       int PRIMARY KEY ,
    [tic_numero]   varchar(20),
    [tic_creacion] datetime,
    [tic_estado]   bit,
    [ser_id]       int
)
GO

CREATE TABLE [ticket_empleado]
(
    [tic_id]   int,
    [emp_id]   int,
    [tie_tipo] varchar(10)
)
GO

CREATE TABLE [soporte]
(
    [sop_id]       int PRIMARY KEY ,
    [sop_problema] nvarchar(255),
    [sop_solucion] nvarchar(255),
    [sop_ini]      datetime,
    [sop_fin]      datetime,
    [sop_creacion] datetime,
    [sop_estado]   bit,
    [tic_id]       int
)
GO

CREATE TABLE [actualizacion]
(
    [act_id]       int PRIMARY KEY ,
    [act_sistema]  varchar(30),
    [act_version]  varchar(30),
    [act_fecha]    datetime,
    [act_creacion] datetime,
    [act_estado]   bit,
    [tic_id]       int
)
GO

CREATE TABLE [inventario_hardware]
(
    [int_id]       int PRIMARY KEY ,
    [inh_tipo]     varchar(30),
    [inh_marca]    varchar(30),
    [inh_modelo]   varchar(30),
    [inh_creacion] datetime,
    [inh_estado]   bit,
    [tic_id]       int,
    [com_id]       int
)
GO

CREATE TABLE [inventario_softw]
(
    [softwareId]     int PRIMARY KEY ,
    [ins_tipo]       varchar(30),
    [ins_licencia]   varchar(30),
    [ins_expiracion] datetime,
    [tic_id]         int,
    [com_id]         int
)
GO

CREATE TABLE [contabilidad]
(
    [con_id]            int PRIMARY KEY ,
    [con_tipo_registro] nvarchar(255),
    [con_descripcion]   nvarchar(255),
    [con_creacion]      datetime,
    [con_estado]        bit,
    [emp_id]            int
)
GO

CREATE TABLE [transaccion]
(
    [tra_id]       int PRIMARY KEY ,
    [tra_fecha]    datetime,
    [tra_monto]    decimal,
    [tra_tipo]     nvarchar(255),
    [tra_creacion] datetime,
    [tra_estado]   bit,
    [con_id]       int
)
GO

CREATE TABLE [factura]
(
    [fac_id]            int PRIMARY KEY ,
    [fac_proveedor]     nvarchar(255),
    [fac_fecha_emision] datetime,
    [fac_fecha_pago]    datetime,
    [fac_creacion]      datetime,
    [fac_estado]        bit,
    [tra_id]            int
)
GO

CREATE TABLE [presupuesto]
(
    [pre_id]          int PRIMARY KEY ,
    [pre_anio]        int,
    [pre_monto_total] decimal,
    [pre_creacion]    datetime,
    [pre_estado]      bit,
    [con_id]          int
)
GO

CREATE TABLE [impuesto]
(
    [imp_id]            int PRIMARY KEY ,
    [imp_tipo_impuesto] nvarchar(255),
    [imp_periodo]       nvarchar(255),
    [imp_monto]         decimal,
    [imp_creacion]      datetime,
    [imp_estado]        bit,
    [con_id]            int
)
GO

CREATE TABLE [finanza]
(
    [fin_id]             int PRIMARY KEY ,
    [fin_tipo_operacion] varchar(30),
    [fin_descripcion]    varchar(100),
    [fin_creacion]       datetime,
    [fin_estado]         bit,
    [emp_id]             int
)
GO

CREATE TABLE [planificacion]
(
    [pla_id]         int PRIMARY KEY ,
    [pla_objetivo]   varchar(30),
    [pla_estrategia] varchar(30),
    [pla_creacion]   datetime,
    [pla_estado]     bit,
    [fin_id]         int
)
GO

CREATE TABLE [analisis]
(
    [ana_id]        int PRIMARY KEY ,
    [ana_resultado] varchar(30),
    [ana_creacion]  datetime,
    [ana_estado]    bit,
    [fin_id]        int
)
GO

CREATE TABLE [riesgo]
(
    [rie_id]         int PRIMARY KEY ,
    [rie_tipo]       varchar(30),
    [rie_mitigacion] varchar(50),
    [rie_creacion]   datetime,
    [rie_estado]     bit,
    [fin_id]         int
)
GO

CREATE TABLE [inversiones]
(
    [inv_id]               int PRIMARY KEY ,
    [fin_id]               int,
    [inv_tipo_inversion]   varchar(20),
    [inv_retorno_esperado] decimal,
    [inv_retorno]          decimal,
    [inv_creacion]         datetime,
    [inv_estado]           bit
)
GO

CREATE TABLE [compra]
(
    [com_id]          int PRIMARY KEY ,
    [com_descripcion] nvarchar(255),
    [com_fecha_orden] datetime,
    [com_creacion]    datetime,
    [com_estado]      bit,
    [emp_id]          int,
    [prr_id]          int
)
GO

CREATE TABLE [provedor]
(
    [prr_id]       int PRIMARY KEY ,
    [prr_nombre]   varchar(30),
    [prr_rut]      varchar(30),
    [prr_contacto] varchar(30),
    [prr_telefono] varchar(30),
    [prr_creacion] datetime,
    [prr_estado]   bit
)
GO

CREATE TABLE [orden_compra]
(
    [orc_id]       int PRIMARY KEY ,
    [orc_cantidad] int,
    [orc_creacion] datetime,
    [orc_estado]   bit,
    [com_id]       int,
    [fac_id]       int
)
GO

CREATE TABLE [orden_producto]
(
    [pro_id] int,
    [orc_id] int
)
GO

CREATE TABLE [venta]
(
    [ven_id]     int PRIMARY KEY ,
    [ven_num]    int ,
    [ven_total]  decimal,
    [ven_create] datetime,
    [emp_id]     int,
    [cli_id]     int
)
GO

CREATE TABLE [venta_producto]
(
    [ven_id]       int,
    [pro_id]       int,
    [vep_cantidad] int,
    [vep_precio]   decimal,
    [vep_creacion] datetime,
    [vep_estado]   bit
)
GO

CREATE TABLE [venta_servicio]
(
    [ser_id]       int,
    [ven_id]       int,
    [ves_cantidad] int,
    [ves_precio]   decimal,
    [ves_cracion]  datetime,
    [ves_estado]   bit
)
GO

CREATE TABLE [cliente]
(
    [cli_id]        int PRIMARY KEY ,
    [cli_nombre]    nvarchar(255),
    [cli_direccion] nvarchar(255),
    [cli_telefono]  nvarchar(255)
)
GO

CREATE TABLE [orden_trabajo]
(
    [ort_id]        int PRIMARY KEY ,
    [ort_fecha_ini] datetime,
    [ort_fecha_fin] datetime,
    [ort_total]     decimal,
    [ort_creacion]  datetime,
    [ort_estado]    bit,
    [emp_id]        int,
    [veh_id]        int,
    [cli_id]        int,
    [suc_id]        int
)
GO

CREATE TABLE [trabajo_producto]
(
    [ort_id]       int,
    [pro_id]       int,
    [trp_cantidad] int,
    [trp_precio]   decimal,
    [trp_creacion] datetime,
    [trp_estado]   bit
)
GO

CREATE TABLE [trabajo_servicio]
(
    [ort_id]       int,
    [ser_id]       int,
    [trs_cantidad] int,
    [trs_precio]   decimal,
    [trs_creacion] datetime,
    [trs_estado]   bit
)
GO

CREATE TABLE [vehiculo]
(
    [veh_id]     int PRIMARY KEY ,
    [veh_modelo] nvarchar(255),
    [veh_marca]  nvarchar(255),
    [veh_ano]    int
)
GO

CREATE TABLE [campania]
(
    [cam_id]          int PRIMARY KEY ,
    [cam_nombre]      nvarchar(255),
    [cam_inicio]      datetime,
    [cam_fin]         datetime,
    [cam_tipo]        varchar(10) ,
    [cam_presupuesto] decimal
)
GO

CREATE TABLE [campania_producto]
(
    [cam_id] int,
    [pro_id] int,
    [prm_id] int
)
GO

CREATE TABLE [campania_servicio]
(
    [cam_id] int,
    [ser_id] int,
    [prm_id] int
)
GO

CREATE TABLE [promocion]
(
    [prm_id]            int PRIMARY KEY ,
    [prm_descripcion]   nvarchar(255),
    [prm_descuento]     decimal,
    [prm_multiplicador] int
)
GO

CREATE TABLE [pedido]
(
    [ped_id]       int PRIMARY KEY ,
    [ped_creacion] datetime,
    [ped_estado]   bit,
    [emp_id]       int,
    [ort_id]       int,
    [ven_id]       int,
    [trn_id]       int,
    [rut_id]       int
)
GO

CREATE TABLE [transporte]
(
    [trn_id]        int PRIMARY KEY ,
    [trn_tipo]      varchar(30),
    [trn_capacidad] int
)
GO

CREATE TABLE [ruta]
(
    [rut_id]              int PRIMARY KEY ,
    [rut_origen]          nvarchar(255),
    [rut_destino]         nvarchar(255),
    [rut_tiempo_estimado] datetime
)
GO

CREATE TABLE [inventario]
(
    [inv_id]        int PRIMARY KEY ,
    [pro_id]        int,
    [inv_cantidad]  int,
    [inv_ubicacion] varchar(30),
    [inv_creacion]  datetime,
    [inv_estado]    bit
)
GO

CREATE TABLE [auditoria]
(
    [aud_id]        int PRIMARY KEY ,
    [aud_fecha]     datetime,
    [aud_resultado] nvarchar(255),
    [aud_creacion]  datetime,
    [aud_estado]    bit,
    [inv_id]        int
)
GO

CREATE TABLE [ajuste]
(
    [aju_id]       int PRIMARY KEY ,
    [inv_id]       int,
    [aju_tipo]     varchar(30),
    [aju_cantidad] int,
    [aju_fecha]    datetime,
    [aju_creacion] datetime,
    [aju_estado]   bit
)
GO

CREATE TABLE [factServicioRealizado]
(
    [ort_id] int,
    [suc_id] int,
    [dit_id] int
)
GO

CREATE TABLE [dimTiempo]
(
    [dit_id]           int PRIMARY KEY ,
    [dit_anio]         int,
    [dit_mes]          int,
    [dit_semana]       int,
    [dit_dia_mes]      int,
    [dit_dia_semana]   int,
    [dit_semestre]     int,
    [dit_quatrimestre] int,
    [dit_trimestre]    int
)
GO

CREATE TABLE [factProductoComprado]
(
    [dit_id]   int,
    [pro_id]   int,
    [cli_id]   int,
    [cantidad] int
)
GO

CREATE TABLE [factCapacitacionOrden]
(
    [dit_id]        int,
    [cap_id]        int,
    [ort_id]        int,
    [cant_cerradas] int
)
GO

ALTER TABLE [empleado]
    ADD FOREIGN KEY ([suc_id]) REFERENCES [sucursal] ([suc_id])
GO

ALTER TABLE [empleado]
    ADD FOREIGN KEY ([dep_id]) REFERENCES [departamento] ([dep_id])
GO

ALTER TABLE [empleado]
    ADD FOREIGN KEY ([car_id]) REFERENCES [cargo] ([car_id])
GO

ALTER TABLE [evaluacion]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [empleado_capacitacion]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [empleado_capacitacion]
    ADD FOREIGN KEY ([cap_id]) REFERENCES [capacitacion] ([cap_id])
GO

ALTER TABLE [empleado_beneficio]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [empleado_beneficio]
    ADD FOREIGN KEY ([ben_id]) REFERENCES [beneficio] ([ben_id])
GO

ALTER TABLE [ticket]
    ADD FOREIGN KEY ([ser_id]) REFERENCES [servicio] ([ser_id])
GO

ALTER TABLE [ticket_empleado]
    ADD FOREIGN KEY ([tic_id]) REFERENCES [ticket] ([tic_id])
GO

ALTER TABLE [ticket_empleado]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [soporte]
    ADD FOREIGN KEY ([tic_id]) REFERENCES [ticket] ([tic_id])
GO

ALTER TABLE [actualizacion]
    ADD FOREIGN KEY ([tic_id]) REFERENCES [ticket] ([tic_id])
GO

ALTER TABLE [inventario_hardware]
    ADD FOREIGN KEY ([tic_id]) REFERENCES [ticket] ([tic_id])
GO

ALTER TABLE [inventario_hardware]
    ADD FOREIGN KEY ([com_id]) REFERENCES [compra] ([com_id])
GO

ALTER TABLE [inventario_softw]
    ADD FOREIGN KEY ([tic_id]) REFERENCES [ticket] ([tic_id])
GO

ALTER TABLE [inventario_softw]
    ADD FOREIGN KEY ([com_id]) REFERENCES [compra] ([com_id])
GO

ALTER TABLE [contabilidad]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [transaccion]
    ADD FOREIGN KEY ([con_id]) REFERENCES [contabilidad] ([con_id])
GO

ALTER TABLE [factura]
    ADD FOREIGN KEY ([tra_id]) REFERENCES [transaccion] ([tra_id])
GO

ALTER TABLE [presupuesto]
    ADD FOREIGN KEY ([con_id]) REFERENCES [contabilidad] ([con_id])
GO

ALTER TABLE [impuesto]
    ADD FOREIGN KEY ([con_id]) REFERENCES [contabilidad] ([con_id])
GO

ALTER TABLE [finanza]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [planificacion]
    ADD FOREIGN KEY ([fin_id]) REFERENCES [finanza] ([fin_id])
GO

ALTER TABLE [analisis]
    ADD FOREIGN KEY ([fin_id]) REFERENCES [finanza] ([fin_id])
GO

ALTER TABLE [riesgo]
    ADD FOREIGN KEY ([fin_id]) REFERENCES [finanza] ([fin_id])
GO

ALTER TABLE [inversiones]
    ADD FOREIGN KEY ([fin_id]) REFERENCES [finanza] ([fin_id])
GO

ALTER TABLE [compra]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [compra]
    ADD FOREIGN KEY ([prr_id]) REFERENCES [provedor] ([prr_id])
GO

ALTER TABLE [orden_compra]
    ADD FOREIGN KEY ([com_id]) REFERENCES [compra] ([com_id])
GO

ALTER TABLE [orden_compra]
    ADD FOREIGN KEY ([fac_id]) REFERENCES [factura] ([fac_id])
GO

ALTER TABLE [orden_producto]
    ADD FOREIGN KEY ([pro_id]) REFERENCES [producto] ([pro_id])
GO

ALTER TABLE [orden_producto]
    ADD FOREIGN KEY ([orc_id]) REFERENCES [orden_compra] ([orc_id])
GO

ALTER TABLE [venta]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [venta]
    ADD FOREIGN KEY ([cli_id]) REFERENCES [cliente] ([cli_id])
GO

ALTER TABLE [venta_producto]
    ADD FOREIGN KEY ([ven_id]) REFERENCES [venta] ([ven_id])
GO

ALTER TABLE [venta_producto]
    ADD FOREIGN KEY ([pro_id]) REFERENCES [producto] ([pro_id])
GO

ALTER TABLE [venta_servicio]
    ADD FOREIGN KEY ([ser_id]) REFERENCES [servicio] ([ser_id])
GO

ALTER TABLE [venta_servicio]
    ADD FOREIGN KEY ([ven_id]) REFERENCES [venta] ([ven_id])
GO

ALTER TABLE [orden_trabajo]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [orden_trabajo]
    ADD FOREIGN KEY ([veh_id]) REFERENCES [vehiculo] ([veh_id])
GO

ALTER TABLE [orden_trabajo]
    ADD FOREIGN KEY ([cli_id]) REFERENCES [cliente] ([cli_id])
GO

ALTER TABLE [orden_trabajo]
    ADD FOREIGN KEY ([suc_id]) REFERENCES [sucursal] ([suc_id])
GO

ALTER TABLE [trabajo_producto]
    ADD FOREIGN KEY ([ort_id]) REFERENCES [orden_trabajo] ([ort_id])
GO

ALTER TABLE [trabajo_producto]
    ADD FOREIGN KEY ([pro_id]) REFERENCES [producto] ([pro_id])
GO

ALTER TABLE [trabajo_servicio]
    ADD FOREIGN KEY ([ort_id]) REFERENCES [orden_trabajo] ([ort_id])
GO

ALTER TABLE [trabajo_servicio]
    ADD FOREIGN KEY ([ser_id]) REFERENCES [servicio] ([ser_id])
GO

ALTER TABLE [campania_producto]
    ADD FOREIGN KEY ([cam_id]) REFERENCES [campania] ([cam_id])
GO

ALTER TABLE [campania_producto]
    ADD FOREIGN KEY ([pro_id]) REFERENCES [producto] ([pro_id])
GO

ALTER TABLE [campania_producto]
    ADD FOREIGN KEY ([prm_id]) REFERENCES [promocion] ([prm_id])
GO

ALTER TABLE [campania_servicio]
    ADD FOREIGN KEY ([cam_id]) REFERENCES [campania] ([cam_id])
GO

ALTER TABLE [campania_servicio]
    ADD FOREIGN KEY ([ser_id]) REFERENCES [servicio] ([ser_id])
GO

ALTER TABLE [campania_servicio]
    ADD FOREIGN KEY ([prm_id]) REFERENCES [promocion] ([prm_id])
GO

ALTER TABLE [pedido]
    ADD FOREIGN KEY ([emp_id]) REFERENCES [empleado] ([emp_id])
GO

ALTER TABLE [pedido]
    ADD FOREIGN KEY ([ort_id]) REFERENCES [orden_trabajo] ([ort_id])
GO

ALTER TABLE [pedido]
    ADD FOREIGN KEY ([ven_id]) REFERENCES [venta] ([ven_id])
GO

ALTER TABLE [pedido]
    ADD FOREIGN KEY ([trn_id]) REFERENCES [transporte] ([trn_id])
GO

ALTER TABLE [pedido]
    ADD FOREIGN KEY ([rut_id]) REFERENCES [ruta] ([rut_id])
GO

ALTER TABLE [inventario]
    ADD FOREIGN KEY ([pro_id]) REFERENCES [producto] ([pro_id])
GO

ALTER TABLE [auditoria]
    ADD FOREIGN KEY ([inv_id]) REFERENCES [inventario] ([inv_id])
GO

ALTER TABLE [ajuste]
    ADD FOREIGN KEY ([inv_id]) REFERENCES [inventario] ([inv_id])
GO

ALTER TABLE [factServicioRealizado]
    ADD FOREIGN KEY ([ort_id]) REFERENCES [orden_trabajo] ([ort_id])
GO

ALTER TABLE [factServicioRealizado]
    ADD FOREIGN KEY ([suc_id]) REFERENCES [sucursal] ([suc_id])
GO

ALTER TABLE [factServicioRealizado]
    ADD FOREIGN KEY ([dit_id]) REFERENCES [dimTiempo] ([dit_id])
GO

ALTER TABLE [factProductoComprado]
    ADD FOREIGN KEY ([dit_id]) REFERENCES [dimTiempo] ([dit_id])
GO

ALTER TABLE [factProductoComprado]
    ADD FOREIGN KEY ([pro_id]) REFERENCES [producto] ([pro_id])
GO

ALTER TABLE [factProductoComprado]
    ADD FOREIGN KEY ([cli_id]) REFERENCES [cliente] ([cli_id])
GO

ALTER TABLE [factCapacitacionOrden]
    ADD FOREIGN KEY ([dit_id]) REFERENCES [dimTiempo] ([dit_id])
GO

ALTER TABLE [factCapacitacionOrden]
    ADD FOREIGN KEY ([cap_id]) REFERENCES [capacitacion] ([cap_id])
GO

ALTER TABLE [factCapacitacionOrden]
    ADD FOREIGN KEY ([ort_id]) REFERENCES [orden_trabajo] ([ort_id])
GO
