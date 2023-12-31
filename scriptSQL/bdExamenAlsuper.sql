USE [master]
GO
/****** Object:  Database [alsuper_examen]    Script Date: 07/12/2023 02:26:17 p. m. ******/
CREATE DATABASE [alsuper_examen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'alsuper_examen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\alsuper_examen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'alsuper_examen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\alsuper_examen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [alsuper_examen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [alsuper_examen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [alsuper_examen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [alsuper_examen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [alsuper_examen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [alsuper_examen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [alsuper_examen] SET ARITHABORT OFF 
GO
ALTER DATABASE [alsuper_examen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [alsuper_examen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [alsuper_examen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [alsuper_examen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [alsuper_examen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [alsuper_examen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [alsuper_examen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [alsuper_examen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [alsuper_examen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [alsuper_examen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [alsuper_examen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [alsuper_examen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [alsuper_examen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [alsuper_examen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [alsuper_examen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [alsuper_examen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [alsuper_examen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [alsuper_examen] SET RECOVERY FULL 
GO
ALTER DATABASE [alsuper_examen] SET  MULTI_USER 
GO
ALTER DATABASE [alsuper_examen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [alsuper_examen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [alsuper_examen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [alsuper_examen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [alsuper_examen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [alsuper_examen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'alsuper_examen', N'ON'
GO
ALTER DATABASE [alsuper_examen] SET QUERY_STORE = ON
GO
ALTER DATABASE [alsuper_examen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [alsuper_examen]
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[idAutores] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[idAutores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[idLibros] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Editorial] [varchar](50) NOT NULL,
	[Anio] [int] NOT NULL,
	[Activo] [tinyint] NOT NULL,
	[idAutor] [int] NOT NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[idLibros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Pw] [varchar](100) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autores] ON 

INSERT [dbo].[Autores] ([idAutores], [Nombre], [Apellido], [Activo]) VALUES (1, N'Miguel', N'De Cervantes', 1)
INSERT [dbo].[Autores] ([idAutores], [Nombre], [Apellido], [Activo]) VALUES (2, N'Marqués', N'De Sade', 1)
INSERT [dbo].[Autores] ([idAutores], [Nombre], [Apellido], [Activo]) VALUES (3, N'Jane', N'Austen', 1)
INSERT [dbo].[Autores] ([idAutores], [Nombre], [Apellido], [Activo]) VALUES (4, N'Mary', N'Shelley', 1)
INSERT [dbo].[Autores] ([idAutores], [Nombre], [Apellido], [Activo]) VALUES (5, N'Victor', N'Hugo', 1)
INSERT [dbo].[Autores] ([idAutores], [Nombre], [Apellido], [Activo]) VALUES (6, N'Moises', N'Guerrero', 1)
SET IDENTITY_INSERT [dbo].[Autores] OFF
GO
SET IDENTITY_INSERT [dbo].[Libros] ON 

INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (1, N'Don Quijote de la Mancha', N'Prueba', 1605, 1, 1)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (2, N'Novelas ejemplares', N'Prueba', 1613, 1, 1)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (3, N'La gitanilla', N'Prueba', 1613, 1, 1)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (4, N'Los 120 diasde Sodoma', N'Prueba', 1904, 1, 2)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (5, N'Justine o los infortunios de la virtud', N'Prueba', 1791, 1, 2)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (6, N'Los crímenes del amor', N'Prueba', 1800, 1, 2)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (7, N'Orgullo y prejuicio', N'Prueba', 1813, 1, 3)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (8, N'Emma', N'Prueba', 1851, 1, 3)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (9, N'Mathilda', N'Prueba', 1959, 1, 4)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (10, N'El último hombre', N'Prueba', 1826, 1, 4)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (11, N'Los miserables', N'Prueba', 1862, 1, 5)
INSERT [dbo].[Libros] ([idLibros], [Titulo], [Editorial], [Anio], [Activo], [idAutor]) VALUES (12, N'Prueba', N'Prueba', 2023, 0, 6)
SET IDENTITY_INSERT [dbo].[Libros] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [Nombre], [Usuario], [Pw], [Correo], [Activo]) VALUES (1, N'ADMIN', N'ADMIN', N'$2a$10$8jrB7b2wQa/rzWfPYL7pF.2Csj7qzMTpL681hhQj488GOQdfHmt1y', N'example@example.com', 1)
INSERT [dbo].[Usuario] ([id], [Nombre], [Usuario], [Pw], [Correo], [Activo]) VALUES (2, N'Moises Guerrero', N'mguerrero', N'$2a$10$IGY.93T1ezGfETLkh2jo9etlwg0sT3Ri1NLCX73UdSKuPSwUQuuNi', N'example@example.com', 1)
INSERT [dbo].[Usuario] ([id], [Nombre], [Usuario], [Pw], [Correo], [Activo]) VALUES (3, N'PRUEBA', N'PRUEBA', N'$2a$10$SoA3xIiz1TAFhKyFNYHEReHn7do9MPrZLl12Et3I2e3flfWmNVlla', N'example@example.com', 0)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Autores] ADD  CONSTRAINT [DF_Autores_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Libros] ADD  CONSTRAINT [DF_Libros_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Autores] FOREIGN KEY([idAutor])
REFERENCES [dbo].[Autores] ([idAutores])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Autores]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_modify_autor]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_modify_autor]
@idAutores int,
@Nombre varchar(50),
@Apellido varchar(50)
AS
 BEGIN
	IF @idAutores>0
		Begin
			UPDATE Autores set Nombre = @Nombre, Apellido = @Apellido WHERE idAutores = @idAutores
		END
	ELSE
		BEGIN
			INSERT INTO Autores (Nombre,Apellido) VALUES (@Nombre, @Apellido)
		END
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_add_modify_user]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_modify_user] 

@id int,
@Nombre varchar(50),
@Usuario varchar(50),
@Pw varchar(100),
@Correo varchar(50)
AS 
BEGIN

	if @id > 0
		BEGIN 
			UPDATE Usuario SET Nombre = @Nombre, Usuario = @Usuario,Pw = @Pw, Correo = @Correo WHERE id = @id
		END
	ELSE
		BEGIN
			INSERT INTO Usuario	(Nombre,Usuario,Pw,Correo) VALUES (@Nombre, @Usuario,@Pw,@Correo);
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_count_book_autores]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_count_book_autores]
AS
	BEGIN
		SELECT CONCAT(a.Nombre,' ',a.Apellido) as Nombre, COUNT(l.idAutor) as Libros FROM Libros L INNER JOIN Autores A ON L.idAutor = A.idAutores group by a.Nombre, a.Apellido ORDER BY A.Nombre, A.Apellido
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_autor]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_autor]
@idAutores int
AS
BEGIN

declare @existeAutor int

SET @existeAutor = (SELECT COUNT(*) FROM Autores WHERE idAutores = @idAutores)

	IF @existeAutor = 0
		BEGIN
			select 'El autor con ese id no existe' as Mensaje;
		END
	ELSE
		BEGIN
			UPDATE Autores set Activo = 0 WHERE idAutores = @idAutores
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_book]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_book] 
@idLibro int,
@idAutor int
AS
	BEGIN

		DECLARE @existeLibro int

		set @existeLibro = (SELECT COUNT(*) FROM Libros WHERE idLibros = @idLibro and idAutor = @idAutor and Activo = 1);


		IF @existeLibro = 0
			BEGIN
				SELECT 'No existe ningun libro con ese autor, o el libro esta eliminado' as Mensaje
			END
		ELSE
			BEGIN
				UPDATE Libros set Activo = 0 WHERE idLibros = @idLibro and idAutor = @idAutor;
			END
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_logical]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_logical]
@id int
AS
	BEGIN
		UPDATE Usuario SET Activo = 0 WHERE id = @id
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_books]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_books]
@Activo int
as 
	begin

		SELECT * FROM Libros WHERE Activo = @Activo

	END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_books_of_autor]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_books_of_autor]
@idAutor int
AS
begin
	DECLARE @existeLibros int

		set @existeLibros = (SELECT COUNT(*) FROM Libros where idAutor = @idAutor and Activo = 1)

	if @existeLibros = 0
		BEGIN
			SELECT 'No existe ningun libro con ese autor' AS Mensaje;
		END
	ELSE
		BEGIN
			SELECT L.Titulo,L.Editorial,L.Anio,CONCAT(a.Nombre,' ',a.Apellido) as Nombre FROM Libros L INNER JOIN Autores A ON L.idAutor=A.idAutores  where L.idAutor = @idAutor and L.Activo =1
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_user]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_user]

AS
	BEGIN

		SELECT * FROM Usuario WHERE Activo = 1

	END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_book]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_book] 
@Titulo varchar(50),
@Editorial varchar(50),
@anio int,
@idAutor int
AS 
BEGIN

	INSERT INTO Libros (Titulo,Editorial,Anio,idAutor) VALUES (@Titulo,@Editorial,@anio,@idAutor);

END
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_login]
@Usuario varchar(50)

AS 
BEGIN
	SELECT * FROM Usuario where Usuario = @Usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_obtener_autores]    Script Date: 07/12/2023 02:26:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_obtener_autores]
@Activo int
AS
BEGIN
SELECT * FROM Autores WHERE Activo = @Activo
END
GO
USE [master]
GO
ALTER DATABASE [alsuper_examen] SET  READ_WRITE 
GO
