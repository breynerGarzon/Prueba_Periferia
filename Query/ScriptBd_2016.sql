USE [master]
GO
/****** Object:  Database [Periferia]    Script Date: 25/11/2020 7:22:22 p. m. ******/
CREATE DATABASE [Periferia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Periferia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Periferia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Periferia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Periferia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Periferia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Periferia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Periferia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Periferia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Periferia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Periferia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Periferia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Periferia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Periferia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Periferia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Periferia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Periferia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Periferia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Periferia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Periferia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Periferia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Periferia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Periferia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Periferia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Periferia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Periferia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Periferia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Periferia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Periferia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Periferia] SET  MULTI_USER 
GO
ALTER DATABASE [Periferia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Periferia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Periferia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Periferia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Periferia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Periferia] SET QUERY_STORE = OFF
GO
USE [Periferia]
GO
/****** Object:  Table [dbo].[Accionistas]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accionistas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonaJuridicaId] [int] NULL,
	[PersonaId] [int] NULL,
	[Paticipación] [float] NULL,
 CONSTRAINT [PK_Accionistas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaAhorro]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaAhorro](
	[NumeroCuenta] [int] IDENTITY(1,1) NOT NULL,
	[SaldoTotal] [decimal](18, 0) NULL,
	[SaldoCanje] [decimal](18, 0) NULL,
	[SaldoDisponible] [decimal](18, 0) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_CuentaAhorro] PRIMARY KEY CLUSTERED 
(
	[NumeroCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Franquicias]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Franquicias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
 CONSTRAINT [PK_Franquisia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientosAhorro]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosAhorro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CuentaAhorroNumeroCuenta] [int] NULL,
	[TiposDeMoviemientosId] [int] NULL,
	[Fecha] [datetime2](7) NULL,
	[Valor] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[DepartamentoId] [int] NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonaJuridica]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonaJuridica](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [int] NULL,
	[Nit] [varchar](12) NULL,
	[RazónSocial] [varchar](50) NULL,
	[TipoDeEmpresaId] [int] NULL,
 CONSTRAINT [PK_PersonaJuridica] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonaNatural]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonaNatural](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [int] NULL,
	[TipoDocumentoId] [int] NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[MunicipioId] [int] NULL,
	[Apellidos] [varchar](100) NULL,
 CONSTRAINT [PK_PersonaNaturak] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonaRol]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonaRol](
	[PersonaId] [int] NULL,
	[RolId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarjetaCrédito]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarjetaCrédito](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CupoAprobado] [decimal](18, 0) NULL,
	[CupoDisponible] [decimal](18, 0) NULL,
	[Estado] [bit] NULL,
	[PersonaId] [int] NULL,
	[FranquiciaId] [int] NULL,
 CONSTRAINT [PK_TarjetaCrédito] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeEmpresa]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeEmpresa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_TipoDeEmpresa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeMoviemientos]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeMoviemientos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_TiposDeMoviemientos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDocumento]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDocumento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_TiposDocumento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titular]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titular](
	[CuentaAhorroId] [int] NULL,
	[PersonaId] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accionistas] ON 

INSERT [dbo].[Accionistas] ([Id], [PersonaJuridicaId], [PersonaId], [Paticipación]) VALUES (4, 1, 1, 2)
INSERT [dbo].[Accionistas] ([Id], [PersonaJuridicaId], [PersonaId], [Paticipación]) VALUES (5, 1, 2, 2)
INSERT [dbo].[Accionistas] ([Id], [PersonaJuridicaId], [PersonaId], [Paticipación]) VALUES (6, 1, 3, 2)
INSERT [dbo].[Accionistas] ([Id], [PersonaJuridicaId], [PersonaId], [Paticipación]) VALUES (7, 2, 4, 2)
INSERT [dbo].[Accionistas] ([Id], [PersonaJuridicaId], [PersonaId], [Paticipación]) VALUES (8, 2, 2, 2)
INSERT [dbo].[Accionistas] ([Id], [PersonaJuridicaId], [PersonaId], [Paticipación]) VALUES (9, 3, 4, 2)
INSERT [dbo].[Accionistas] ([Id], [PersonaJuridicaId], [PersonaId], [Paticipación]) VALUES (10, 3, 2, 2)
INSERT [dbo].[Accionistas] ([Id], [PersonaJuridicaId], [PersonaId], [Paticipación]) VALUES (11, 3, 3, 2)
SET IDENTITY_INSERT [dbo].[Accionistas] OFF
GO
SET IDENTITY_INSERT [dbo].[CuentaAhorro] ON 

INSERT [dbo].[CuentaAhorro] ([NumeroCuenta], [SaldoTotal], [SaldoCanje], [SaldoDisponible], [Estado]) VALUES (1, CAST(300000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CuentaAhorro] ([NumeroCuenta], [SaldoTotal], [SaldoCanje], [SaldoDisponible], [Estado]) VALUES (2, CAST(500000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CuentaAhorro] ([NumeroCuenta], [SaldoTotal], [SaldoCanje], [SaldoDisponible], [Estado]) VALUES (3, CAST(3500000 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CuentaAhorro] ([NumeroCuenta], [SaldoTotal], [SaldoCanje], [SaldoDisponible], [Estado]) VALUES (4, CAST(900000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[CuentaAhorro] OFF
GO
SET IDENTITY_INSERT [dbo].[Franquicias] ON 

INSERT [dbo].[Franquicias] ([Id], [Nombre]) VALUES (1, N'Visa')
INSERT [dbo].[Franquicias] ([Id], [Nombre]) VALUES (2, N'Master')
INSERT [dbo].[Franquicias] ([Id], [Nombre]) VALUES (3, N'American Express')
INSERT [dbo].[Franquicias] ([Id], [Nombre]) VALUES (4, N'Dinner')
SET IDENTITY_INSERT [dbo].[Franquicias] OFF
GO
SET IDENTITY_INSERT [dbo].[MovimientosAhorro] ON 

INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (1, 1, 3, CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (2, 1, 3, CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (3, 1, 3, CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), CAST(500000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (4, 2, 4, CAST(N'2020-11-24T00:00:00.0000000' AS DateTime2), CAST(700000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (5, 1, 1, CAST(N'2020-11-27T00:00:00.0000000' AS DateTime2), CAST(800000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (6, 4, 2, CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (7, 4, 2, CAST(N'2020-11-26T00:00:00.0000000' AS DateTime2), CAST(1300000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (8, 4, 2, CAST(N'2020-11-23T00:00:00.0000000' AS DateTime2), CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (9, 2, 3, CAST(N'2020-11-24T00:00:00.0000000' AS DateTime2), CAST(700000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (10, 1, 3, CAST(N'2020-11-27T00:00:00.0000000' AS DateTime2), CAST(800000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (11, 4, 3, CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (12, 4, 3, CAST(N'2020-11-26T00:00:00.0000000' AS DateTime2), CAST(1300000 AS Decimal(18, 0)))
INSERT [dbo].[MovimientosAhorro] ([Id], [CuentaAhorroNumeroCuenta], [TiposDeMoviemientosId], [Fecha], [Valor]) VALUES (13, 4, 3, CAST(N'2020-11-23T00:00:00.0000000' AS DateTime2), CAST(2000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[MovimientosAhorro] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonaJuridica] ON 

INSERT [dbo].[PersonaJuridica] ([Id], [PersonaId], [Nit], [RazónSocial], [TipoDeEmpresaId]) VALUES (1, 5, N'12345678', N'Razón Social Prueba', 1)
INSERT [dbo].[PersonaJuridica] ([Id], [PersonaId], [Nit], [RazónSocial], [TipoDeEmpresaId]) VALUES (2, 6, N'10020', N'Razón Social Prueba 2', 2)
INSERT [dbo].[PersonaJuridica] ([Id], [PersonaId], [Nit], [RazónSocial], [TipoDeEmpresaId]) VALUES (3, 1, N'4568', N'Razón Social Prueba 3', 3)
SET IDENTITY_INSERT [dbo].[PersonaJuridica] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonaNatural] ON 

INSERT [dbo].[PersonaNatural] ([Id], [PersonaId], [TipoDocumentoId], [NumeroDocumento], [MunicipioId], [Apellidos]) VALUES (1, 1, 3, N'123456', 10, N'Pruebas1')
INSERT [dbo].[PersonaNatural] ([Id], [PersonaId], [TipoDocumentoId], [NumeroDocumento], [MunicipioId], [Apellidos]) VALUES (2, 2, 1, N'1234567', 11, N'Pruebas2')
INSERT [dbo].[PersonaNatural] ([Id], [PersonaId], [TipoDocumentoId], [NumeroDocumento], [MunicipioId], [Apellidos]) VALUES (3, 3, 4, N'123', 11, N'Pruebas3')
SET IDENTITY_INSERT [dbo].[PersonaNatural] OFF
GO
INSERT [dbo].[PersonaRol] ([PersonaId], [RolId]) VALUES (1, 2)
INSERT [dbo].[PersonaRol] ([PersonaId], [RolId]) VALUES (1, 3)
INSERT [dbo].[PersonaRol] ([PersonaId], [RolId]) VALUES (1, 4)
INSERT [dbo].[PersonaRol] ([PersonaId], [RolId]) VALUES (2, 1)
INSERT [dbo].[PersonaRol] ([PersonaId], [RolId]) VALUES (3, 1)
INSERT [dbo].[PersonaRol] ([PersonaId], [RolId]) VALUES (3, 2)
INSERT [dbo].[PersonaRol] ([PersonaId], [RolId]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([Id], [Nombre]) VALUES (1, N'Persona1')
INSERT [dbo].[Personas] ([Id], [Nombre]) VALUES (2, N'Persona2')
INSERT [dbo].[Personas] ([Id], [Nombre]) VALUES (3, N'Persona3')
INSERT [dbo].[Personas] ([Id], [Nombre]) VALUES (4, N'Persona4')
INSERT [dbo].[Personas] ([Id], [Nombre]) VALUES (5, N'Persona5')
INSERT [dbo].[Personas] ([Id], [Nombre]) VALUES (6, N'Persona6')
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (1, N'clientes
persona natural')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (2, N'clientes corporativos')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (3, N'proveedores')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (4, N'accionistas')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (5, N'representantes legales')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[TarjetaCrédito] ON 

INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (1, CAST(2000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), 1, 5, 1)
INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (2, CAST(3000000 AS Decimal(18, 0)), CAST(1800000 AS Decimal(18, 0)), 1, 4, 1)
INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (3, CAST(1000000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), 1, 3, 2)
INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (4, CAST(1500000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), 1, 2, 3)
INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (5, CAST(4300000 AS Decimal(18, 0)), CAST(4300000 AS Decimal(18, 0)), 1, 1, 3)
INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (6, CAST(4000000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), 1, 3, 3)
INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (7, CAST(4000000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), 1, 3, 3)
INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (8, CAST(1200000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), 1, 3, 3)
INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (9, CAST(4000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1, 3, 3)
INSERT [dbo].[TarjetaCrédito] ([Id], [CupoAprobado], [CupoDisponible], [Estado], [PersonaId], [FranquiciaId]) VALUES (10, CAST(5000000 AS Decimal(18, 0)), CAST(2500000 AS Decimal(18, 0)), 1, 4, 3)
SET IDENTITY_INSERT [dbo].[TarjetaCrédito] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeEmpresa] ON 

INSERT [dbo].[TiposDeEmpresa] ([Id], [Nombre]) VALUES (1, N'Sociedad Anónima')
INSERT [dbo].[TiposDeEmpresa] ([Id], [Nombre]) VALUES (2, N'Limitada')
INSERT [dbo].[TiposDeEmpresa] ([Id], [Nombre]) VALUES (3, N'Sociedad Colectiva')
SET IDENTITY_INSERT [dbo].[TiposDeEmpresa] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeMoviemientos] ON 

INSERT [dbo].[TiposDeMoviemientos] ([Id], [Nombre]) VALUES (1, N'Depósito en Efectivo')
INSERT [dbo].[TiposDeMoviemientos] ([Id], [Nombre]) VALUES (2, N'Depósito en
Cheque')
INSERT [dbo].[TiposDeMoviemientos] ([Id], [Nombre]) VALUES (3, N'Retiro')
INSERT [dbo].[TiposDeMoviemientos] ([Id], [Nombre]) VALUES (4, N'Compra Nacional')
INSERT [dbo].[TiposDeMoviemientos] ([Id], [Nombre]) VALUES (5, N'Cuota de Manejo')
INSERT [dbo].[TiposDeMoviemientos] ([Id], [Nombre]) VALUES (6, N'Pago de Tarjeta')
INSERT [dbo].[TiposDeMoviemientos] ([Id], [Nombre]) VALUES (7, N'Retiro por Avance')
SET IDENTITY_INSERT [dbo].[TiposDeMoviemientos] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDocumento] ON 

INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (1, N'Cedula
de Ciudadanía')
INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (2, N'con Tarjeta de Identidad')
INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (3, N'Pasaporte')
INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (4, N'Cedula de Extranjería')
SET IDENTITY_INSERT [dbo].[TiposDocumento] OFF
GO
INSERT [dbo].[Titular] ([CuentaAhorroId], [PersonaId]) VALUES (1, 2)
INSERT [dbo].[Titular] ([CuentaAhorroId], [PersonaId]) VALUES (1, 1)
INSERT [dbo].[Titular] ([CuentaAhorroId], [PersonaId]) VALUES (3, 3)
INSERT [dbo].[Titular] ([CuentaAhorroId], [PersonaId]) VALUES (3, 2)
INSERT [dbo].[Titular] ([CuentaAhorroId], [PersonaId]) VALUES (1, 3)
INSERT [dbo].[Titular] ([CuentaAhorroId], [PersonaId]) VALUES (1, 4)
INSERT [dbo].[Titular] ([CuentaAhorroId], [PersonaId]) VALUES (2, 1)
INSERT [dbo].[Titular] ([CuentaAhorroId], [PersonaId]) VALUES (1, 5)
INSERT [dbo].[Titular] ([CuentaAhorroId], [PersonaId]) VALUES (4, 5)
GO
/****** Object:  StoredProcedure [dbo].[DeudaPorFranquicia]    Script Date: 25/11/2020 7:22:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[DeudaPorFranquicia]
 as
 (
  Select 
   Fr.Nombre as Franquicia,
   Sum(Tc.CupoAprobado) - Sum(Tc.CupoDisponible)  as DeudaFrancia,
   Count(*) as CantidadTarjetas
  From TarjetaCrédito Tc
  Inner Join Franquicias Fr On Fr.Id =  Tc.FranquiciaId
  group by Fr.Nombre, Fr.Id
)
GO
USE [master]
GO
ALTER DATABASE [Periferia] SET  READ_WRITE 
GO
