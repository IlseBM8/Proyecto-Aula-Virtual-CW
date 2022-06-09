
/*Para sazonar*/
ALTER TABLE USUARIO ADD Sal VARCHAR(15);
/*Por favor, introduzcan este comando para cambiarle el 
intervalo de caracteres al atributo password*/
ALTER TABLE USUARIO MODIFY password CHAR(100);

/*Añadan estas tablas a la BD*/ 
CREATE TABLE CUESTIONARIO(
    ID_CUESTIONARIO SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    nombre_cuestionario CHAR(250),
    num_preguntas TINYINT, 
    terminado BOOLEAN    
);

CREATE TABLE RESP_CORRECTA(
    ID_RESP_CORRECTA SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    respuesta CHAR(250)
);

CREATE TABLE OPCION(
    ID_OPCION INT PRIMARY KEY AUTO_INCREMENT,
    opcion CHAR(250)
);

CREATE TABLE PROGRESO(
    ID_PROGRESO SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    progreso SMALLINT, 
    calificacion FLOAT
);

CREATE TABLE PREGUNTA(
    ID_PREGUNTA SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    pregunta CHAR(250), 
    duracion_pregunta TIME, 
    ID_RESP_CORRECTA SMALLINT, 
    FOREIGN KEY(ID_RESP_CORRECTA) REFERENCES RESP_CORRECTA(ID_RESP_CORRECTA),
    puntuacion TINYINT
);

CREATE TABLE QUESTION_CLASS(
    ID_QUESTION_CLASS SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    ID_USUARIO INT, 
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO), 
    ID_TIPO_USER INT, 
    FOREIGN KEY(ID_TIPO_USER) REFERENCES TIPO_USER(ID_TIPO_USER),
    ID_AULA CHAR(50), 
    FOREIGN KEY(ID_AULA) REFERENCES AULA(ID_AULA),
    ID_MATERIAS TINYINT, 
    FOREIGN KEY(ID_MATERIAS) REFERENCES MATERIAS(ID_MATERIAS), 
    ID_ASIGN INT, 
    FOREIGN KEY(ID_ASIGN) REFERENCES ASIGNACION(ID_ASIGN), 
    ID_CUESTIONARIO SMALLINT, 
    FOREIGN KEY(ID_CUESTIONARIO) REFERENCES CUESTIONARIO(ID_CUESTIONARIO),
    ID_PROGRESO SMALLINT, 
    FOREIGN KEY(ID_PROGRESO) REFERENCES PROGRESO(ID_PROGRESO)
);

CREATE TABLE CUESTIONARIO_HAS_PREGUNTA(
    ID_CHP SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    ID_CUESTIONARIO SMALLINT, 
    FOREIGN KEY(ID_CUESTIONARIO) REFERENCES CUESTIONARIO(ID_CUESTIONARIO),
    ID_PREGUNTA SMALLINT, 
    FOREIGN KEY(ID_PREGUNTA) REFERENCES PREGUNTA(ID_PREGUNTA)
);

CREATE TABLE CUESTIONARIO_HAS_PROGRESO(
    ID_CHPRG SMALLINT PRIMARY KEY AUTO_INCREMENT, 
    ID_CUESTIONARIO SMALLINT, 
    FOREIGN KEY(ID_CUESTIONARIO) REFERENCES CUESTIONARIO(ID_CUESTIONARIO),
    ID_PROGRESO SMALLINT, 
    FOREIGN KEY(ID_PROGRESO) REFERENCES PROGRESO(ID_PROGRESO)
);

-- CREATE TABLE CUESTIONARIO_HAS_OPCION(
--     ID_CHO SMALLINT PRIMARY KEY AUTO_INCREMENT, 
--     ID_CUESTIONARIO SMALLINT, 
--     FOREIGN KEY(ID_CUESTIONARIO) REFERENCES CUESTIONARIO(ID_CUESTIONARIO),
--     ID_OPCION INT, 
--     FOREIGN KEY(ID_OPCION) REFERENCES OPCION(ID_OPCION)
-- );

CREATE TABLE PREGUNTA_HAS_OPCION(
    ID_PHO INT PRIMARY KEY AUTO_INCREMENT, 
    ID_PREGUNTA SMALLINT, 
    FOREIGN KEY(ID_PREGUNTA) REFERENCES PREGUNTA(ID_PREGUNTA),
    ID_OPCION INT, 
    FOREIGN KEY(ID_OPCION) REFERENCES OPCION(ID_OPCION)
);

-- CREATE TABLE CUESTIONARIO_AND_PREGUNTA_HAS_OPCION(
--     ID_CANDPHO SMALLINT PRIMARY KEY AUTO_INCREMENT, 
--     ID_CUESTIONARIO SMALLINT, 
--     FOREIGN KEY(ID_CUESTIONARIO) REFERENCES CUESTIONARIO(ID_CUESTIONARIO),
--     ID_PREGUNTA SMALLINT, 
--     FOREIGN KEY(ID_PREGUNTA) REFERENCES PREGUNTA(ID_PREGUNTA),
--     ID_OPCION INT, 
--     FOREIGN KEY(ID_OPCION) REFERENCES OPCION(ID_OPCION)
-- );

