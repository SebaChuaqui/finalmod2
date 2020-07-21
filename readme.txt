1. <b>Modelo Logico y Relacional<b>

Se realiza modelo logico y relacional en sql data modeller y
sea adjunta imagenes de estos y archivo con extension dmd.

2. Creacion de DDL

Se genera DDL con la creacion de las siguientes tablas:

CREATE TABLE alternativas (
    id_pre            VARCHAR2(10) NOT NULL,
    r1                VARCHAR2(100),
    r2                VARCHAR2(100),
    r3                VARCHAR2(100),
    r4                VARCHAR2(100),
    res               CHAR(1),
    pts_1             INTEGER,
    pts_2             INTEGER,
    pts_3             INTEGER,
    pts_4             INTEGER,
    preguntas_id_pre  VARCHAR2(10) NOT NULL
);

ALTER TABLE alternativas ADD CONSTRAINT alternativas_pk PRIMARY KEY ( id_pre );

CREATE TABLE alumnos (
    id_alum        VARCHAR2(10) NOT NULL,
    nombre         VARCHAR2(30),
    apellidos      VARCHAR2(50),
    rut            VARCHAR2(12),
    direccion      VARCHAR2(100),
    comuna         VARCHAR2(30),
    curso_id_prog  VARCHAR2(10) NOT NULL
);

ALTER TABLE alumnos ADD CONSTRAINT alumnos_pk PRIMARY KEY ( id_alum );

CREATE TABLE curso (
    id_prog   VARCHAR2(10) NOT NULL,
    programa  VARCHAR2(50)
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id_prog );

CREATE TABLE preguntas (
    id_pre        VARCHAR2(10) NOT NULL,
    texto         VARCHAR2(150),
    puntaje       INTEGER,
    test_id_test  VARCHAR2(10) NOT NULL
);

ALTER TABLE preguntas ADD CONSTRAINT preguntas_pk PRIMARY KEY ( id_pre );

CREATE TABLE relation_1 (
    alumnos_id_alum     VARCHAR2(10) NOT NULL,
    respuestas_id_resp  VARCHAR2(10) NOT NULL
);

ALTER TABLE relation_1 ADD CONSTRAINT relation_1_pk PRIMARY KEY ( alumnos_id_alum,
                                                                  respuestas_id_resp );

CREATE TABLE relation_5 (
    respuestas_id_resp   VARCHAR2(10) NOT NULL,
    alternativas_id_pre  VARCHAR2(10) NOT NULL
);

ALTER TABLE relation_5 ADD CONSTRAINT relation_5_pk PRIMARY KEY ( respuestas_id_resp,
                                                                  alternativas_id_pre );

CREATE TABLE respuestas (
    id_resp  VARCHAR2(10) NOT NULL,
    id_alum  VARCHAR2(10),
    id_test  VARCHAR2(10),
    resp     VARCHAR2(20),
    puntaje  INTEGER
);

ALTER TABLE respuestas ADD CONSTRAINT respuestas_pk PRIMARY KEY ( id_resp );

CREATE TABLE test (
    id_test        VARCHAR2(10) NOT NULL,
    nombre         VARCHAR2(50),
    descripcion    VARCHAR2(100),
    programa       VARCHAR2(50),
    unidad         VARCHAR2(50),
    autor          VARCHAR2(50),
    fec_creac      DATE,
    curso_id_prog  VARCHAR2(10) NOT NULL
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( id_test );

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_preguntas_fk FOREIGN KEY ( preguntas_id_pre )
        REFERENCES preguntas ( id_pre );

ALTER TABLE alumnos
    ADD CONSTRAINT alumnos_curso_fk FOREIGN KEY ( curso_id_prog )
        REFERENCES curso ( id_prog );

ALTER TABLE preguntas
    ADD CONSTRAINT preguntas_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );

ALTER TABLE relation_1
    ADD CONSTRAINT relation_1_alumnos_fk FOREIGN KEY ( alumnos_id_alum )
        REFERENCES alumnos ( id_alum );

ALTER TABLE relation_1
    ADD CONSTRAINT relation_1_respuestas_fk FOREIGN KEY ( respuestas_id_resp )
        REFERENCES respuestas ( id_resp );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_alternativas_fk FOREIGN KEY ( alternativas_id_pre )
        REFERENCES alternativas ( id_pre );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_respuestas_fk FOREIGN KEY ( respuestas_id_resp )
        REFERENCES respuestas ( id_resp );

ALTER TABLE test
    ADD CONSTRAINT test_curso_fk FOREIGN KEY ( curso_id_prog )
        REFERENCES curso ( id_prog );

3. Insercion de Datos

A continuacion se le ingresaron datos a cada una de las tablas:

TABLA ALTERNATIVAS

Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT001','Cuando','Para','Durante','No deseo responder','Y','-25','100','-25','0','P01');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT002','When','For','Where','No deseo responder','N','-25','-25','100','0','P02');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT003','Scrib Mod Quick','Modeler Oracle Top','SQL Data Modeler','No deseo responder','Y','-25','-25','100','0','P03');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT004','Gymmy Hendrix','Jimmy Muñoz','Jummy Neutrón','No deseo responder','Y','-25','100','-25','0','P04');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT005','Un elemento de planchar','Para construir','Un conjunto de datos','No deseo responder','N','-25','100','-25','0','P05');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT006','Lleno de margaritas','Un apellido','Un dato particular','No deseo responder','Y','-25','-25','100','0','P06');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT007','Un ticket','Una sentencia','Confirmar un dato','No deseo responder','N','-25','-25','100','0','P07');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT008','Para agrupar un objeto','Para resaltar','Para corchetear','No deseo responder','Y','100','-25','-25','0','P08');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT009','Un número','Un entero','Una persona íntegra','No deseo responder','Y','50','50','-25','0','P09');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT010','20','De 1 a 20','todos los que desee','No deseo responder','Y','50','50','-25','0','P10');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT011','Un habitante de Bool','Una regla de Verdadero-Falso','Entrega valor Falso','No deseo responder','N','-25','100','-25','0','P11');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT012','Solo por expertos','No','Depende del Ministerio de Salud','No deseo responder','Y','-25','100','-25','0','P12');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT013','Una hija de pruebas','Una hoja de datos','Un lienzo','No deseo responder','Y','-25','100','-25','0','P13');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT014','Español','Alemán','Inglés','No deseo responder','Y','-25','-25','100','0','P14');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT015','Un libro muy gordo','Un pendrive','Un almacenamiento lógico de datos','No deseo responder','Y','-25','-25','100','0','P15');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT016','Una moto japonesa','Un lenguaje propio','Una estrella','No deseo responder','Y','-25','100','-25','0','P16');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT017','Departamento De MedioAmbiente','Un modelo de datos','Un distrito de México','No deseo responder','N','-25','100','-25','0','P17');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT018','Una extensión de datos','Una abreviatura de "dedal"','Dormir De Lado','No deseo responder','Y','100','-25','-25','0','P18');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT019','Ingresa datos','abre una sentencia de gestión de oportunidades','Ejecuta un dato','No deseo responder','Y','50','-25','50','0','P19');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT020','Pidiento hora al doctor','Con la mano','Con un SELECT','No deseo responder','Y','-25','-25','100','0','P20');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT021','Si','Solo si le precede un INNER JOIN','Es una de las opcones distintas a "public"','No deseo responder','Y','50','-25','50','0','P21');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT022','6','No tiene límite','1024','No deseo responder','Y','-25','100','-25','0','P22');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT023','Una cerveza con descuento','"Error"','Una cerveza helada','No deseo responder','Y','-25','100','-25','0','P23');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT024','Un código oculto','Un código morse','No genera nada','No deseo responder','Y','-25','-25','100','0','P24');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT025','La mitad de un RE-LOJ','Un logo','Un mensaje','No deseo responder','Y','-25','-25','100','0','P25');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT026','Congelar a Harrison Ford','Codificar en Smulianno','Es un nuevo lenguaje de programación','No deseo responder','Y','50','50','-25','0','P26');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT027','INNER JOIN SELECT','Los miércoles en el late','En Apresto','No deseo responder','N','-25','50','50','0','P27');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT028','Cuando','A veces','Mientras','No deseo responder','Y','-25','-25','100','0','P28');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT029','039','Fullstack Java Master Power Rangers','Música','No deseo responder','N','100','-25','-25','0','P29');
Insert into EXFINAL.ALTERNATIVAS (ID_PRE,R1,R2,R3,R4,RES,PTS_1,PTS_2,PTS_3,PTS_4,PREGUNTAS_ID_PRE) values ('AT030','De noche','De día','Nunca','No deseo responder','N','50','50','-25','0','P30');

TABLA ALUMNOS

Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A1','Sebastián','Chuaqui','12345678-9','Comendadores 6765','Valdivia','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A2','Juan','Molina','12365478-8','Alerces 9838','Concepción','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A3','Pedro','Pérez','19575678-7','Alamos 654','Santiago','Fullstack');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A4','Antonio','Santander','95845678-6','Robles 465','Villarica','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A5','Luis','Llanos','12346495-5','Alisos 243','La Serena','Fullstack');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A6','Fernando','Salas','12819478-4','Eucaliptos 9384','Iquique','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A7','Rocío','Llaque','12340467-3','Cóndores 987','Arica','Fullstack');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A8','Ana','Regulez','12340033-5','Alemanes 765','Coquimbo','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A9','Laura','Donada','12772278-2','Españoles 65','Osorno','Fullstack');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A10','Susana','Morán','19456778-1','Araucanos 456','Puerto Natales','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A11','Marcelo','Llanos','15418159-8','Eucaliptos 9381','Concepción','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A12','Juan','Salas','24036549-9','Cóndores 985','Santiago','Fullstack');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A13','Pedro','Llaque','17997956-k','Alemanes 900','Santiago','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A14','Lucas','Regulez','7356432-8','Españoles 656','Valdivia','Fullstack');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A15','Mario','Molina','18812852-1','Araucanos 234','Concepción','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A16','Marta','Pérez','6299454-1','Alerces 9888','Santiago','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A17','Luis','Santander','16876342-5','Alamos 6541','Villarica','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A18','Francisca','Llanos','11116251-4','Robles 4651','La Serena','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A19','Gonzalo','Alvarez','22243066-6','Aliana 2432','Iquique','Android');
Insert into EXFINAL.ALUMNOS (ID_ALUM,NOMBRE,APELLIDOS,RUT,DIRECCION,COMUNA,CURSO_ID_PROG) values ('A20','Marcos','Mena','15205505-6','Españoles 561','La Serena','Fullstack')

TABLA CURSO

Insert into EXFINAL.CURSO (ID_PROG,PROGRAMA) values ('Android','Android');
Insert into EXFINAL.CURSO (ID_PROG,PROGRAMA) values ('Fullstack','Java');
Insert into EXFINAL.CURSO (ID_PROG,PROGRAMA) values ('BD','Access');

TABLA PREGUNTAS

Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P01','¿Cuál es la sentencia para crear un ciclo FOR en PSEINT?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P02','¿Cuál sentencia se aplica en Java para colocar una condición?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P03','¿Cómo se llama el programa para modelar datos?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P04','¿Cómo se llama el profe que nos aprueba el examen?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P05','¿Qué es una tabla?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P06','¿Qué es un campo?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P07','¿Qué es una validación?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P08','¿Para que sirve el "{" y "}" en Java?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P09','¿Qué es un "Integer"?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P10','¿Cuántos valores puedes ingresar en un VARCHAR(20)?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P11','¿Qué es un "Boolean"?','100','T02');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P12','¿Se puede programar una cuarentena con conflicto social?','100','T01');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P13','¿Qué es un "Script"?','100','T02');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P14','¿En qué idioma opera SQL Developer?','100','T02');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P15','¿Qué es un dicionario de datos?','100','T02');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P16','¿Qué es un XML?','100','T02');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P17','¿Qué es un DDM?','100','T02');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P18','¿Qué es un DDL?','100','T02');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P19','¿Qué hace "INSERT INTO" en SQL Developer?','100','T02');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P20','¿Cómo se escribe una consulta?','100','T02');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P21','¿Se puede crear un objeto "private" en Java?','100','T03');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P22','¿Cuantas tablas se puede crear en un programa?','100','T03');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P23','¿La sentencia "Create Beer Into Select" entrega...?','100','T03');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P24','¿La sentencia R2D2 genera...?','100','T03');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P25','¿Qué es un LOG?','100','T03');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P26','¿Java de Hutt sirve para...?','100','T03');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P27','¿Awakelab despierta tu mente?','100','T03');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P28','¿En PSEINT "While" equivale a...?','100','T03');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P29','¿El mejor curso de Awakelab es...?','100','T03');
Insert into EXFINAL.PREGUNTAS (ID_PRE,TEXTO,PUNTAJE,TEST_ID_TEST) values ('P30','¿SQL Developer Data Modeler da problemas a Juan Molina...?','100','T03');

TABLA RESPUESTAS

Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA11','A1','T01','R2','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA12','A1','T01','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA13','A1','T01','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA14','A1','T01','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA15','A1','T01','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA16','A1','T01','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA17','A1','T01','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA18','A1','T01','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA19','A1','T01','R4','0');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA110','A1','T01','R4','0');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA21','A2','T01','R4','0');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA22','A2','T01','R2','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA23','A2','T01','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA24','A2','T01','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA25','A2','T01','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA26','A2','T01','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA27','A2','T01','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA28','A2','T01','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA29','A2','T01','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA210','A2','T01','R4','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA31','A3','T02','R2','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA32','A3','T02','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA33','A3','T02','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA34','A3','T02','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA35','A3','T02','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA36','A3','T02','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA37','A3','T02','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA38','A3','T02','R3','50');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA39','A3','T02','R4','0');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA310','A3','T02','R4','0');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA41','A4','T02','R4','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA42','A4','T02','R2','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA43','A4','T02','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA44','A4','T02','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA45','A4','T02','R3','50');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA46','A4','T02','R3','100');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA47','A4','T02','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA48','A4','T02','R3','-25');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA49','A4','T02','R3','0');
Insert into EXFINAL.RESPUESTAS (ID_RESP,ID_ALUM,ID_TEST,RESP,PUNTAJE) values ('RESA410','A4','T02','R4','0');

TABLA TEST

Insert into EXFINAL.TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FEC_CREAC,CURSO_ID_PROG) values ('T01','Test 01','Test difícil','Android','Mod01','SCHUAQUI',to_date('17/07/20','DD/MM/RR'),'Android');
Insert into EXFINAL.TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FEC_CREAC,CURSO_ID_PROG) values ('T02','Test 02','Test coplejo','Java','Mod01','SCHUAQUI',to_date('17/06/20','DD/MM/RR'),'Fullstack');
Insert into EXFINAL.TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FEC_CREAC,CURSO_ID_PROG) values ('T03','Test 03','Test fácil','Android','Mod01','SCHUAQUI',to_date('17/05/20','DD/MM/RR'),'Android');
Insert into EXFINAL.TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FEC_CREAC,CURSO_ID_PROG) values ('T04','Test 04','Test intermedio','Java','Mod01','SCHUAQUI',to_date('17/04/20','DD/MM/RR'),'Fullstack');
Insert into EXFINAL.TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FEC_CREAC,CURSO_ID_PROG) values ('T05','Test 05','Test chanta','Android','Mod01','SCHUAQUI',to_date('17/03/20','DD/MM/RR'),'Android');
Insert into EXFINAL.TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FEC_CREAC,CURSO_ID_PROG) values ('T06','Test 06','Test experto','Java','Mod01','SCHUAQUI',to_date('17/02/20','DD/MM/RR'),'Fullstack');
Insert into EXFINAL.TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FEC_CREAC,CURSO_ID_PROG) values ('T07','Test 07','Test nivel dios','Android','Mod01','SCHUAQUI',to_date('17/01/20','DD/MM/RR'),'Android');

4. Se realizan las consultas requeridas de la evaluacion:

-- Pregunta 1: Conocer el número de evaluaciones por curso

select curso_id_prog, Count(*) As Cantidad from test
group by curso_id_prog;

-- Pregunta 2: Conocer los cursos sin evaluaciones.

select distinct curso.programa from curso
full join test on curso.id_prog=test.curso_id_prog where test.curso_id_prog is null;

Pregunta 3: Determinar las evaluaciones con deficiencia. Una evaluación es deficiente:
a. Si no tiene preguntas.
b. Si hay preguntas con 2 ó menos alternativas
c. Si todas las alternativas son correctas o si todas las alternativas son incorrectas.

select test.nombre, count(test.nombre) from test 
full join preguntas on test.id_test=preguntas.test_id_test 
full join alternativas on preguntas.id_pre=alternativas.preguntas_id_pre
group by test.nombre having count(preguntas.id_pre)<=0 or count(alternativas.id_pre)<=0;

-- Pregunta 4: Determinar cuántos alumnos hay en cada curso.

SELECT curso.id_prog, count(id_alum) FROM alumnos, curso
WHERE alumnos.curso_id_prog=curso.id_prog
GROUP BY curso.id_prog;

-- Pregunta 5: Obtener el puntaje no normalizado de cada evaluación. El puntaje no normalizado ha sido definido (requerimiento) 
como: P = buenas – malas/4. Si un alumno no contesta en una pregunta exactamente lo mismo que se ha definido como correcto, 
la pregunta cuenta como mala a menos que el alumno haya omitido.

SELECT sum(respuestas.puntaje)
FROM respuestas
GROUP BY respuestas.id_test;

-- Pregunta 6: Obtener el puntaje normalizado, o sea, de 1,0 a 7,0.

SELECT sum(respuestas.puntaje*4/1000) AS Nota
FROM respuestas;

-- Pregunta 7: Nombre de estudiantes de un curso determinado que aprueban una evaluación determinada (donde la nota de aprobación mínima es un 4,0).

select alumnos.nombre from alumnos where(select sum(respuestas.puntaje*7/100)
from alumnos, curso, test, respuestas
where alumnos.curso_id_prog=curso.id_prog and 
curso.id_prog=test.curso_id_prog and
test.id_test=respuestas.id_test) >=4;

-- Pregunta 8: Nota promedio de los estudiantes de un curso determinado, para una evaluación de terminada.

SELECT AVG(respuestas.puntaje*7/100) AS NOTA
FROM alumnos, curso, test, respuestas
WHERE alumnos.curso_id_prog=curso.id_prog
AND curso.id_prog=test.curso_id_prog
AND test.id_test=respuestas.id_test;






