CREATE TABLE [dimSucursal] (
  [dsu_id] int PRIMARY KEY ,
  [dsuNombre] varchar(50) NOT NULL
)
GO

CREATE TABLE [dimServicio] (
  [dsr_id] int PRIMARY KEY ,
  [dsr_nombre] varchar(50) NOT NULL
)
GO

CREATE TABLE [factServicioRealizado] (
  [dsu_id] int NOT NULL,
  [dsr_id] int NOT NULL,
  [dti_id] int NOT NULL,
  [fsr_cantidad] int NOT NULL DEFAULT (0)
)
GO

CREATE TABLE [dimCapacitation] (
  [dca_id] int PRIMARY KEY ,
  [dca_nombre_capacitacion] varchar(100) NOT NULL
)
GO

CREATE TABLE [dimEstadoOrden] (
  [deo_id] int PRIMARY KEY ,
  [deo_estado] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [factCapacitacionOrden] (
  [dca_id] int NOT NULL,
  [deo_id] int NOT NULL,
  [dti_id] int NOT NULL,
  [fco_cantidad] int NOT NULL DEFAULT (0)
)
GO

CREATE TABLE [dimProducto] (
  [dpr_id] int  primary key ,
  [dpr_nombre] varchar(60)
)
GO

CREATE TABLE [dimCliente] (
  [dcl_id] int PRIMARY KEY ,
  [dcl_nombre] varchar(50) NOT NULL
)
GO

CREATE TABLE [factProductoComprado] (
  [dpr_id] int NOT NULL,
  [dcl_id] int NOT NULL,
  [dti_id] int NOT NULL,
  [fpc_cantidad] int NOT NULL DEFAULT (0)
)
GO

CREATE TABLE [dimTiempo] (
  [dti_id] int PRIMARY KEY ,
  [dti_anio] int,
  [dti_mes] int,
  [dti_semana] int,
  [dti_dia_mes] int,
  [dti_dia_semana] int,
  [dti_semestre] int,
  [dti_quatrimestre] int,
  [dti_trimestre] int
)
GO

ALTER TABLE [factServicioRealizado] ADD FOREIGN KEY ([dsu_id]) REFERENCES [dimSucursal] ([dsu_id])
GO

ALTER TABLE [factServicioRealizado] ADD FOREIGN KEY ([dsr_id]) REFERENCES [dimServicio] ([dsr_id])
GO

ALTER TABLE [factServicioRealizado] ADD FOREIGN KEY ([dti_id]) REFERENCES [dimTiempo] ([dti_id])
GO

ALTER TABLE [factCapacitacionOrden] ADD FOREIGN KEY ([dca_id]) REFERENCES [dimCapacitation] ([dca_id])
GO

ALTER TABLE [factCapacitacionOrden] ADD FOREIGN KEY ([deo_id]) REFERENCES [dimEstadoOrden] ([deo_id])
GO

ALTER TABLE [factCapacitacionOrden] ADD FOREIGN KEY ([dti_id]) REFERENCES [dimTiempo] ([dti_id])
GO

ALTER TABLE [factProductoComprado] ADD FOREIGN KEY ([dpr_id]) REFERENCES [dimProducto] ([dpr_id])
GO

ALTER TABLE [factProductoComprado] ADD FOREIGN KEY ([dcl_id]) REFERENCES [dimCliente] ([dcl_id])
GO

ALTER TABLE [factProductoComprado] ADD FOREIGN KEY ([dti_id]) REFERENCES [dimTiempo] ([dti_id])
GO
