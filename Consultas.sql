CREATE TABLE ALUMNO (
    ID_ALUMNO int PRIMARY KEY auto_increment,
    Nombre_Y_Apellidos VARCHAR(100),
    USERNAME VARCHAR(50),
    CORREO VARCHAR(200),
    CLAVE_CIFRADA VARCHAR(50)
);

CREATE TABLE PROFE (
    ID_PROFE int PRIMARY KEY auto_increment,
    Nombre_Y_Apellidos VARCHAR(100),
    USERNAME VARCHAR(100),
    CORREO VARCHAR(500),
    CLAVE_CIFRADA VARCHAR(50)
);

CREATE TABLE CURSOS (
    ID_CURSOS int PRIMARY KEY auto_increment,
    ID_PROFE INT,  
    NOMBRE VARCHAR(100),
    FOREIGN KEY (ID_PROFE) REFERENCES PROFE (ID_PROFE)
);



CREATE TABLE ALUMNO_CURSOS (
    ID_ALUMNO INT,         
    ID_CURSO INT,  
    ACEPTADO varchar(5),
    CODICIA INT,
    PROGRESO INT,   
    primary key(id_alumno, id_curso),      
    FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSOS),
    FOREIGN KEY (ID_ALUMNO) REFERENCES ALUMNO(ID_ALUMNO)
);

CREATE TABLE OBJETOS(
    ID_objeto  int PRIMARY KEY auto_increment,
    ID_ITEM varchar(50),
    CANTIDAD int,
    ID_CURSO INT,
    FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSOS)
);


CREATE TABLE TIERRAS (
    POSICION  INT PRIMARY KEY,
    TIPO_TERRENO INT,
    ID_CURSO INT,                                    
    FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSOS)

);

CREATE TABLE NOTIFICACIONES (
    ID_NOTIF INT PRIMARY KEY auto_increment,
    ID_ALUMNO INT,  
    TIPO INT,
    FECHA date,
    VISTA boolean, 
    ID_CURSO INT,                                 
    FOREIGN KEY (ID_ALUMNO) REFERENCES ALUMNO(ID_ALUMNO),
                                   
    FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSOS)

);

create table tarea(
    id_tarea int primary key auto_increment,
    fecha date
);

CREATE TABLE RANKING (
    ID_RANKING INT PRIMARY KEY auto_increment,
    ID_PROFE INT,                             
    ID_CURSO INT,                            
    ID_TAREA INT,                            
    PUNTUACION_TOTAL VARCHAR(100),
     FOREIGN KEY (ID_PROFE) REFERENCES PROFE(ID_PROFE),
     FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSOS),
     FOREIGN KEY (ID_TAREA) REFERENCES TAREA(ID_TAREA)
    
);



CREATE TABLE ALUMNO_TAREA (
    ID_ALUMNO INT,                            
   NOTA VARCHAR(100),
    ID_TAREA INT,  
    primary key(id_alumno, id_tarea)  ,                          
    FOREIGN KEY (ID_TAREA) REFERENCES TAREA(ID_TAREA),
    
     FOREIGN KEY (ID_ALUMNO) REFERENCES ALUMNO(ID_ALUMNO)
);

INSERT INTO ALUMNO (ID, Nombre_Y_Apellidos, USERNAME, CORREO, CLAVE_CIFRADA) VALUES
(1, 'Juan Perez', 'jperez', 'jperez@example.com', 'password123'),
(2, 'Maria Lopez', 'mlopez', 'mlopez@example.com', 'securepwd456');

INSERT INTO PROFE (ID_PROFE, Nombre_Y_Apellidos, USERNAME, CORREO, CLAVE_CIFRADA) VALUES
(1, 'Carlos Martinez', 'cmartinez', 'cmartinez@example.com', 'teacherpass789'),
(2, 'Ana Rodriguez', 'arodriguez', 'arodriguez@example.com', 'teach2020');

INSERT INTO CURSOS (ID_CURSOS, ID_PROFE, NOMBRE) VALUES
('1', 1, 'Matemáticas Avanzadas'),
('2', 2, 'Historia del Arte');



INSERT INTO ALUMNO_CURSOS (ID_USUARIO, ID_CURSO, ACEPTADO, CODICIA, PROGRESO) VALUES
(1, 1, 1, 0, 50),
(2, 2 ,0 ,1 ,25);

INSERT INTO OBJETOS (id_objeto, ID_ITEM , CANTIDAD , ID_CURSO) VALUES
(1, '1', '10 unidades', 1),
(2, '2', '5 unidades', 2);

INSERT INTO TIERRAS (POSICION , TIPO_TERRENO , ID_CURSO) VALUES
(1 , 3 , 1),
(2 , 2 , 2);

INSERT INTO NOTIFICACIONES (id_notif, ID_ALUMNO , ID_CURSO , TIPO , FECHA , VISTA) VALUES
(1, 1 , 1 , 1 , '2024-03-14' , 0),
(2, 2 , 2 , 2 , '2024-03-15' , 1);

INSERT INTO RANKING (id_ranking, ID_PROFE , ID_CURSO , ID_TAREA , PUNTUACION_TOTAL) VALUES
(1, 1 , 1 , 1 ,'10'),
(2, 2 , 2 , 2 ,'3');

INSERT INTO ALUMNO_TAREA (ID_ALUMNO , ID_TAREA , NOTA) VALUES
(1 , 1 ,'Excelente trabajo!'),
(2 , 2 ,'Puede mejorar en la presentación.');

--Consulta 1: Crear cuenta  
INSERT INTO ALUMNO (ID_ALUMNO, Nombre_Y_Apellidos, USERNAME, CORREO, CLAVE_CIFRADA) 
VALUES (3, 'Pelayo Garcia', 'PelayoGarcia', 'pelayoam@gmail.com', 'jdjdjd');

--Consulta 2: Log in como Alumno
SELECT * FROM ALUMNO
WHERE USERNAME = ' ' AND CLAVE_CIFRADA = ' ';

--Consulta 3: Cambiar icono

UPDATE ALUMNO
SET ICONO_DE_PERFIL = 'nuevo_icono.png'
WHERE ID_USUARIO = <id_del_usuario>;


--Consulta 4:Crear cuenta como profesor 

INSERT INTO PROFE (ID_PROFE, Nombre_Y_Apellidos, USERNAME, CORREO, CLAVE_CIFRADA) 
VALUES (3, 'Pablo', 'PabloEscudero', 'pabloescugol@gmail.com', 'profesor536353');
--Consulta 5:Log in como profesor
SELECT * FROM PROFE
WHERE USERNAME = ' ' AND CLAVE_CIFRADA = ' ';

--Consulta 6:Crear curso
INSERT INTO CURSOS (ID_CURSOS, ID_PROFE, NOMBRE) VALUES
(3,3, 'DAM_2024')


--7 

--8

--15 Huevo comun al ser aceptado 

SELECT ID_ALUMNO, ID_CURSO
FROM ALUMNO_CURSOS
WHERE ACEPTADO = 1; 

SELECT ID_OBJETO
FROM OBJETOS
WHERE ID_ITEM = 'HUEVO_COMUN'; 

