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
    id_alumno_cursos int primary key auto_increment,
    ID_ALUMNO INT,         
    ID_CURSO INT,  
    ACEPTADO varchar(5),
    CODICIA INT,
    PROGRESO INT,        
    FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSOS),
    FOREIGN KEY (ID_ALUMNO) REFERENCES ALUMNO(ID_ALUMNO)
);

CREATE TABLE OBJETOS(
    ID_objeto  int PRIMARY KEY auto_increment,
    ID_ITEM varchar(50),
    CANTIDAD int,
    ID_CURSO INT,
    id_alumno int,
    FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSOS),
    FOREIGN key(id_alumno) references alumno(id_alumno)
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
   NOTA int,
    ID_TAREA INT,  
    primary key(id_alumno, id_tarea)  ,                          
    FOREIGN KEY (ID_TAREA) REFERENCES TAREA(ID_TAREA),
    
     FOREIGN KEY (ID_ALUMNO) REFERENCES ALUMNO(ID_ALUMNO)
);

INSERT INTO ALUMNO (Nombre_Y_Apellidos, USERNAME, CORREO, CLAVE_CIFRADA) VALUES
('Juan Perez', 'jperez', 'jperez@example.com', 'password123'),
('Maria Lopez', 'mlopez', 'mlopez@example.com', 'securepwd456');

INSERT INTO PROFE (Nombre_Y_Apellidos, USERNAME, CORREO, CLAVE_CIFRADA) VALUES
('Carlos Martinez', 'cmartinez', 'cmartinez@example.com', 'teacherpass789'),
('Ana Rodriguez', 'arodriguez', 'arodriguez@example.com', 'teach2020');

INSERT INTO CURSOS (ID_PROFE, NOMBRE) VALUES
(1, 'Matemáticas Avanzadas'),
(2, 'Historia del Arte');


UPDATE objetos SET cantidad = 5 WHERE id_item = 2 AND id_curso = ( SELECT c.id_cursos FROM cursos c, alumno_cursos a WHERE c.id_cursos = a.id_curso AND aceptado = 1 ); 


INSERT INTO ALUMNO_CURSOS (ID_alumno, ID_CURSO, ACEPTADO, CODICIA, PROGRESO) VALUES
(1, 1, '1', 0, 50),
(2, 2 ,'0' ,1 ,25);

INSERT INTO OBJETOS (ID_ITEM , CANTIDAD , ID_CURSO) VALUES
('1', '10', 1),
('2', '5', 2);

INSERT INTO TIERRAS (POSICION , TIPO_TERRENO , ID_CURSO) VALUES
(1 , 3 , 1),
(2 , 2 , 2);

INSERT INTO NOTIFICACIONES (ID_ALUMNO , ID_CURSO , TIPO , FECHA , VISTA) VALUES
(1 , 1 , 1 , '2024-03-14' , 0),
(2 , 2 , 2 , '2024-03-15' , 1);

insert into tarea(fecha) values("2022-10-14"),("2023-12-24");

INSERT INTO RANKING (ID_PROFE , ID_CURSO , ID_TAREA , PUNTUACION_TOTAL) VALUES
(1 , 1 , 1 ,'10'),
(2 , 2 , 2 ,'3');

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
WHERE ID_USUARIO = 'id_del_usuario';


--Consulta 4:Crear cuenta como profesor 

INSERT INTO PROFE (ID_PROFE, Nombre_Y_Apellidos, USERNAME, CORREO, CLAVE_CIFRADA) 
VALUES (3, 'Pablo', 'PabloEscudero', 'pabloescugol@gmail.com', 'profesor536353');
--Consulta 5:Log in como profesor
SELECT * FROM PROFE
WHERE USERNAME = ' ' AND CLAVE_CIFRADA = ' ';

--Consulta 6:Crear curso
INSERT INTO CURSOS (ID_CURSOS, ID_PROFE, NOMBRE) VALUES
(3,3, 'DAM_2024')


--Consulta 7: Lista cursos  

SELECT ID_CURSOS, NOMBRE FROM CURSOS, PROFE where cursos.ID_PROFE = profe.ID_PROFE; 

 

--Consulta 8: alumno inserta codigo clase pero no esta aceptado 

SELECT ACEPTADO from ALUMNO_CURSOS where ALUMNO_CURSOS.aceptado = 0; 

--9 aceptar al alumno en la clase como profesor 

Update alumno_cursos set aceptado = 1 where id_alumno= '';

--10 listas de los alumnos que hay en el curso 

select id_alumno, id_curso from alumno_cursos order by id_curso;  

--11 lista del profesor 

select nombre, nombre_y_apellidos from cursos, profe where cursos.id_profe = profe.id_profe; 

--12 que aparezca el alumno aceptado en la clase 

SELECT ACEPTADO, nombre_y_apellidos from ALUMNO_CURSOS, Alumno where alumno_cursos.id_alumno = alumno.id_alumno and aceptado = 1; 

--13 cinco monedas de oro solo por ser aceptado 

UPDATE objetos SET cantidad = (cantidad + 5) WHERE id_item = 1 AND (SELECT cursos.id_cursos FROM cursos, alumno_cursos WHERE cursos.id_cursos = alumno_cursos.id_curso AND aceptado = 1); 

--14 cofre de madera solo por ser aceptado 

UPDATE objetos SET cantidad = (cantidad + 1) WHERE id_item = 2 AND (SELECT cursos.id_cursos FROM cursos, alumno_cursos WHERE cursos.id_cursos = alumno_cursos.id_curso AND aceptado = 1); 

--15 Huevo comun al ser aceptado 

UPDATE objetos SET cantidad = (cantidad + 1) WHERE id_item = 3 AND (SELECT cursos.id_cursos FROM cursos, alumno_cursos WHERE cursos.id_cursos = alumno_cursos.id_curso AND aceptado = 1); 

--16 abrir el cofre de madera 

UPDATE objetos SET cantidad = (cantidad - 1) WHERE id_item = 2 AND (SELECT cursos.id_cursos FROM cursos, alumno_cursos WHERE cursos.id_cursos = alumno_cursos.id_curso AND aceptado = 1); 

--17 insert con todos los objetos que tocarian en el cofre de madera 
INSERT INTO OBJETOS (ID_ITEM , CANTIDAD , ID_CURSO, id_alumno) VALUES (1,  5,  1, 1),(56, 1, 1, 1), (200, 1,1,1); 

--18 monedas id 1 update en el apartado de monedas 

UPDATE objetos SET cantidad = (cantidad + 5) WHERE id_item = 1; 

--19 piedra de fuego id 56 insert  

Insert into objetos(id_item, cantidad, ID_CURSO, id_alumno) values (56, 1, 1, 1); 

--20 calabaza id 50 insert 

Insert into objetos(id_item, cantidad, ID_CURSO, id_alumno) values (50, 1, 1, 1); 

--21 entrar al pueblo hacer un select de id entre 200 y 500 que son los chibis 

Select id_objeto from objetos where id_objeto between 200 and 500; 

--22 crear un ranking con la cuenta de profesor insert y un create al crear la tarea tambien hay que crear una tabla que se llama participa en donde estaran las notas 

 Insert into ranking(id_profe,id_curso,id_tarea,puntuacion_total) values (1,1,1,0); 

 --23 cambiamos las notas con un update de las notas 

 Update alumno_tarea set nota = '' where nota = '';

 --24 entregamos recompensas que seria un update de la tabla inventario 

  Update objetos set cantidad = cantidad + 1 where id_item = 5; 

  --25 hacer una consulta que te enseñe los rankings del curso (siendo alumno) 

   Select id_ranking as Nombre, ranking.id_profe as profesor, id_tarea as Tarea, puntuacion_total as PuntuacionTotal from ranking, cursos where cursos.id_cursos=ranking.id_curso and ranking.id_profe = cursos.id_profe; 

   -- 26 para usar el inventario estamos haciendo un select de toda la tabla objetos hay como condicion el id del curso que sea el curso en el que estamos hay como condicion el id del alumno y otra condicion que el numero sea mayor que 0 

   Select * from objetos o, alumno_cursos ac where o.id_curso=ac.id_curso and o.id_alumno=ac.id_alumno and cantidad >0; 

   --27 hacer una tabla con las notificaciones

   Select fecha, tipo, vista, id_notif from notificaciones; 

