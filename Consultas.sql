CREATE TABLE USUARIO (
    ID PRIMARY KEY,
    NOMBRE Y APELLIDOS VARCHAR(100),
    USERNAME VARCHAR(50),
    CORREO VARCHAR(200),
    CLAVE CIFRADA VARCHAR(50),
)

CREATE TABLE PROFE (
    ID_PROFE PRIMARY KEY,
    NOMBRE Y APELLIDOS VARCHAR(100),
    USERNAME VARCHAR(100),
    CORREO VARCHAR(500),
    CLAVE_CIFRADA VARCHAR(50),
)

CREATE TABLE CURSOS (
    ID_CURSOS PRIMARY KEY VARCHAR(100),
    ID-PROFE INT,  
    FOREIGN KEY (ID-PROFE) REFERENCES PROFE (ID_PROFE),
    NOMBRE VARCHAR(100),
)

CREATE TABLE EVALUA (
    ID_ALUMNO INT,
    FOREING KEY (ID_ALUMNO) REFERENCES EVALUA (ID_ALUMNO),
    ID-ALUMNO INT,
    FOREING KEY (ID-ALUMNO) REFERENCES EVALUA (ID-ALUMNO),
    EVALUADOR INT,
    FOREING KEY (EVALUADOR) REFERENCES EVALUA (EVALUADOR),
    EVALUADO INT,
    FOREING KEY (EVALUADO) REFERENCES EVALUA (EVALUADO),
    PUNTOS INT,
    FOREING KEY (PUNTOS) REFERENCES EVALUA (PUNTOS),
    SOFTSKILLS INT,
    FOREING KEY (SOFTSKILLS) REFERENCES EVALUA (SOFTSKILLS),
)

CREATE TABLE ALUMNO_CURSOS (
    ID_USUARIO INT,         
    FOREIGN KEY (ID-ALUMNO) REFERENCES ALUMNO(ID_ALUMNO),
    ID_CURSO INT,           
    FOREIGN KEY (ID-CURSO) REFERENCES CURSOS(ID_CURSO),
    ACEPTADO INT,
    CODICIA INT,
    PROGRESO INT,
)

CREATE TABLE OBJETOS(
    ID PRIMARY KEY VARCHAR(100),
    ID_ITEM VARCHAR(100),
    CANTIDAD VARCHAR(100),
    ID_CURSO INT,
    FOREIGN KEY (ID-CURSO) REFERENCES CURSOS(ID_CURSO),

)

CREATE TABLE TIERRAS (
    POSICION PRIMARY KEY INT,
    TIPO_TERRENO INT,
    ID_CURSO INT,                                    
    FOREIGN KEY (ID-CURSO) REFERENCES CURSOS(ID_CURSO),

)

CREATE TABLE NOTIFICACIONES (
    ID_NOTIF PRIMARY KEY INT,
    ID_ALUMNO INT,                                   
    FOREIGN KEY (ID-ALUMNO) REFERENCES ALUMNO(ID_ALUMNO),
    ID_CURSO INT,                                    
    FOREIGN KEY (ID-CURSO) REFERENCES CURSOS(ID_CURSO),
    TIPO INT,
    FECHA VARCHAR(100),
    VISTA? INT,
)

CREATE TABLE RANKING (
    ID_RANKING PRIMARY KEY INT,
    ID_PROFE INT,                             
    FOREIGN KEY (ID-PROFE) REFERENCES PROFE(ID_PROFE),
    ID_CURSO INT,                            
    FOREIGN KEY (ID-CURSO) REFERENCES CURSOS(ID_CURSO),
    ID_TAREA INT,                            
    FOREIGN KEY (ID_TAREA) REFERENCES TAREA(ID_TAREA),
    PUNTUACION TOTAL VARCHAR(100),
    
)

CREATE TABLE ALUMNO_TAREA (
    ID_ALUMNO INT,                            
    FOREIGN KEY (ID-ALUMNO) REFERENCES ALUMNO(ID_ALUMNO),
    ID_TAREA INT,                              
    FOREIGN KEY (ID_TAREA) REFERENCES TAREA(ID_TAREA),
    NOTA VARCHAR(100),
)