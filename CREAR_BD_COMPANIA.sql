/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [BD_COMPANIA]
GO
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVIDAD](
	[id_actividad] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nchar](20) NULL,
	[nombre] [nchar](20) NULL,
	[descripcion] [nchar](60) NULL,
	[id_pantalla] [int] NULL,
	[tipo_firma] [char](1) NULL,
	[rol_seguridad] [char](1) NULL,
	[tipo_seguridad] [char](1) NULL,
	[requerido] [char](1) NULL,
	[tiempo_minutos] [int] NULL,
	[periodica] [char](1) NULL,
 CONSTRAINT [PK_ACTIVIDAD] PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AD_HOC]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AD_HOC](
	[id_adhoc] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NULL,
	[codigo] [nchar](20) NULL,
	[descripcion] [nchar](60) NULL,
	[tipo_firma] [char](1) NULL,
	[rol_seguridad] [char](1) NULL,
 CONSTRAINT [PK_AD_HOC] PRIMARY KEY CLUSTERED 
(
	[id_adhoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BITACORA]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BITACORA](
	[id_bitacora] [int] IDENTITY(1,1) NOT NULL,
	[line_num] [int] NOT NULL,
	[id_orden] [int] NOT NULL,
	[id_actividad] [int] NULL,
	[valor] [nvarchar](50) NULL,
	[valor_ingresado] [nvarchar](50) NULL,
	[fecha] [datetime] NULL,
	[usuario] [nchar](20) NULL,
 CONSTRAINT [PK_BITACORA] PRIMARY KEY CLUSTERED 
(
	[id_bitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAMBIOS]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAMBIOS](
	[id_estado] [int] NOT NULL,
	[id_cambio] [int] NOT NULL,
 CONSTRAINT [PK_STATUS] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC,
	[id_cambio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CIERRE_PRODUCCION]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CIERRE_PRODUCCION](
	[id_orden] [int] NOT NULL,
	[line_num] [int] IDENTITY(1,1) NOT NULL,
	[turno] [int] NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [PK_CIERRE_PRODUCCION] PRIMARY KEY CLUSTERED 
(
	[id_orden] ASC,
	[line_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COPIA_ACTIVIDAD]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COPIA_ACTIVIDAD](
	[id_actividad] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nchar](20) NULL,
	[nombre] [nchar](20) NULL,
	[descripcion] [nchar](60) NULL,
	[id_pantalla] [int] NULL,
	[tipo_firma] [char](1) NULL,
	[rol_seguridad] [char](1) NULL,
	[requerido] [char](1) NULL,
	[tiempo_minutos] [int] NULL,
	[tipo_empleado] [char](1) NULL,
 CONSTRAINT [PK_COPIA_ACTIVIDAD] PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COPIA_FLUJO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COPIA_FLUJO](
	[id_flujo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_COPIA_FLUJO] PRIMARY KEY CLUSTERED 
(
	[id_flujo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COPIA_FLUJO_PROCESO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COPIA_FLUJO_PROCESO](
	[id_flujo_proceso] [int] IDENTITY(1,1) NOT NULL,
	[id_actividad] [int] NULL,
	[id_flujo] [int] NULL,
 CONSTRAINT [PK_COPIA_FLUJO_PROCESO] PRIMARY KEY CLUSTERED 
(
	[id_flujo_proceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COPIA_PREDECESORA]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COPIA_PREDECESORA](
	[id_predecesora] [int] IDENTITY(1,1) NOT NULL,
	[id_actual] [int] NULL,
	[id_anterior] [int] NULL,
 CONSTRAINT [PK_COPIA_PREDECESORA] PRIMARY KEY CLUSTERED 
(
	[id_predecesora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCUMENTO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCUMENTO](
	[id_documento] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[nombre] [nchar](30) NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_DOCUMENTO] PRIMARY KEY CLUSTERED 
(
	[id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](50) NULL,
	[id_rol] [int] NULL,
	[id_tipo] [int] NULL,
	[usuario] [nchar](20) NULL,
	[contraseña] [nchar](20) NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO](
	[id_estado] [int] NOT NULL,
	[nombre] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FIRMA]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FIRMA](
	[id_firma] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NULL,
	[id_actividad] [int] NULL,
	[id_empleado] [int] NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_FIRMA] PRIMARY KEY CLUSTERED 
(
	[id_firma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FLUJO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FLUJO](
	[id_flujo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_FLUJO] PRIMARY KEY CLUSTERED 
(
	[id_flujo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FLUJO_PROCESO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FLUJO_PROCESO](
	[id_flujo_proceso] [int] IDENTITY(1,1) NOT NULL,
	[id_actividad] [int] NULL,
	[id_flujo] [int] NULL,
 CONSTRAINT [PK_FLUJO_PROCESO] PRIMARY KEY CLUSTERED 
(
	[id_flujo_proceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LINEA]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LINEA](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nchar](60) NULL,
 CONSTRAINT [PK_LINEA] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LISTA_CHEQUEO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LISTA_CHEQUEO](
	[id_actividad] [int] NOT NULL,
	[line_num] [int] IDENTITY(1,1) NOT NULL,
	[texto] [nchar](60) NULL,
 CONSTRAINT [PK_LISTA_CHEQUEO] PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC,
	[line_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LISTA_MATERIAL]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LISTA_MATERIAL](
	[id_producto] [int] NOT NULL,
	[linea_num] [int] IDENTITY(1,1) NOT NULL,
	[id_material] [int] NULL,
 CONSTRAINT [PK_LISTA_MATERIAL] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC,
	[linea_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MATERIAL]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATERIAL](
	[id_material] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NULL,
 CONSTRAINT [PK_MATERIAL] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDEN]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDEN](
	[id_orden] [int] IDENTITY(1,1) NOT NULL,
	[lote] [nchar](10) NULL,
	[id_producto] [int] NULL,
	[id_linea] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_finalizacion] [datetime] NULL,
	[status] [char](1) NULL,
	[id_copia_flujo] [int] NULL,
 CONSTRAINT [PK_ORDEN] PRIMARY KEY CLUSTERED 
(
	[id_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PANTALLA]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PANTALLA](
	[id_pantalla] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nchar](20) NULL,
	[nombre] [nchar](15) NULL,
	[tipo] [int] NULL,
 CONSTRAINT [PK_PANTALLA] PRIMARY KEY CLUSTERED 
(
	[id_pantalla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PREDECESORA]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PREDECESORA](
	[id_predecesora] [int] IDENTITY(1,1) NOT NULL,
	[id_actual] [int] NULL,
	[id_anterior] [int] NULL,
 CONSTRAINT [PK_PREDECESORA] PRIMARY KEY CLUSTERED 
(
	[id_predecesora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_flujo] [int] NULL,
	[descripcion] [nchar](50) NULL,
 CONSTRAINT [PK_PRODUCTO] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NULL,
 CONSTRAINT [PK_ROL] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO](
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NULL,
 CONSTRAINT [PK_TIPO] PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_PANTALLA]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_PANTALLA](
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NULL,
 CONSTRAINT [PK_TIPO_PANTALLA] PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVIDAD_PANTALLA] FOREIGN KEY([id_pantalla])
REFERENCES [dbo].[PANTALLA] ([id_pantalla])
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [FK_ACTIVIDAD_PANTALLA]
GO
ALTER TABLE [dbo].[BITACORA]  WITH CHECK ADD  CONSTRAINT [FK_BITACORA_ACTIVIDAD] FOREIGN KEY([id_actividad])
REFERENCES [dbo].[ACTIVIDAD] ([id_actividad])
GO
ALTER TABLE [dbo].[BITACORA] CHECK CONSTRAINT [FK_BITACORA_ACTIVIDAD]
GO
ALTER TABLE [dbo].[BITACORA]  WITH CHECK ADD  CONSTRAINT [FK_BITACORA_ORDEN] FOREIGN KEY([id_orden])
REFERENCES [dbo].[ORDEN] ([id_orden])
GO
ALTER TABLE [dbo].[BITACORA] CHECK CONSTRAINT [FK_BITACORA_ORDEN]
GO
ALTER TABLE [dbo].[CAMBIOS]  WITH CHECK ADD  CONSTRAINT [FK_CAMBIO_CAMBIO] FOREIGN KEY([id_cambio])
REFERENCES [dbo].[ESTADO] ([id_estado])
GO
ALTER TABLE [dbo].[CAMBIOS] CHECK CONSTRAINT [FK_CAMBIO_CAMBIO]
GO
ALTER TABLE [dbo].[CAMBIOS]  WITH CHECK ADD  CONSTRAINT [FK_ESTADO_ESTADO] FOREIGN KEY([id_estado])
REFERENCES [dbo].[ESTADO] ([id_estado])
GO
ALTER TABLE [dbo].[CAMBIOS] CHECK CONSTRAINT [FK_ESTADO_ESTADO]
GO
ALTER TABLE [dbo].[CIERRE_PRODUCCION]  WITH CHECK ADD  CONSTRAINT [FK_CIERRE_PRODUCCION_ORDEN] FOREIGN KEY([id_orden])
REFERENCES [dbo].[ORDEN] ([id_orden])
GO
ALTER TABLE [dbo].[CIERRE_PRODUCCION] CHECK CONSTRAINT [FK_CIERRE_PRODUCCION_ORDEN]
GO
ALTER TABLE [dbo].[COPIA_FLUJO_PROCESO]  WITH CHECK ADD  CONSTRAINT [FK_COPIA_FLUJO_PROCESO_COPIA_ACTIVIDAD] FOREIGN KEY([id_actividad])
REFERENCES [dbo].[COPIA_ACTIVIDAD] ([id_actividad])
GO
ALTER TABLE [dbo].[COPIA_FLUJO_PROCESO] CHECK CONSTRAINT [FK_COPIA_FLUJO_PROCESO_COPIA_ACTIVIDAD]
GO
ALTER TABLE [dbo].[COPIA_FLUJO_PROCESO]  WITH CHECK ADD  CONSTRAINT [FK_COPIA_FLUJO_PROCESO_COPIA_FLUJO] FOREIGN KEY([id_flujo])
REFERENCES [dbo].[COPIA_FLUJO] ([id_flujo])
GO
ALTER TABLE [dbo].[COPIA_FLUJO_PROCESO] CHECK CONSTRAINT [FK_COPIA_FLUJO_PROCESO_COPIA_FLUJO]
GO
ALTER TABLE [dbo].[COPIA_PREDECESORA]  WITH CHECK ADD  CONSTRAINT [FK_COPIA_PREDECESORA_COPIA_FLUJO_PROCESO] FOREIGN KEY([id_actual])
REFERENCES [dbo].[COPIA_FLUJO_PROCESO] ([id_flujo_proceso])
GO
ALTER TABLE [dbo].[COPIA_PREDECESORA] CHECK CONSTRAINT [FK_COPIA_PREDECESORA_COPIA_FLUJO_PROCESO]
GO
ALTER TABLE [dbo].[COPIA_PREDECESORA]  WITH CHECK ADD  CONSTRAINT [FK_COPIA_PREDECESORA_COPIA_FLUJO_PROCESO1] FOREIGN KEY([id_anterior])
REFERENCES [dbo].[COPIA_FLUJO_PROCESO] ([id_flujo_proceso])
GO
ALTER TABLE [dbo].[COPIA_PREDECESORA] CHECK CONSTRAINT [FK_COPIA_PREDECESORA_COPIA_FLUJO_PROCESO1]
GO
ALTER TABLE [dbo].[DOCUMENTO]  WITH CHECK ADD  CONSTRAINT [FK_DOCUMENTO_PRODUCTO] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTO] ([id_producto])
GO
ALTER TABLE [dbo].[DOCUMENTO] CHECK CONSTRAINT [FK_DOCUMENTO_PRODUCTO]
GO
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_ROL] FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROL] ([id_rol])
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK_EMPLEADO_ROL]
GO
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_TIPO] FOREIGN KEY([id_tipo])
REFERENCES [dbo].[TIPO] ([id_tipo])
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK_EMPLEADO_TIPO]
GO
ALTER TABLE [dbo].[FIRMA]  WITH CHECK ADD  CONSTRAINT [FK_FIRMA_ACTIVIDAD] FOREIGN KEY([id_actividad])
REFERENCES [dbo].[ACTIVIDAD] ([id_actividad])
GO
ALTER TABLE [dbo].[FIRMA] CHECK CONSTRAINT [FK_FIRMA_ACTIVIDAD]
GO
ALTER TABLE [dbo].[FIRMA]  WITH CHECK ADD  CONSTRAINT [FK_FIRMA_EMPLEADO] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[EMPLEADO] ([id_empleado])
GO
ALTER TABLE [dbo].[FIRMA] CHECK CONSTRAINT [FK_FIRMA_EMPLEADO]
GO
ALTER TABLE [dbo].[FIRMA]  WITH CHECK ADD  CONSTRAINT [FK_FIRMA_ROL] FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROL] ([id_rol])
GO
ALTER TABLE [dbo].[FIRMA] CHECK CONSTRAINT [FK_FIRMA_ROL]
GO
ALTER TABLE [dbo].[FLUJO_PROCESO]  WITH CHECK ADD  CONSTRAINT [FK_FLUJO_PROCESO_ACTIVIDAD] FOREIGN KEY([id_actividad])
REFERENCES [dbo].[ACTIVIDAD] ([id_actividad])
GO
ALTER TABLE [dbo].[FLUJO_PROCESO] CHECK CONSTRAINT [FK_FLUJO_PROCESO_ACTIVIDAD]
GO
ALTER TABLE [dbo].[FLUJO_PROCESO]  WITH CHECK ADD  CONSTRAINT [FK_FLUJO_PROCESO_FLUJO] FOREIGN KEY([id_flujo])
REFERENCES [dbo].[FLUJO] ([id_flujo])
GO
ALTER TABLE [dbo].[FLUJO_PROCESO] CHECK CONSTRAINT [FK_FLUJO_PROCESO_FLUJO]
GO
ALTER TABLE [dbo].[LISTA_CHEQUEO]  WITH CHECK ADD  CONSTRAINT [FK_LISTA_CHEQUEO_ACTIVIDAD] FOREIGN KEY([id_actividad])
REFERENCES [dbo].[ACTIVIDAD] ([id_actividad])
GO
ALTER TABLE [dbo].[LISTA_CHEQUEO] CHECK CONSTRAINT [FK_LISTA_CHEQUEO_ACTIVIDAD]
GO
ALTER TABLE [dbo].[LISTA_MATERIAL]  WITH CHECK ADD  CONSTRAINT [FK_LISTA_MATERIAL_MATERIAL] FOREIGN KEY([id_material])
REFERENCES [dbo].[MATERIAL] ([id_material])
GO
ALTER TABLE [dbo].[LISTA_MATERIAL] CHECK CONSTRAINT [FK_LISTA_MATERIAL_MATERIAL]
GO
ALTER TABLE [dbo].[LISTA_MATERIAL]  WITH CHECK ADD  CONSTRAINT [FK_LISTA_MATERIAL_PRODUCTO] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTO] ([id_producto])
GO
ALTER TABLE [dbo].[LISTA_MATERIAL] CHECK CONSTRAINT [FK_LISTA_MATERIAL_PRODUCTO]
GO
ALTER TABLE [dbo].[ORDEN]  WITH CHECK ADD  CONSTRAINT [FK_ORDEN_COPIA_FLUJO] FOREIGN KEY([id_copia_flujo])
REFERENCES [dbo].[COPIA_FLUJO] ([id_flujo])
GO
ALTER TABLE [dbo].[ORDEN] CHECK CONSTRAINT [FK_ORDEN_COPIA_FLUJO]
GO
ALTER TABLE [dbo].[ORDEN]  WITH CHECK ADD  CONSTRAINT [FK_ORDEN_LINEA] FOREIGN KEY([id_linea])
REFERENCES [dbo].[LINEA] ([id_linea])
GO
ALTER TABLE [dbo].[ORDEN] CHECK CONSTRAINT [FK_ORDEN_LINEA]
GO
ALTER TABLE [dbo].[ORDEN]  WITH CHECK ADD  CONSTRAINT [FK_ORDEN_PRODUCTO] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTO] ([id_producto])
GO
ALTER TABLE [dbo].[ORDEN] CHECK CONSTRAINT [FK_ORDEN_PRODUCTO]
GO
ALTER TABLE [dbo].[PANTALLA]  WITH CHECK ADD  CONSTRAINT [FK_PANTALLA_TIPO_PANTALLA] FOREIGN KEY([tipo])
REFERENCES [dbo].[TIPO_PANTALLA] ([id_tipo])
GO
ALTER TABLE [dbo].[PANTALLA] CHECK CONSTRAINT [FK_PANTALLA_TIPO_PANTALLA]
GO
ALTER TABLE [dbo].[PREDECESORA]  WITH CHECK ADD  CONSTRAINT [FK_PREDECESORA_FLUJO_PROCESO] FOREIGN KEY([id_actual])
REFERENCES [dbo].[FLUJO_PROCESO] ([id_flujo_proceso])
GO
ALTER TABLE [dbo].[PREDECESORA] CHECK CONSTRAINT [FK_PREDECESORA_FLUJO_PROCESO]
GO
ALTER TABLE [dbo].[PREDECESORA]  WITH CHECK ADD  CONSTRAINT [FK_PREDECESORA_FLUJO_PROCESO1] FOREIGN KEY([id_anterior])
REFERENCES [dbo].[FLUJO_PROCESO] ([id_flujo_proceso])
GO
ALTER TABLE [dbo].[PREDECESORA] CHECK CONSTRAINT [FK_PREDECESORA_FLUJO_PROCESO1]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_FLUJO] FOREIGN KEY([id_flujo])
REFERENCES [dbo].[FLUJO] ([id_flujo])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_FLUJO]
GO
/****** Object:  StoredProcedure [dbo].[CrearActividad]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearActividad]
	-- Add the parameters for the stored procedure here 
	@nombre nchar(20),
	@descripcion nchar(60),
	@id_pantalla int = NULL,
	@tipo_firma char(1),
	@rol_seguridad char(1),
	@tipo_seguridad char(1),
	@requerido char(1),
	@tiempo_minutos int,
	@periodica char(1),
	@id_actividad int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--hay que generar el codigo automáticamente
	Declare @codigo nchar(20)
	SET @codigo = 'codigo'

    -- Insert statements for procedure here

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO ACTIVIDAD
				(codigo, nombre, descripcion, id_pantalla, tipo_firma, rol_seguridad, tipo_seguridad, 
					requerido, tiempo_minutos, periodica)
			VALUES (@codigo, @nombre, @descripcion, @id_pantalla, @tipo_firma, @rol_seguridad, @tipo_seguridad, 
					@requerido, @tiempo_minutos, @periodica)
			SET @id_actividad = (select MAX(id_actividad) FROM ACTIVIDAD)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[CrearFlujo]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearFlujo]
	-- Add the parameters for the stored procedure here
	@id_flujo int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @table table (id int)


	BEGIN TRY
		BEGIN TRAN
			INSERT
			INTO FLUJO
			OUTPUT inserted.id_flujo INTO @table
			DEFAULT VALUES

			SELECT @id_flujo = id from @table
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH

	

	RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[CrearLinea]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearLinea] 
	-- Add the parameters for the stored procedure here
	@descripcion nchar(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO Linea
			(descripcion)
			VALUES (@descripcion)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[crearListaChequeo]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[crearListaChequeo]
	@idActividad int, @texto nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO LISTA_CHEQUEO
				(id_actividad,texto)
			VALUES (@idActividad,@texto)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[crearPantalla]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[crearPantalla]
	@codigo nvarchar(20), @nombre nvarchar(15), @tipo int
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO PANTALLA
			(codigo,nombre,tipo)
			VALUES (@codigo, @nombre, @tipo)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CrearProducto]    Script Date: 10/11/2017 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearProducto]
	-- Add the parameters for the stored procedure here
	@descripcion nchar(50),
	@id_flujo int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			EXEC CrearFlujo @id_flujo 

			INSERT INTO PRODUCTO
			(id_flujo, descripcion)
			VALUES (@id_flujo ,@descripcion)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH

	RETURN
END

GO
