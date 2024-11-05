/*trabajo en clase */
create database db6_trabajoClase;
use db6_trabajoClase;
/* Bloque para manejo de errores */

START TRANSACTION;

/* Crear tabla empleados */
CREATE TABLE empleados (
    nombre VARCHAR(100) NOT NULL,
    ID_empleados INT NOT NULL,
    direccion VARCHAR(100),
    correo VARCHAR(100),
    salario INT NOT NULL,
    telefono INT NOT NULL,
    PRIMARY KEY (ID_empleados)
);

/* Crear tabla proyectos */
CREATE TABLE proyectos (
    ID_Proyecto INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL,
    descripcion VARCHAR(1000),
    presupuesto int not null,
    FK_ID_empleados INT,
    PRIMARY KEY (ID_Proyecto),
    CONSTRAINT FOREIGN KEY (FK_ID_empleados) REFERENCES empleados(ID_empleados)
);

/* Crear tabla tareas */
CREATE TABLE tareas (
    ID_tarea INT NOT NULL,
    fecha_asignamiento DATE NOT NULL,
    fecha_entrega DATETIME NOT NULL,
    estado VARCHAR(100) NOT NULL,
    FK_ID_empleados INT,
    PRIMARY KEY (ID_tarea),
    CONSTRAINT FOREIGN KEY (FK_ID_empleados) REFERENCES empleados(ID_empleados)
);

/* Insertar datos en las tablas */
INSERT INTO empleados (ID_empleados, nombre, direccion, correo, salario, telefono) VALUES 
(10, 'José Osorio', 'cll#13A-44', 'jose.osorio@uao.edu.co', 1600000, 31542695),
(11, 'María Camila Lopez', 'cll#3A-4', 'camila.lopez@uao.edu.co', 2000000, 31498703),
(12, 'Camilo Castro', 'cra#70D#55-10', 'camilo.castro@uao.edu.co', 5000000, 31268466);

INSERT INTO proyectos (ID_Proyecto, fecha_inicio, fecha_final, descripcion,presupuesto, FK_ID_empleados) VALUES 
(20, '2023-05-20', '2023-07-15', 'Debe ser coherente y sin errores',2000000, 10),
(21, '2022-11-14', '2022-11-23', 'Debe tener mínimo 700 líneas de código',54000000, 11),
(22, '2024-12-08', '2024-12-20', 'Redactar 6 párrafos explicando la metodología utilizada',100000000, 12);

INSERT INTO tareas (ID_tarea, fecha_asignamiento, fecha_entrega, estado, FK_ID_empleados) VALUES 
(1, '2024-09-26', '2024-09-29', 'sin entregar', 10),
(2, '2024-09-23', '2024-09-30', 'entregado', 11),
(3, '2024-09-30', '2024-10-10', 'sin entregar', 12);

delete from tareas where estado = "sin entregar";
delete from empleados where ID_empleados = 10;
delete from proyectos where ID_Proyecto = "2";

update empleados set nombre = "Perensejo" where ID_empleados = 11;
update tareas set estado = "entregado" where ID_tarea = 1;
update proyectos set fecha_final= "2024/12/25" where ID_Proyecto = 22;

/* Confirmar la transacción si no hubo errores */
COMMIT;
select 'Transacción completada exitosamente';
SELECT * FROM tareas;