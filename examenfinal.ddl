-- Generado por Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   en:        2020-07-18 22:47:38 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

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



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
