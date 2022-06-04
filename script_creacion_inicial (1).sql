--select * from gd_esquema.Maestra

USE GD1C2022
GO

--CREACIÓN DE SCHEMA--------------------------------
CREATE SCHEMA LOCRO;
GO

--CREACIÓN DE TABLAS--------------------------------

--Escudería
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'ESCUDERIA')
CREATE TABLE LOCRO.ESCUDERIA(
ESCUDERIA_ID int IDENTITY PRIMARY KEY,
ESCUDERIA_NOMBRE nvarchar(255) not null,
ESCUDERIA_NACIONALIDAD nvarchar(255) null,
);
--Piloto
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'PILOTO')
CREATE TABLE LOCRO.PILOTO(
PILOTO_ID int IDENTITY PRIMARY KEY,
PILOTO_NOMBRE nvarchar(50) not null,
PILOTO_APELLIDO nvarchar(50) not null,
PILOTO_NACIONALIDAD nvarchar(50) null,
PILOTO_NACIMIENTO datetime2(3) null
);
--Auto
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'AUTO')
CREATE TABLE LOCRO.AUTO(
AUTO_ID int IDENTITY PRIMARY KEY,
AUTO_NUMERO int,
AUTO_MODELO nvarchar(255) null,
AUTO_PILOTO int not null,
AUTO_ESCUDERIA int not null
);
--Circuito
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'CIRCUITO')
CREATE TABLE LOCRO.CIRCUITO(
CIRCUITO_CODIGO int PRIMARY KEY,
CIRCUITO_NOMBRE nvarchar(255) not null,
CIRCUITO_PAIS nvarchar(255) null,
);
--Sector
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'SECTOR')
CREATE TABLE LOCRO.SECTOR(
SECTOR_CODIGO int PRIMARY KEY,
SECTOR_TIPO nvarchar(255) not null,
SECTOR_DISTANCIA decimal(18,2) null,
SECTOR_CIRCUITO int not null
);
--Carrera
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'CARRERA')
CREATE TABLE LOCRO.CARRERA(
CARRERA_CODIGO int PRIMARY KEY,
CARRERA_FECHA datetime2(3) not null,
CARRERA_CLIMA nvarchar(255) null,
CARRERA_TOTAL_CARRERA decimal (18,2) null,
CARRERA_CANT_VUELTAS int null,
CARRERA_CIRCUITO int not null,
);
--Bandera
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BANDERA')
CREATE TABLE LOCRO.BANDERA(
BANDERA_ID int IDENTITY PRIMARY KEY,
BANDERA_COLOR nvarchar(255) not null
);
--Tipo_incidente
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'TIPO_INCIDENTE')
CREATE TABLE LOCRO.TIPO_INCIDENTE(
TIPO_INCIDENTE_ID int IDENTITY PRIMARY KEY,
TIPO_INCIDENTE_DESCRIPCION nvarchar(255) not null
);
--Incidente
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'INCIDENTE')
CREATE TABLE LOCRO.INCIDENTE(
INCIDENTE_ID int IDENTITY PRIMARY KEY,
INCIDENTE_BANDERA int REFERENCES LOCRO.BANDERA not null,
INCIDENTE_SECTOR int REFERENCES LOCRO.SECTOR not null,
INCIDENTE_TIPO int not null,
INCIDENTE_TIEMPO decimal not null
);
--Tele_auto
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'TELE_AUTO')
CREATE TABLE LOCRO.TELE_AUTO(
TELE_AUTO_CODIGO int PRIMARY KEY,
TELE_AUTO_NRO_VUELTA nvarchar(255) not null,
TELE_AUTO_DISTANCIA_VUELTA decimal(18,2) null,
TELE_AUTO_DISTANCIA_CARRERA decimal(18,2) null,
TELE_AUTO_POSICION decimal(18,2) null,
TELE_AUTO_TIEMPO_VUELTA decimal(18,2) null,
TELE_AUTO_VELOCIDAD decimal(18,2) null,
TELE_AUTO_COMBUSTIBLE decimal(18,2) null,
TELE_AUTO_AUTO int REFERENCES LOCRO.AUTO not null,
TELE_AUTO_CARRERA int not null,
TELE_AUTO_SECTOR int not null,
);
--Caja
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'CAJA')
CREATE TABLE LOCRO.CAJA(
CAJA_ID int IDENTITY PRIMARY KEY,
CAJA_NRO_SERIE nvarchar(255) not null,
CAJA_MODELO nvarchar(255) null,
);
--Tele_caja
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'TELE_CAJA')
CREATE TABLE LOCRO.TELE_CAJA(
TELE_CAJA_NUMERO int IDENTITY PRIMARY KEY,
TELE_CAJA_CAJA int REFERENCES LOCRO.CAJA not null,
TELE_CAJA_TEMP_ACEITE decimal(18,2) null,
TEMP_CAJA_RPM decimal(18,2) null,
TELE_CAJA_DESGASTE decimal(18,2) null,
TELE_CAJA_TELE_AUTO int not null,
);
--Motor
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'MOTOR')
CREATE TABLE LOCRO.MOTOR(
MOTOR_ID int IDENTITY PRIMARY KEY,
MOTOR_NRO_SERIE nvarchar(255) not null,
MOTOR_MODELO nvarchar(255) null
);
--Tele_motor
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'TELE_MOTOR')
CREATE TABLE LOCRO.TELE_MOTOR(
TELE_MOTOR_NUMERO int IDENTITY PRIMARY KEY,
TELE_MOTOR_MOTOR int not null,
TELE_MOTOR_POTENCIA decimal(18,2) null,
TELE_MOTOR_RPM decimal(18,2) null,
TELE_MOTOR_TEMP_ACEITE decimal(18,2) null,
TELE_MOTOR_TEMP_AGUA decimal(18,2) null,
TELE_MOTOR_TELE_AUTO int not null
);
--Freno
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'FRENO')
CREATE TABLE LOCRO.FRENO(
FRENO_ID int IDENTITY PRIMARY KEY,
FRENO_NRO_SERIE nvarchar(255) not null,
FRENO_TAMANIO_DISCO decimal(18,2) null
);
--Tele_freno
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'TELE_FRENO')
CREATE TABLE LOCRO.TELE_FRENO(
TELE_FRENO_NUMERO int IDENTITY PRIMARY KEY,
TELE_FRENO_FRENO int not null,
TELE_FRENO_GROSOR decimal(18,2) null,
TELE_FRENO_POSICION nvarchar(255) null,
TELE_FRENO_TEMPERATURA decimal(18,2) null,
TELE_FRENO_TELE_AUTO int not null
);
--Tipo_neumático
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'TIPO_NEUMATICO')
CREATE TABLE LOCRO.TIPO_NEUMATICO(
TIPO_NEUMATICO_ID int IDENTITY PRIMARY KEY,
TIPO_NEUMATICO_DESCRIPCION nvarchar(255) not null
);
--Neumático
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'NEUMATICO')
CREATE TABLE LOCRO.NEUMATICO(
NEUMATICO_ID int IDENTITY PRIMARY KEY,
NEUMATICO_NRIO_SERIE nvarchar(255) not null,
NEUMATICO_TIPO int not null
);
--Tele_neumático
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'TELE_NEUMATICO')
CREATE TABLE LOCRO.TELE_NEUMATICO(
TELE_NEUMATICO_NUMERO int IDENTITY PRIMARY KEY,
TELE_NEUMATICO_NEUMATICO int not null, --cambie del DER este dato para que haga referencia a la tabla NEUMATICO
TELE_NEUMATICO_PRESION decimal(18,2) null,
TELE_NEUMATICO_POSICION nvarchar(255),
TELE_NEUMATICO_PROFUNDIDAD decimal(18,2) null,
TELE_NEUMATICO_TEMPERATURA decimal(18,2) null,
TELE_NEUMATICO_TELE_AUTO int not null
);
--Incidente_auto
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'INCIDENTE_AUTO')
CREATE TABLE LOCRO.INCIDENTE_AUTO(
AUTO_ID int REFERENCES LOCRO.AUTO,
INCIDENTE_ID int not null,
NRO_DE_VUELTA int not null,
PRIMARY KEY(AUTO_ID, INCIDENTE_ID)
);
--Autos_x_carrera
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'AUTO_CARRERA')
CREATE TABLE LOCRO.AUTO_CARRERA(
AUTO_ID int not null,
CARRERA_CODIGO int not null,
PRIMARY KEY(AUTO_ID, CARRERA_CODIGO)
);
--Parada_box
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'PARADA_BOX')
CREATE TABLE LOCRO.PARADA_BOX(
PARADA_ID int IDENTITY PRIMARY KEY,
PARADA_AUTO int not null,
PARADA_CARRERA int not null,
PARADA_VUELTA decimal(18,2) null,
PARADA_TIEMPO decimal(18,2) null,
);
--Cambio_neumático
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'CAMBIO_NEUMATICO')
CREATE TABLE LOCRO.CAMBIO_NEUMATICO(
CAMBIO_NUEVO int not null,
CAMBIO_VIEJO int not null,
CAMBIO_POSICION nvarchar(255) null,
CAMBIO_PARADA int not null,
PRIMARY KEY(CAMBIO_NUEVO, CAMBIO_VIEJO)
);

--FOREIGN KEYS-----------------------------
ALTER TABLE LOCRO.AUTO
ADD CONSTRAINT FK_AUTO_ESCUDERIA
FOREIGN KEY (AUTO_ESCUDERIA) REFERENCES LOCRO.ESCUDERIA(ESCUDERIA_ID),
CONSTRAINT FK_AUTO_PILOTO
FOREIGN KEY (AUTO_PILOTO) REFERENCES LOCRO.PILOTO(PILOTO_ID)

ALTER TABLE LOCRO.SECTOR
ADD CONSTRAINT FK_SECTOR_CIRCUITO
FOREIGN KEY (SECTOR_CIRCUITO) REFERENCES LOCRO.CIRCUITO(CIRCUITO_CODIGO)

ALTER TABLE LOCRO.CARRERA
ADD CONSTRAINT FK_CARRERA_CIRCUITO
FOREIGN KEY (CARRERA_CIRCUITO) REFERENCES LOCRO.CIRCUITO(CIRCUITO_CODIGO)

ALTER TABLE LOCRO.INCIDENTE
ADD CONSTRAINT FK_INCIDENTE_BANDERA
FOREIGN KEY (INCIDENTE_BANDERA) REFERENCES LOCRO.BANDERA(BANDERA_ID),
CONSTRAINT FK_INCIDENTE_SECTOR
FOREIGN KEY (INCIDENTE_SECTOR) REFERENCES LOCRO.SECTOR (SECTOR_CODIGO),
CONSTRAINT FK_INCIDENTE_TIPO
FOREIGN KEY (INCIDENTE_TIPO) REFERENCES LOCRO.TIPO_INCIDENTE (TIPO_INCIDENTE_ID)

ALTER TABLE LOCRO.TELE_AUTO
ADD CONSTRAINT FK_TELE_AUTO_AUTO
FOREIGN KEY (TELE_AUTO_AUTO) REFERENCES LOCRO.AUTO (AUTO_ID),
CONSTRAINT FK_TELE_AUTO_CARRERA
FOREIGN KEY (TELE_AUTO_CARRERA) REFERENCES LOCRO.CARRERA (CARRERA_CODIGO),
CONSTRAINT FK_TELE_AUTO_SECTOR
FOREIGN KEY (TELE_AUTO_SECTOR) REFERENCES LOCRO.SECTOR (SECTOR_CODIGO)

ALTER TABLE LOCRO.TELE_CAJA
ADD CONSTRAINT FK_TELE_CAJA_CAJA
FOREIGN KEY (TELE_CAJA_CAJA) REFERENCES LOCRO.CAJA (CAJA_ID),
CONSTRAINT FK_TELE_CAJA_TELE_AUTO
FOREIGN KEY (TELE_CAJA_TELE_AUTO) REFERENCES LOCRO.TELE_AUTO (TELE_AUTO_CODIGO)

ALTER TABLE LOCRO.TELE_MOTOR
ADD CONSTRAINT FK_TELE_MOTOR_MOTOR
FOREIGN KEY (TELE_MOTOR_MOTOR) REFERENCES LOCRO.MOTOR (MOTOR_ID),
CONSTRAINT FK_TELE_MOTOR_TELE_AUTO
FOREIGN KEY (TELE_MOTOR_TELE_AUTO) REFERENCES LOCRO.TELE_AUTO (TELE_AUTO_CODIGO)

ALTER TABLE LOCRO.TELE_FRENO
ADD CONSTRAINT FK_TELE_FRENO_FRENO
FOREIGN KEY (TELE_FRENO_FRENO) REFERENCES LOCRO.FRENO (FRENO_ID),
CONSTRAINT FK_TELE_FRENO_TELE_AUTO
FOREIGN KEY (TELE_FRENO_TELE_AUTO) REFERENCES LOCRO.TELE_AUTO (TELE_AUTO_CODIGO)

ALTER TABLE LOCRO.NEUMATICO
ADD CONSTRAINT FK_NEUMATICO_TIPO
FOREIGN KEY (NEUMATICO_TIPO) REFERENCES LOCRO.TIPO_NEUMATICO (TIPO_NEUMATICO_ID)

ALTER TABLE LOCRO.TELE_NEUMATICO
ADD CONSTRAINT FK_TELE_NEUMATICO_NEUMATICO
FOREIGN KEY (TELE_NEUMATICO_NEUMATICO) REFERENCES LOCRO.NEUMATICO (NEUMATICO_ID),
CONSTRAINT FK_TELE_NEUMATICO_TELE_AUTO
FOREIGN KEY (TELE_NEUMATICO_TELE_AUTO) REFERENCES LOCRO.TELE_AUTO (TELE_AUTO_CODIGO)

ALTER TABLE LOCRO.INCIDENTE_AUTO
ADD CONSTRAINT FK_INCIDENTE_AUTO_AUTO
FOREIGN KEY (AUTO_ID) REFERENCES LOCRO.AUTO (AUTO_ID),
CONSTRAINT FK_INCIDENTE_AUTO_INCIDENTE
FOREIGN KEY (INCIDENTE_ID) REFERENCES LOCRO.INCIDENTE (INCIDENTE_ID)

ALTER TABLE LOCRO.AUTO_CARRERA
ADD CONSTRAINT FK_AUTO_CARRERA_AUTO
FOREIGN KEY (AUTO_ID) REFERENCES LOCRO.AUTO (AUTO_ID),
CONSTRAINT FK_AUTO_CARRERA_CARRERA
FOREIGN KEY (CARRERA_CODIGO) REFERENCES LOCRO.CARRERA (CARRERA_CODIGO)

ALTER TABLE LOCRO.PARADA_BOX
ADD CONSTRAINT FK_PARADA_AUTO
FOREIGN KEY (PARADA_AUTO) REFERENCES LOCRO.AUTO (AUTO_ID),
CONSTRAINT FK_PARADA_CARRERA
FOREIGN KEY (PARADA_CARRERA) REFERENCES LOCRO.CARRERA (CARRERA_CODIGO)

ALTER TABLE LOCRO.CAMBIO_NEUMATICO
ADD CONSTRAINT FK_CAMBIO_NEUMATICO_NUEVO
FOREIGN KEY (CAMBIO_NUEVO) REFERENCES LOCRO.NEUMATICO (NEUMATICO_ID),
CONSTRAINT FK_CAMBIO_NEUMATICO_VIEJO
FOREIGN KEY (CAMBIO_VIEJO) REFERENCES LOCRO.NEUMATICO (NEUMATICO_ID),
CONSTRAINT FK_CAMBIO_NEUMATICO_PARADA
FOREIGN KEY (CAMBIO_PARADA) REFERENCES LOCRO.PARADA_BOX (PARADA_ID)

--CREACIÓN DE VISTAS--------------------------------
--CREACIÓN DE STORED PROCEDURES PARA MIGRACIÓN-------------------------

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_escuderia')
	DROP PROCEDURE migrar_escuderia
GO

CREATE PROCEDURE migrar_escuderia
 AS
  BEGIN
    INSERT INTO LOCRO.ESCUDERIA (ESCUDERIA_NOMBRE, ESCUDERIA_NACIONALIDAD)
	SELECT DISTINCT ESCUDERIA_NOMBRE, ESCUDERIA_NACIONALIDAD
	FROM gd_esquema.Maestra
	WHERE ESCUDERIA_NOMBRE IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_piloto')
	DROP PROCEDURE migrar_piloto
GO

CREATE PROCEDURE migrar_piloto
 AS
  BEGIN
    INSERT INTO LOCRO.PILOTO (PILOTO_NOMBRE, PILOTO_APELLIDO, PILOTO_NACIONALIDAD, PILOTO_NACIMIENTO)
	SELECT DISTINCT PILOTO_NOMBRE, PILOTO_APELLIDO, PILOTO_NACIONALIDAD, PILOTO_FECHA_NACIMIENTO
	FROM gd_esquema.Maestra
	WHERE PILOTO_NOMBRE IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_auto')
	DROP PROCEDURE migrar_auto
GO

CREATE PROCEDURE migrar_auto
 AS
  BEGIN
    INSERT INTO LOCRO.AUTO (AUTO_NUMERO, AUTO_MODELO, AUTO_PILOTO, AUTO_ESCUDERIA)
	SELECT DISTINCT AUTO_NUMERO, AUTO_MODELO, p.PILOTO_ID, e.ESCUDERIA_ID
	FROM gd_esquema.Maestra m 
	JOIN LOCRO.PILOTO p ON m.PILOTO_NOMBRE = p.PILOTO_NOMBRE AND m.PILOTO_APELLIDO = p.PILOTO_APELLIDO
	JOIN LOCRO.ESCUDERIA e ON m.ESCUDERIA_NOMBRE = e.ESCUDERIA_NOMBRE
	WHERE m.AUTO_NUMERO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_circuito')
	DROP PROCEDURE migrar_circuito
GO

CREATE PROCEDURE migrar_circuito
 AS
  BEGIN
    INSERT INTO LOCRO.CIRCUITO (CIRCUITO_CODIGO, CIRCUITO_NOMBRE, CIRCUITO_PAIS)
	SELECT DISTINCT CIRCUITO_CODIGO, CIRCUITO_NOMBRE, CIRCUITO_PAIS
	FROM gd_esquema.Maestra
	WHERE CIRCUITO_CODIGO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_sector')
	DROP PROCEDURE migrar_sector
GO

CREATE PROCEDURE migrar_sector
 AS
  BEGIN
    INSERT INTO LOCRO.SECTOR (SECTOR_CODIGO, SECTOR_TIPO, SECTOR_DISTANCIA, SECTOR_CIRCUITO)
	SELECT DISTINCT CODIGO_SECTOR, SECTO_TIPO, SECTOR_DISTANCIA, CIRCUITO_CODIGO
	FROM gd_esquema.Maestra m
	WHERE CODIGO_SECTOR IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_carrera')
	DROP PROCEDURE migrar_carrera
GO

CREATE PROCEDURE migrar_carrera
 AS
  BEGIN
    INSERT INTO LOCRO.CARRERA (CARRERA_CODIGO, CARRERA_FECHA, CARRERA_CLIMA, CARRERA_TOTAL_CARRERA, CARRERA_CANT_VUELTAS, CARRERA_CIRCUITO)
	SELECT DISTINCT CODIGO_CARRERA, CARRERA_FECHA, CARRERA_CLIMA, CARRERA_TOTAL_CARRERA, CARRERA_CANT_VUELTAS, CIRCUITO_CODIGO
	FROM gd_esquema.Maestra
	WHERE CODIGO_CARRERA IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_bandera')
	DROP PROCEDURE migrar_bandera
GO

CREATE PROCEDURE migrar_bandera
 AS
  BEGIN
    INSERT INTO LOCRO.BANDERA (BANDERA_COLOR)
	SELECT DISTINCT INCIDENTE_BANDERA
	FROM gd_esquema.Maestra
	WHERE INCIDENTE_BANDERA IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_incidente_tipo')
	DROP PROCEDURE migrar_incidente_tipo
GO

CREATE PROCEDURE migrar_incidente_tipo
 AS
  BEGIN
    INSERT INTO LOCRO.TIPO_INCIDENTE(TIPO_INCIDENTE_DESCRIPCION)
	SELECT DISTINCT INCIDENTE_TIPO
	FROM gd_esquema.Maestra
	WHERE INCIDENTE_TIPO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_incidente')
	DROP PROCEDURE migrar_incidente
GO

CREATE PROCEDURE migrar_incidente
 AS
  BEGIN
    INSERT INTO LOCRO.INCIDENTE(INCIDENTE_BANDERA, INCIDENTE_SECTOR, INCIDENTE_TIPO, INCIDENTE_TIEMPO)
	SELECT DISTINCT b.BANDERA_ID, CODIGO_SECTOR, t.TIPO_INCIDENTE_ID, INCIDENTE_TIEMPO
	FROM gd_esquema.Maestra m
	JOIN LOCRO.BANDERA b ON b.BANDERA_COLOR = m.INCIDENTE_BANDERA
	JOIN LOCRO.TIPO_INCIDENTE t ON t.TIPO_INCIDENTE_DESCRIPCION = m.INCIDENTE_TIPO
	WHERE INCIDENTE_TIPO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_incidente')
	DROP PROCEDURE migrar_incidente
GO

CREATE PROCEDURE migrar_incidente
 AS
  BEGIN
    INSERT INTO LOCRO.INCIDENTE(INCIDENTE_BANDERA, INCIDENTE_SECTOR, INCIDENTE_TIPO, INCIDENTE_TIEMPO)
	SELECT DISTINCT b.BANDERA_ID, CODIGO_SECTOR, t.TIPO_INCIDENTE_ID, INCIDENTE_NUMERO_VUELTA
	FROM gd_esquema.Maestra m
	JOIN LOCRO.BANDERA b ON b.BANDERA_COLOR = m.INCIDENTE_BANDERA
	JOIN LOCRO.TIPO_INCIDENTE t ON t.TIPO_INCIDENTE_DESCRIPCION = m.INCIDENTE_TIPO
	WHERE INCIDENTE_TIPO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tele_auto')
	DROP PROCEDURE migrar_tele_auto
GO

CREATE PROCEDURE migrar_tele_auto
 AS
  BEGIN
    INSERT INTO LOCRO.TELE_AUTO(TELE_AUTO_CODIGO, TELE_AUTO_NRO_VUELTA, TELE_AUTO_DISTANCIA_VUELTA, TELE_AUTO_DISTANCIA_CARRERA, 
	TELE_AUTO_POSICION, TELE_AUTO_TIEMPO_VUELTA, TELE_AUTO_VELOCIDAD, TELE_AUTO_COMBUSTIBLE, TELE_AUTO_AUTO, TELE_AUTO_CARRERA, 
	TELE_AUTO_SECTOR)
	SELECT DISTINCT TELE_AUTO_CODIGO, TELE_AUTO_NUMERO_VUELTA, TELE_AUTO_DISTANCIA_VUELTA, TELE_AUTO_DISTANCIA_CARRERA,
	TELE_AUTO_POSICION, TELE_AUTO_TIEMPO_VUELTA, TELE_AUTO_VELOCIDAD, TELE_AUTO_COMBUSTIBLE, a.AUTO_ID, CODIGO_CARRERA, CODIGO_SECTOR
	FROM gd_esquema.Maestra m
	JOIN LOCRO.AUTO a ON a.AUTO_MODELO = m.AUTO_MODELO and a.AUTO_NUMERO = m.AUTO_NUMERO
	WHERE TELE_AUTO_CODIGO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_caja')
	DROP PROCEDURE migrar_caja
GO

CREATE PROCEDURE migrar_caja
 AS
  BEGIN
    INSERT INTO LOCRO.CAJA(CAJA_NRO_SERIE, CAJA_MODELO)
	SELECT DISTINCT TELE_CAJA_NRO_SERIE, TELE_CAJA_MODELO
	FROM gd_esquema.Maestra m
	WHERE TELE_CAJA_NRO_SERIE IS NOT NULL AND TELE_CAJA_MODELO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tele_caja')
	DROP PROCEDURE migrar_tele_caja
GO

CREATE PROCEDURE migrar_tele_caja
 AS
  BEGIN
    INSERT INTO LOCRO.TELE_CAJA (TELE_CAJA_CAJA, TELE_CAJA_TEMP_ACEITE, TEMP_CAJA_RPM, TELE_CAJA_DESGASTE, TELE_CAJA_TELE_AUTO)
	SELECT DISTINCT c.CAJA_ID, TELE_CAJA_TEMP_ACEITE, TELE_CAJA_RPM, TELE_CAJA_DESGASTE, TELE_AUTO_CODIGO
	FROM gd_esquema.Maestra m
	JOIN LOCRO.CAJA c ON c.CAJA_NRO_SERIE = m.TELE_CAJA_NRO_SERIE
	WHERE TELE_CAJA_NRO_SERIE IS NOT NULL AND TELE_CAJA_MODELO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_motor')
	DROP PROCEDURE migrar_motor
GO

CREATE PROCEDURE migrar_motor
 AS
  BEGIN
    INSERT INTO LOCRO.MOTOR (MOTOR_MODELO, MOTOR_NRO_SERIE)
	SELECT DISTINCT TELE_MOTOR_MODELO, TELE_MOTOR_NRO_SERIE
	FROM gd_esquema.Maestra m
	WHERE TELE_MOTOR_NRO_SERIE IS NOT NULL AND TELE_MOTOR_MODELO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tele_motor')
	DROP PROCEDURE migrar_tele_motor
GO

CREATE PROCEDURE migrar_tele_motor
 AS
  BEGIN
    INSERT INTO LOCRO.TELE_MOTOR(TELE_MOTOR_MOTOR, TELE_MOTOR_TEMP_ACEITE, TELE_MOTOR_RPM, TELE_MOTOR_POTENCIA, TELE_MOTOR_TEMP_AGUA, TELE_MOTOR_TELE_AUTO)
	SELECT DISTINCT mo.MOTOR_ID, TELE_MOTOR_TEMP_ACEITE, TELE_MOTOR_RPM, TELE_MOTOR_POTENCIA, TELE_MOTOR_TEMP_AGUA, TELE_AUTO_CODIGO
	FROM gd_esquema.Maestra m
	JOIN LOCRO.MOTOR mo ON mo.MOTOR_NRO_SERIE = m.TELE_MOTOR_NRO_SERIE
	WHERE TELE_MOTOR_NRO_SERIE IS NOT NULL AND TELE_MOTOR_MODELO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_freno')
	DROP PROCEDURE migrar_freno
GO

CREATE PROCEDURE migrar_freno
 AS
  BEGIN
    INSERT INTO LOCRO.FRENO (FRENO_NRO_SERIE, FRENO_TAMANIO_DISCO)
	SELECT DISTINCT TELE_FRENO1_NRO_SERIE, TELE_FRENO1_TAMANIO_DISCO
	FROM gd_esquema.Maestra m
	WHERE TELE_FRENO1_NRO_SERIE IS NOT NULL AND TELE_FRENO1_TAMANIO_DISCO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tele_freno')
	DROP PROCEDURE migrar_tele_freno
GO

CREATE PROCEDURE migrar_tele_freno
 AS
  BEGIN
    INSERT INTO LOCRO.TELE_FRENO (TELE_FRENO_FRENO, TELE_FRENO_GROSOR, TELE_FRENO_POSICION, TELE_FRENO_TEMPERATURA, TELE_FRENO_TELE_AUTO)
	SELECT DISTINCT f.FRENO_ID, TELE_FRENO1_GROSOR_PASTILLA, TELE_FRENO1_POSICION, TELE_FRENO1_TEMPERATURA, TELE_AUTO_CODIGO
	FROM gd_esquema.Maestra m
	JOIN LOCRO.FRENO f ON f.FRENO_NRO_SERIE = m.TELE_FRENO1_NRO_SERIE
	WHERE TELE_FRENO1_NRO_SERIE IS NOT NULL AND TELE_FRENO1_TAMANIO_DISCO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tipo_neumatico')
	DROP PROCEDURE migrar_tipo_neumatico
GO

CREATE PROCEDURE migrar_tipo_neumatico
 AS
  BEGIN
    INSERT INTO LOCRO.TIPO_NEUMATICO(TIPO_NEUMATICO_DESCRIPCION)
	SELECT DISTINCT NEUMATICO1_TIPO_NUEVO + NEUMATICO2_TIPO_NUEVO + NEUMATICO3_TIPO_NUEVO + NEUMATICO4_TIPO_NUEVO
				  + NEUMATICO1_TIPO_VIEJO + NEUMATICO2_TIPO_VIEJO + NEUMATICO3_TIPO_VIEJO + NEUMATICO4_TIPO_VIEJO
	FROM gd_esquema.Maestra m
	WHERE NEUMATICO1_TIPO_NUEVO IS NOT NULL -- AYUDA ¿Alguna forma de remover los nulls sin poner 1x1?
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_neumatico')
	DROP PROCEDURE migrar_neumatico
GO

CREATE PROCEDURE migrar_neumatico
 AS
  BEGIN
    INSERT INTO LOCRO.NEUMATICO (NEUMATICO_NRIO_SERIE, NEUMATICO_TIPO)
	SELECT DISTINCT NEUMATICO1_NRO_SERIE_NUEVO, tn.TIPO_NEUMATICO_ID
	FROM gd_esquema.Maestra m
	JOIN LOCRO.TIPO_NEUMATICO tn ON tn.TIPO_NEUMATICO_DESCRIPCION = NEUMATICO1_TIPO_NUEVO
	WHERE NEUMATICO1_NRO_SERIE_NUEVO IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tele_neumatico')
	DROP PROCEDURE migrar_tele_neumatico
GO

CREATE PROCEDURE migrar_tele_neumatico
 AS
  BEGIN
    INSERT INTO LOCRO.TELE_NEUMATICO(TELE_NEUMATICO_NEUMATICO, TELE_NEUMATICO_PRESION, TELE_NEUMATICO_POSICION, TELE_NEUMATICO_PROFUNDIDAD, TELE_NEUMATICO_TEMPERATURA, TELE_NEUMATICO_TELE_AUTO)
	SELECT DISTINCT n.NEUMATICO_ID, TELE_NEUMATICO1_PRESION, TELE_NEUMATICO1_POSICION, TELE_NEUMATICO1_PROFUNDIDAD, TELE_NEUMATICO1_TEMPERATURA, TELE_AUTO_CODIGO
	FROM gd_esquema.Maestra m
	JOIN LOCRO.NEUMATICO n ON n.NEUMATICO_NRIO_SERIE = m.NEUMATICO1_NRO_SERIE_NUEVO
	WHERE TELE_MOTOR_NRO_SERIE IS NOT NULL AND TELE_MOTOR_MODELO IS NOT NULL
  END
GO

-- Tablas Intermedias

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_incidente_auto')
	DROP PROCEDURE migrar_incidente_auto
GO

CREATE PROCEDURE migrar_incidente_auto
 AS
  BEGIN
    INSERT INTO LOCRO.INCIDENTE_AUTO(AUTO_ID, INCIDENTE_ID, NRO_DE_VUELTA)
	SELECT DISTINCT a.AUTO_ID, i.INCIDENTE_ID, INCIDENTE_NUMERO_VUELTA
	FROM gd_esquema.Maestra m
	JOIN LOCRO.AUTO a ON a.AUTO_MODELO = m.AUTO_MODELO and a.AUTO_MODELO = m.AUTO_MODELO -- ojo tal vez hay duplicados porque no joineamos por piloto y escuderia
	JOIN LOCRO.INCIDENTE i ON i.INCIDENTE_TIEMPO = m.INCIDENTE_TIEMPO -- ojo tal vez hay duplicados porque no joineamos por sector, bandera, tiempo, tipo
	WHERE M.INCIDENTE_TIEMPO IS NOT NULL AND M.INCIDENTE_NUMERO_VUELTA IS NOT NULL AND m.AUTO_NUMERO IS NOT NULL
  END
GO


IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_auto_x_carrera')
	DROP PROCEDURE migrar_auto_x_carrera
GO

CREATE PROCEDURE migrar_auto_x_carrera
 AS
  BEGIN
    INSERT INTO LOCRO.AUTO_CARRERA(AUTO_ID, CARRERA_CODIGO)
	SELECT DISTINCT a.AUTO_ID, CODIGO_CARRERA
	FROM gd_esquema.Maestra m
	JOIN LOCRO.AUTO a ON a.AUTO_MODELO = m.AUTO_MODELO and a.AUTO_MODELO = m.AUTO_MODELO -- ojo tal vez hay duplicados porque no joineamos por piloto y escuderia
	WHERE m.AUTO_NUMERO IS NOT NULL AND CODIGO_CARRERA IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_parada_box')
	DROP PROCEDURE migrar_parada_box
GO

CREATE PROCEDURE migrar_parada_box
 AS
  BEGIN
    INSERT INTO LOCRO.PARADA_BOX (PARADA_AUTO, PARADA_CARRERA, PARADA_VUELTA, PARADA_TIEMPO)
	SELECT DISTINCT a.AUTO_ID, CODIGO_CARRERA, PARADA_BOX_VUELTA, PARADA_BOX_TIEMPO
	FROM gd_esquema.Maestra m
	JOIN LOCRO.AUTO a ON a.AUTO_MODELO = m.AUTO_MODELO and a.AUTO_MODELO = m.AUTO_MODELO -- ojo tal vez hay duplicados porque no joineamos por piloto y escuderia
	WHERE m.AUTO_NUMERO IS NOT NULL AND PARADA_BOX_VUELTA IS NOT NULL
  END
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_cambio_neumatico')
	DROP PROCEDURE migrar_cambio_neumatico
GO

CREATE PROCEDURE migrar_cambio_neumatico
 AS
  BEGIN
    INSERT INTO LOCRO.CAMBIO_NEUMATICO (CAMBIO_NUEVO, CAMBIO_VIEJO, CAMBIO_POSICION, CAMBIO_PARADA)
	SELECT DISTINCT nn.NEUMATICO_ID, nv.NEUMATICO_ID, TELE_NEUMATICO1_POSICION, p.PARADA_ID
	FROM gd_esquema.Maestra m
	JOIN LOCRO.NEUMATICO nn ON nn.NEUMATICO_NRIO_SERIE = m.NEUMATICO1_NRO_SERIE_NUEVO -- FIXEAR CON LOS 30 MIL NUMEROS DE NEUMATICOS 1, 2 ,3 ,4
	JOIN LOCRO.NEUMATICO nv ON nv.NEUMATICO_NRIO_SERIE = m.NEUMATICO1_NRO_SERIE_VIEJO -- FIXEAR CON LOS 30 MIL NUMEROS DE NEUMATICOS 1, 2 ,3 ,4
	JOIN LOCRO.PARADA_BOX p ON p.PARADA_VUELTA = m.PARADA_BOX_VUELTA -- FIXEAR AGREGANDO TODOS LOS IDENTIFICADORES DE PARADA BOX ASI NO HAY DUPLICADOS
	WHERE m.AUTO_NUMERO IS NOT NULL AND PARADA_BOX_VUELTA IS NOT NULL
  END
GO

--EJECUCIÓN DE STORED PROCEDURES: MIGRACIÓN-----------------------------
BEGIN TRANSACTION
BEGIN TRY
	EXECUTE migrar_escuderia
	EXECUTE migrar_piloto
	EXECUTE migrar_auto
	EXECUTE migrar_circuito
	EXECUTE migrar_sector
	EXECUTE migrar_carrera
	EXECUTE migrar_bandera
	EXECUTE migrar_incidente_tipo
	EXECUTE migrar_incidente
	EXECUTE migrar_tele_auto
	EXECUTE migrar_caja
	EXECUTE migrar_tele_caja
	EXECUTE migrar_motor
	EXECUTE migrar_tele_motor
	EXECUTE migrar_freno
	EXECUTE migrar_tele_freno
	EXECUTE migrar_tipo_neumatico
	EXECUTE migrar_neumatico
	EXECUTE migrar_tele_neumatico
	EXECUTE migrar_incidente_auto
	EXECUTE migrar_auto_x_carrera
	EXECUTE migrar_parada_box
	EXECUTE migrar_cambio_neumatico
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
	THROW 50001, 'Error al migrar las tablas, verifique que las nuevas tablas se encuentren vacías o bien ejecute un DROP de todas las nuevas tablas y vuelva a intentarlo.',1;
END CATCH

IF (
EXISTS (SELECT 1 FROM LOCRO.ESCUDERIA)
AND EXISTS (SELECT 1 FROM LOCRO.PILOTO)
AND EXISTS (SELECT 1 FROM LOCRO.AUTO)
AND EXISTS (SELECT 1 FROM LOCRO.CIRCUITO)
AND EXISTS (SELECT 1 FROM LOCRO.SECTOR)
AND EXISTS (SELECT 1 FROM LOCRO.CARRERA)
AND EXISTS (SELECT 1 FROM LOCRO.BANDERA)
AND EXISTS (SELECT 1 FROM LOCRO.TIPO_INCIDENTE)
AND EXISTS (SELECT 1 FROM LOCRO.INCIDENTE)
AND EXISTS (SELECT 1 FROM LOCRO.TELE_AUTO)
AND EXISTS (SELECT 1 FROM LOCRO.CAJA)
AND EXISTS (SELECT 1 FROM LOCRO.TELE_CAJA)
AND EXISTS (SELECT 1 FROM LOCRO.MOTOR)
AND EXISTS (SELECT 1 FROM LOCRO.TELE_MOTOR)
AND EXISTS (SELECT 1 FROM LOCRO.FRENO)
AND EXISTS (SELECT 1 FROM LOCRO.TELE_FRENO)
AND EXISTS (SELECT 1 FROM LOCRO.TIPO_NEUMATICO)
AND EXISTS (SELECT 1 FROM LOCRO.NEUMATICO)
AND EXISTS (SELECT 1 FROM LOCRO.TELE_NEUMATICO)
AND EXISTS (SELECT 1 FROM LOCRO.INCIDENTE_AUTO)
AND EXISTS (SELECT 1 FROM LOCRO.AUTO_CARRERA)
AND EXISTS (SELECT 1 FROM LOCRO.PARADA_BOX)
AND EXISTS (SELECT 1 FROM LOCRO.CAMBIO_NEUMATICO)
)
	BEGIN
		PRINT 'Tablas migradas correctamente.';
		COMMIT TRANSACTION;
	END
ELSE
	BEGIN
		ROLLBACK TRANSACTION;
		THROW 50002, 'Hubo un error al migrar una o más tablas. Todos los cambios fueron deshechos, ninguna tabla fue cargada en la base.',1;
	END
   
GO

--CREACIÓN DE INDICES-----------------

--DROP TABLES
/*
DROP TABLE LOCRO.AUTO_CARRERA
DROP TABLE LOCRO.CAMBIO_NEUMATICO
DROP TABLE LOCRO.PARADA_BOX
DROP TABLE LOCRO.INCIDENTE_AUTO
DROP TABLE LOCRO.INCIDENTE
DROP TABLE LOCRO.BANDERA
DROP TABLE LOCRO.TIPO_INCIDENTE
DROP TABLE LOCRO.TELE_CAJA
DROP TABLE LOCRO.TELE_FRENO
DROP TABLE LOCRO.TELE_MOTOR
DROP TABLE LOCRO.TELE_NEUMATICO
DROP TABLE LOCRO.TELE_AUTO
DROP TABLE LOCRO.AUTO
DROP TABLE LOCRO.ESCUDERIA
DROP TABLE LOCRO.PILOTO
DROP TABLE LOCRO.NEUMATICO
DROP TABLE LOCRO.TIPO_NEUMATICO
DROP TABLE LOCRO.FRENO
DROP TABLE LOCRO.MOTOR
DROP TABLE LOCRO.CAJA
DROP TABLE LOCRO.SECTOR
DROP TABLE LOCRO.CARRERA
DROP TABLE LOCRO.CIRCUITO

DROP SCHEMA LOCRO
*/