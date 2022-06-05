/*Creando la BD con la codificación correcta*/
CREATE DATABASE aula_cw CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
/*Ideas: 
cambiar los tipos de ID de INT a SMALLINT 
aplicar la restricción default*/

/*Creando la tabla ESTADO*/ 
/*Esta ya está lista*/
CREATE TABLE ESTADO(
    ID_ESTADO INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(25)    
);

/*Esta es la tabla GRADO*/
-- Le añadí un AUTO_INCREMENT 
CREATE TABLE GRADO(
    ID_GRADO TINYINT PRIMARY KEY AUTO_INCREMENT,
    grado VARCHAR(6) UNIQUE
);

/*Esta es la tabla CICLOS*/
/*En duda*/
CREATE TABLE CICLOS(
    ID_CICLOS SMALLINT PRIMARY KEY AUTO_INCREMENT,
    ciclos CHAR(20) 
);

/*Esta es la tabla PRIVACIDAD*/
-- Le añadí un AUTO_INCREMENT
CREATE TABLE PRIVACIDAD(
    ID_PRIV TINYINT PRIMARY KEY AUTO_INCREMENT, 
    privacidad CHAR(25)
); 

/*Esta es la tabla Tipo_mat (tipo de materia)*/
/*Esta también se debe añadir al archivo de draw.io*/
CREATE TABLE TIPO_MAT(
    ID_TIPO_MAT TINYINT PRIMARY KEY, 
    area CHAR(80), 
);

/*Esta es la tabla MATERIAS*/
CREATE TABLE MATERIAS(
    ID_MATERIAS TINYINT PRIMARY KEY, 
    materias CHAR(50), 
    ID_GRADO TINYINT, 
    FOREIGN KEY(ID_GRADO) REFERENCES GRADO(ID_GRADO),
    ID_TIPO_MAT TINYINT, 
    FOREIGN KEY(ID_TIPO_MAT) REFERENCES TIPO_MAT(ID_TIPO_MAT) 
); 

/*Esta es la tabla ROL_USER*/
-- Le añadí un AUTO_INCREMENT
CREATE TABLE ROL_USER(
    ID_ROL TINYINT PRIMARY KEY AUTO_INCREMENT,
    rol CHAR(50) 
);

/*Esta es la tabla GRUPO*/
CREATE TABLE GRUPO(
    ID_GRUPO SMALLINT PRIMARY KEY, 
    grupo SMALLINT UNIQUE
);

/*Esta es la tabla TIPO_ASIGN*/
-- Le añadí un AUTO_INCREMENT
CREATE TABLE TIPO_ASIGN(
    ID_TIPO_ASIGN TINYINT PRIMARY KEY, 
    tipo_asign VARCHAR(10)
);

/*Esta es la tabla ESTADO_ENTREGA*/
CREATE TABLE ESTADO_ENTREGA(
    ID_ESTADO_ENTREGA TINYINT PRIMARY KEY AUTO_INCREMENT, 
    estado CHAR(50) 
);

/*Esta es la tabla TIPO_USER*/
CREATE TABLE TIPO_USER(
    ID_TIPO_USER INT PRIMARY KEY, 
    estado VARCHAR(25)
);


/*Esta es la tabla TIPO_AULA*/
/*Esta tiene una FK*/
CREATE TABLE TIPO_AULA(
    ID_TIPO_AULA TINYINT PRIMARY KEY, 
    tipo CHAR(50),
    ID_PRIV TINYINT,
    FOREIGN KEY(ID_PRIV) REFERENCES PRIVACIDAD(ID_PRIV),
    
);

/*Esta es la tabla AULA*/
/*Tiene FKs */
CREATE TABLE AULA(
    ID_AULA CHAR(50), /*El ID será una cadena aleatoria*/
    ID_MATERIAS TINYINT,
    FOREIGN KEY(ID_MATERIAS) REFERENCES MATERIAS(ID_MATERIAS),
    ID_GRUPO SMALLINT,
    FOREIGN KEY(ID_GRUPO) REFERENCES GRUPO(ID_GRUPO),
    ID_CICLOS SMALLINT /*AUTO_INCREMENT*/, 
    FOREIGN KEY(ID_CICLOS) REFERENCES CICLOS(ID_CICLOS),
    ID_GRADO TINYINT, 
    FOREIGN KEY(ID_GRADO) REFERENCES GRADO(ID_GRADO), 
    ID_TIPO_AULA TINYINT,
    FOREIGN KEY(ID_TIPO_AULA) REFERENCES TIPO_AULA(ID_TIPO_AULA)
    nombre CHAR(50),
    reuniones_id CHAR(250),
    descripcion CHAR(250), 
    ruta foto CHAR(50),
    seccion VARCHAR(1)   
);

/*Esta es la tabla USUARIO*/
/*Tiene FKs*/
CREATE TABLE USUARIO(
    ID_USUARIO INT PRIMARY KEY, 
    nombre CHAR(50),
    apodo CHAR(50) UNIQUE, 
    apellido_paterno CHAR(50),
    apellido_materno CHAR(50), 
    num_identificador INT UNIQUE, 
    correo CHAR(80) UNIQUE, 
    ruta_foto CHAR(50), 
    ID_ESTADO INT /*Auto increment*/,
    FOREIGN KEY(ID_ESTADO) REFERENCES ESTADO(ID_ESTADO),
    estado_unico CHAR(50),
    teléfono INT
    ID_TIPO_USER INT, 
    FOREIGN KEY(ID_TIPO_USER) REFERENCES TIPO_USER(ID_TIPO_USER),
    ID_GRADO TINYINT, 
    FOREIGN KEY(ID_GRADO) REFERENCES GRADO(ID_GRADO),
);

/*Esta es la tabla Aula has Usuario*/
/*Tiene FKs */
CREATE TABLE AULA_HAS_USUARIO(
    ID_AHU INT PRIMARY KEY AUTO_INCREMENT,
    ID_USUARIO INT, 
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    ID_AULA CHAR(50),
    FOREIGN KEY(ID_AULA) REFERENCES AULA(ID_AULA),
    ID_ROL TINYINT, 
    FOREIGN KEY(ID_ROL) REFERENCES ROL_USER(ID_ROL)
    
);

/*Esta es la tabla Usuario has Intereses*/
/*Tiene FKs*/
CREATE TABLE USUARIO_HAS_INTERESES(
    ID_UHINTERESES INT PRIMARY KEY AUTO_INCREMENT, 
    ID_MATERIAS TINYINT, 
    FOREIGN KEY(ID_MATERIAS) REFERENCES MATERIAS(ID_MATERIAS), 
    ID_USUARIO INT, 
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO) 
);

/*Esta es la tabla Usuario has Insignias*/
/*Tiene FKs*/
CREATE TABLE USUARIO_HAS_INSIGNIAS(
    ID_UHINSIGN INT PRIMARY KEY AUTO_INCREMENT, 
    ID_MATERIAS TINYINT, 
    FOREIGN KEY(ID_MATERIAS) REFERENCES MATERIAS(ID_MATERIAS), 
    ID_USUARIO INT, 
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO), 
    ID_AULA CHAR(50), 
    FOREIGN KEY(ID_AULA) REFERENCES AULA(ID_AULA), 
    nombre_insignia CHAR(50) 
);





-- Estas son las tablas que debes añadir al archivo de draw.io
CREATE TABLE BLOQUE(
    ID_BLOQUE TINYINT PRIMARY KEY, 
    ruta_foto CHAR(255), 
    titulo CHAR(200) UNIQUE NOT NULL,
    descripcion MEDIUMTEXT,  
    ID_AULA CHAR(50),
    FOREIGN KEY(ID_AULA) REFERENCES AULA(ID_AULA),
);


CREATE TABLE TEMA(
    ID_TEMA TINYINT PRIMARY KEY AUTO_INCREMENT, 
    titulo CHAR(100) UNIQUE, 
    descripcion MEDIUMTEXT, 
    ID_BLOQUE TINYINT, 
    FOREIGN KEY(ID_BLOQUE) REFERENCES BLOQUE(ID_BLOQUE) 
);

CREATE TABLE ASIGNACION(
    ID_ASIGN INT PRIMARY KEY AUTO_INCREMENT, 
    titulo CHAR(100), 
    indicaciones CHAR(255),
    ID_USUARIO INT, 
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    puntos INT, 
    fecha_asignacion DATETIME NOT NULL, 
    fecha_limite DATETIME NOT NULL, 
    ID_BLOQUE TINYINT, 
    FOREIGN KEY(ID_BLOQUE) REFERENCES BLOQUE(ID_BLOQUE), 
    ID_TEMA TINYINT, 
    FOREIGN KEY(ID_TEMA) REFERENCES TEMA(ID_TEMA), 
    rubrica MEDIUMTEXT 
    ID_AULA CHAR(50),
    FOREIGN KEY(ID_AULA) REFERENCES AULA(ID_AULA),
    ID_TIPO_ASIGN TINYINT, 
    FOREIGN KEY(ID_TIPO_ASIGN) REFERENCES TIPO_ASIGN(ID_TIPO_ASIGN), 
);

CREATE TABLE USER_HAS_ASIGNACION(
    ID_UHA INT PRIMARY KEY AUTO_INCREMENT, 
    ID_USUARIO INT, 
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO), 
    ID_ASIGN INT, 
    FOREIGN KEY(ID_ASIGN) REFERENCES ASIGNACION(ID_ASIGN), 
    ID_ESTADO_ENTREGA TINYINT, 
    FOREIGN KEY(ID_ESTADO_ENTREGA) REFERENCES ESTADO_ENTREGA(ID_ESTADO_ENTREGA)
    fecha_entrega DATETIME NOT NULL, 
    calificacion TINYINT, 
    texto_tarea CHAR(200)
);

CREATE TABLE ARCH_ENTREGA(
    ID_ARCH_ENTREGA PRIMARY KEY AUTO_INCREMENT, 
    nombre CHAR(250), 
    ruta_archivo CHAR(250), 
    tipo_extension CHAR(250), 
    ID_UHA INT, 
    FOREIGN KEY(ID_UHA) REFERENCES USER_HAS_ASIGNACION(ID_UHA)
);

CREATE TABLE LINKS_ASIGNACION(
    ID_LINKASIGN INT PRIMARY KEY AUTO_INCREMENT, 
    link CHAR(250), 
    ID_AULA CHAR(50), 
    FOREIGN KEY(ID_AULA) REFERENCES AULA(ID_AULA)
);

CREATE TABLE ARCH_ADJ_ASIGN(
    ID_ARCH_ADJ_ASIGN INT PRIMARY KEY AUTO_INCREMENT, 
    nombre CHAR(100), 
    ruta_arch CHAR(250), 
    tipo_arch CHAR(50), 
    ID_ASIGN INT, 
    FOREIGN KEY(ID_ASIGN) REFERENCES ASIGNACION(ID_ASIGN)
); 


CREATE TABLE COMENT_PRIV_ASIGN(
    ID_COMENT_PRIV_ASIGN INT PRIMARY KEY AUTO_INCREMENT, 
    ID_USUARIO INT, 
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO), 
    ID_UHA INT, 
    FOREIGN KEY(ID_UHA) REFERENCES USER_HAS_ASIGNACION(ID_UHA),
    comentario TEXT, 
    fecha_coment DATETIME NOT NULL 
);

CREATE TABLE COMENT_ASIGN(
    ID_COMENT_ASIGN INT PRIMARY KEY AUTO_INCREMENT, 
    ID_USUARIO INT, 
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    ID_ASIGN INT, 
    FOREIGN KEY(ID_ASIGN) REFERENCES ASIGNACION(ID_ASIGN),
    comentario TEXT, 
    fecha_coment DATETIME NOT NULL
);

CREATE TABLE TIPO_JUEGO(
    ID_TIPO_JUEGO SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    juego CHAR(75), 
    descripcion TEXT
);

CREATE TABLE JUEGO(
    ID_JUEGO SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    ID_TIPO_JUEGO SMALLINT, 
    FOREIGN KEY(ID_TIPO_JUEGO) REFERENCES TIPO_JUEGO(ID_TIPO_JUEGO), 
    ID_TEMA TINYINT, 
    FOREIGN KEY(ID_TEMA) REFERENCES TEMA(ID_TEMA),
    ID_AULA CHAR(50), 
    FOREIGN KEY(ID_AULA) REFERENCES AULA(ID_AULA),
    ID_BLOQUE TINYINT, 
    FOREIGN KEY(ID_BLOQUE) REFERENCES BLOQUE(ID_BLOQUE)
    nombre CHAR(50), 
    descripcion TEXT, 
    fecha_asignacion DATETIME,
    fecha_entrega DATETIME, 
    puntos INT 
);

CREATE TABLE USER_HAS_JUEGO(
    ID_UHJ INT PRIMARY KEY AUTO_INCREMENT, 
    ID_JUEGO SMALLINT, 
    FOREIGN KEY(ID_JUEGO) REFERENCES JUEGO(ID_JUEGO), 
    ID_USUARIO INT, 
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO), 
    puntos_obt INT,
    posicion SMALLINT, 
    fecha_juego DATETIME 
);

-- CREATE TABLE ARCH_ADJ_CAMMAT(
--     ID_ARCH_ADJ_CAMMAT 
-- );


