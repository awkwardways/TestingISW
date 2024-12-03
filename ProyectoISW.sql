CREATE DATABASE PROYECTOISW;

USE PROYECTOISW;

CREATE TABLE Usuarios 
(
	Id_Usuario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Tipo VARCHAR (1) NOT NULL,
	Nombre_Completo VARCHAR (40) NOT NULL,
	Correo_Electronico VARCHAR (256) NOT NULL,
	Contraseña VARCHAR (64) NOT NULL,
	Token VARCHAR (64) NULL,
	Telefono VARCHAR (10) NOT NULL,
	Foto VARBINARY (MAX) NOT NULL
);

CREATE TABLE Propiedades
(
	Id_Propiedad INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Id_Usuario INT NOT NULL,
	Estado CHAR NOT NULL,
	Titulo VARCHAR (100) NOT NULL,
	Descripcion VARCHAR (600) NOT NULL,
	Tipo_Propiedad VARCHAR (20) NOT NULL,
	Precio_Renta INT NOT NULL,
	Superficie VARCHAR(4) NOT NULL,
	Numero_Habitaciones CHAR NOT NULL,
	Numero_Baños CHAR NOT NULL,
	Servicios VARCHAR (50) NOT NULL,
	Direccion VARCHAR (200) NOT NULL,
	Distancia INT NOT NULL,
	Condiciones_Especiales VARCHAR (200) NOT NULL,
	Fecha_Publicacion DATETIME NOT NULL
	FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario)
);

CREATE TABLE Imagenes 
(
	Id_Foto INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Id_Propiedad INT NOT NULL,
	Imagen VARBINARY (MAX) NOT NULL
	FOREIGN KEY (Id_Propiedad) REFERENCES Propiedades(Id_Propiedad)
);

CREATE TABLE Favoritos
(
	Id_Favorito INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Id_Usuario INT NOT NULL,
	Id_Propiedad INT NOT NULL
	FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario),
	FOREIGN KEY (Id_Propiedad) REFERENCES Propiedades(Id_Propiedad)
); 

CREATE TABLE Reseñas
(
	Id_Reseña INt IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Id_Usuario INT NOT NULL,
	Id_Propiedad INT NOT NULL,
	Comentario VARCHAR (256) NOT NULL,
	Calificacion INT NOT NULL,
	Fecha_Creacion DATE NOT NULL,
	FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario),
	FOREIGN KEY (Id_Propiedad) REFERENCES Propiedades(Id_Propiedad)
);

CREATE TABLE Citas
(
	Id_Citas INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Id_Propiedad INT NOT NULL, 
	Id_Usuario INT NOT NULL,
	Fecha_Creacion DATETIME NOT NULL,
	FOREIGN KEY (Id_Propiedad) REFERENCES Propiedades(Id_Propiedad),
	FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario), 
);

CREATE TABLE Rentadas(
Id_Rentada INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
Id_Usuario INT NOT NULL,
Id_Propiedad INT NOT NULL,
Fecha DATE NOT NULL
	FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario),
	FOREIGN KEY (Id_Propiedad) REFERENCES Propiedades(Id_Propiedad)
);

/*Se agregan tablas de dudas y respuestas*/

CREATE TABLE Dudas(
Id_Duda INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Id_Propiedad INT NOT NULL,
Duda VARCHAR(300) NOT NULL,
FechaCreacion DATETIME NOT NULL,
FOREIGN KEY (Id_Propiedad) REFERENCES Propiedades(Id_Propiedad)
);

CREATE TABLE Respuestas(
Id_Respuesta INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Id_Duda INT NOT NULL,
Respuesta VARCHAR (300) NOT NULL,
FechaCreacion DATETIME NOT NULL,
FOREIGN KEY (Id_Duda) REFERENCES Dudas(Id_Duda)
);





































/*C*/
INSERT INTO Usuarios (Tipo, Nombre_Completo, Correo_Electronico, Contraseña, Token, Telefono, Foto) 
VALUES ('B', 'Israel Hernandez', 'hernandez.granados.johan.ipn@gmail.com', '123456', '34', '5580311301', 0xFFD8FFE000104A46494600010101006000600000FFD8FFE000104A46494600010101006000600000FFD8FFE000104A46494600010101006000600000
);

/*R*/
SELECT * FROM Usuarios
WHERE Id_Usuario = 2;

/*U*/
UPDATE Usuarios 
SET Contraseña = '654321'
WHERE Id_Usuario = 2;

/*D*/
DELETE FROM Usuarios
WHERE Id_Usuario = 1;
