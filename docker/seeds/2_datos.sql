--* Horarios
INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Mañana', 'Lunes', '08:00:00'::time, '12:00:00'::time,
        '2025-10-22'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Mañana', 'Martes', '08:30:00'::time, '12:30:00'::time,
        '2025-10-21'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Mañana', 'Miércoles', '09:00:00'::time, '12:45:00'::time,
        '2025-10-20'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Mañana', 'Jueves', '08:15:00'::time, '12:15:00'::time,
        '2025-10-19'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Mañana', 'Viernes', '09:30:00'::time, '12:30:00'::time,
        '2025-10-18'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Tarde', 'Lunes', '14:00:00'::time, '18:00:00'::time,
        '2025-10-17'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Tarde', 'Martes', '14:30:00'::time, '18:30:00'::time,
        '2025-10-16'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Tarde', 'Miércoles', '15:00:00'::time, '18:15:00'::time,
        '2025-10-15'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Tarde', 'Jueves', '14:15:00'::time, '18:30:00'::time,
        '2025-10-14'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Tarde', 'Viernes', '15:30:00'::time, '18:45:00'::time,
        '2025-10-13'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Lunes-Miércoles', '08:00:00'::time, '17:00:00'::time,
        '2025-10-12'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Martes-Jueves', '08:00:00'::time, '17:00:00'::time,
        '2025-10-11'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Miércoles-Viernes', '08:30:00'::time, '17:00:00'::time,
        '2025-10-10'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Lunes-Viernes', '08:00:00'::time, '17:00:00'::time,
        '2025-10-09'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Martes-Jueves', '08:15:00'::time, '17:00:00'::time,
        '2025-10-08'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Miércoles-Viernes', '08:00:00'::time, '17:00:00'::time,
        '2025-10-07'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Lunes-Miércoles', '08:30:00'::time, '17:00:00'::time,
        '2025-10-06'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Martes-Viernes', '08:00:00'::time, '17:00:00'::time,
        '2025-10-05'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Lunes-Viernes', '08:00:00'::time, '17:00:00'::time,
        '2025-10-04'::timestamp, '2025-10-22'::timestamp);

INSERT INTO horario (turno, dia, h_inicio, h_fin, f_creacion, f_edicion)
VALUES ('Completo', 'Miércoles-Viernes', '08:30:00'::time, '17:00:00'::time,
        '2025-10-03'::timestamp, '2025-10-22'::timestamp);

COMMIT;

--* Periodo
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2022-01-01'::timestamp, '2022-06-30'::timestamp, '2022-01-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2022-07-01'::timestamp, '2022-12-31'::timestamp, '2022-07-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2022-03-05'::timestamp, '2022-03-06'::timestamp, '2022-03-05'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2022-09-10'::timestamp, '2022-09-12'::timestamp, '2022-09-10'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2023-01-01'::timestamp, '2023-06-30'::timestamp, '2023-01-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2023-07-01'::timestamp, '2023-12-31'::timestamp, '2023-07-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2023-02-15'::timestamp, '2023-02-22'::timestamp, '2023-02-15'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2023-05-20'::timestamp, '2023-05-27'::timestamp, '2023-05-20'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2024-01-01'::timestamp, '2024-06-30'::timestamp, '2024-01-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2024-07-01'::timestamp, '2024-12-31'::timestamp, '2024-07-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2024-04-10'::timestamp, '2024-04-17'::timestamp, '2024-04-10'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2024-09-01'::timestamp, '2024-09-07'::timestamp, '2024-09-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2025-01-01'::timestamp, '2025-06-30'::timestamp, '2025-01-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2025-07-01'::timestamp, '2025-12-31'::timestamp, '2025-07-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2025-03-01'::timestamp, '2025-03-07'::timestamp, '2025-03-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2025-05-15'::timestamp, '2025-05-22'::timestamp, '2025-05-15'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2025-08-01'::timestamp, '2025-08-07'::timestamp, '2025-08-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2025-10-01'::timestamp, '2025-10-05'::timestamp, '2025-10-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2025-09-05'::timestamp, '2025-09-07'::timestamp, '2025-09-05'::timestamp, '2025-10-22'::timestamp);
INSERT INTO PERIODO (F_INICIO, F_FIN, F_CREACION, F_EDICION) VALUES ('2025-10-20'::timestamp, '2025-10-22'::timestamp, '2025-10-20'::timestamp, '2025-10-22'::timestamp);

COMMIT;

--* Salon
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Patio Interno', 0, 80, '2023-01-15'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Recepción', 0, 6, '2023-01-15'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('La Mega Radio', 1, 10, '2023-02-10'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Dirección CCDB', 1, 5, '2023-02-10'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Semillero', 1, 15, '2023-03-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Laboratorio de Arte', 1, 20, '2023-03-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Pasillo', 1, 25, '2023-03-05'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Sanitario', 1, 4, '2023-03-05'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Don Bosco Teatro', 2, 200, '2023-04-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Salón Múltiple', 2, 120, '2023-04-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Cocina', 2, 10, '2023-04-05'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Internado', 2, 40, '2023-04-10'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Sanitario - Ducha', 2, 8, '2023-04-10'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Capilla San Pedro', 3, 60, '2023-05-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Escuela de Formación Pastoral', 3, 50, '2023-05-01'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Patio Interno', 3, 40, '2023-05-05'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Salón de Arte', 3, 30, '2023-05-10'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('ResiDart', 3, 12, '2023-05-10'::timestamp, '2025-10-22'::timestamp);
INSERT INTO SALON (NOMBRE, PISO, CAPACIDAD, F_CREACION, F_EDICION) VALUES ('Productora', 3, 10, '2023-05-15'::timestamp, '2025-10-22'::timestamp);

COMMIT;

--* Actividad
INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2022-A', 'Pintura al Óleo - Nivel Inicial', 
        'Curso formativo que enseña las bases del uso del óleo y mezcla de colores para principiantes.', 
        '2022-03-01'::timestamp, '2022-03-10'::timestamp, 1, 1, 17);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2022-B', 'Fotografía Digital Creativa', 
        'Curso teórico-práctico sobre fotografía digital con enfoque artístico y composición visual.', 
        '2022-05-10'::timestamp, '2022-05-20'::timestamp, 2, 2, 10);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2023-A', 'Danza Moderna para Jóvenes', 
        'Curso anual que desarrolla técnicas de danza moderna y expresión corporal juvenil.', 
        '2023-02-01'::timestamp, '2023-02-15'::timestamp, 4, 3, 10);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2023-B', 'Cerámica y Escultura Contemporánea', 
        'Formación artística sobre modelado, escultura y cerámica contemporánea.', 
        '2023-04-05'::timestamp, '2023-04-15'::timestamp, 5, 4, 17);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2023-C', 'Producción y Locución Radial', 
        'Capacitación técnica en producción de programas radiales y edición de audio.', 
        '2023-07-10'::timestamp, '2023-07-20'::timestamp, 6, 5, 3);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2024-A', 'Teatro Musical Integrado', 
        'Curso integral que combina canto, actuación y expresión escénica musical.', 
        '2024-03-01'::timestamp, '2024-03-10'::timestamp, 8, 6, 9);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2024-B', 'Dibujo Artístico Profesional', 
        'Curso profesional de técnicas de dibujo, perspectiva y sombreado artístico.', 
        '2024-05-05'::timestamp, '2024-05-15'::timestamp, 9, 7, 17);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2024-C', 'Arte con Material Reciclado', 
        'Formación artística enfocada en la reutilización de materiales reciclables.', 
        '2024-08-01'::timestamp, '2024-08-10'::timestamp, 10, 8, 17);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2025-A', 'Ilustración Digital con Tablet', 
        'Curso avanzado de ilustración digital y uso de herramientas gráficas en tablet.', 
        '2025-02-01'::timestamp, '2025-02-10'::timestamp, 12, 9, 19);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON) 
VALUES ('CUR-2025-B', 'Expresión Corporal Escénica', 
        'Entrenamiento corporal y de movimiento para actores y bailarines escénicos.', 
        '2025-04-05'::timestamp, '2025-04-15'::timestamp, 13, 10, 10);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2022-A','Taller Infantil de Teatro Creativo',
       'Taller lúdico para desarrollar la creatividad y el trabajo en grupo a través del teatro.',
        '2022-04-01'::timestamp, '2022-04-05'::timestamp, 1, 3, 9);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2022-B','Fotografía con Celular y Edición Rápida',
       'Taller corto sobre técnicas para capturar y editar fotos desde un celular.',
        '2022-09-10'::timestamp, '2022-09-15'::timestamp, 3, 4, 10);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2023-A','Pintura al Aire Libre Experiencial',
       'Taller vivencial de pintura en exteriores y observación de paisajes.',
       TO_DATE('2023-03-15','YYYY-MM-DD'), TO_DATE('2023-03-20','YYYY-MM-DD'), 4, 5, 17);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2023-B','Serigrafía Artesanal Textil',
       'Aprendizaje práctico de serigrafía para diseños textiles artesanales.',
       TO_DATE('2023-06-01','YYYY-MM-DD'), TO_DATE('2023-06-07','YYYY-MM-DD'), 6, 6, 17);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2023-C','Improvisación Escénica Grupal',
       'Sesiones dinámicas de improvisación teatral con enfoque grupal.',
       TO_DATE('2023-10-01','YYYY-MM-DD'), TO_DATE('2023-10-07','YYYY-MM-DD'), 7, 7, 9);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2022-A','Atención Psicológica Comunitaria',
       'Servicio gratuito de apoyo psicológico para familias y jóvenes.',
       TO_DATE('2022-03-05','YYYY-MM-DD'), TO_DATE('2022-03-20','YYYY-MM-DD'), 1, 1, 8);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2022-B','Orientación Vocacional y Educativa',
       'Servicio de orientación vocacional con test y entrevistas personalizadas.',
       TO_DATE('2022-10-01','YYYY-MM-DD'), TO_DATE('2022-10-15','YYYY-MM-DD'), 3, 2, 8);
    
INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2024-A','Modelado con Arcilla para Principiantes',
       'Taller básico de modelado en arcilla para jóvenes y adultos.',
       TO_DATE('2024-02-10','YYYY-MM-DD'), TO_DATE('2024-02-17','YYYY-MM-DD'), 8, 8, 17);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2024-B','Locución y Radio Comunitaria',
       'Capacitación intensiva en locución, dicción y producción radial comunitaria.',
       TO_DATE('2024-04-10','YYYY-MM-DD'), TO_DATE('2024-04-15','YYYY-MM-DD'), 9, 9, 3);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2024-C','Danza Folklórica Boliviana Intensiva',
       'Taller cultural sobre danza folklórica boliviana con enfoque tradicional.',
       TO_DATE('2024-09-01','YYYY-MM-DD'), TO_DATE('2024-09-10','YYYY-MM-DD'), 10, 10, 10);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2025-A','Fotografía Escénica para Artistas',
       'Taller práctico sobre fotografía escénica aplicada a obras de teatro.',
       TO_DATE('2025-01-15','YYYY-MM-DD'), TO_DATE('2025-01-22','YYYY-MM-DD'), 12, 11, 10);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('TALL-2025-B','Taller de Expresión Artística Libre',
       'Espacio libre de creación artística en pintura, música y escritura.',
       TO_DATE('2025-05-01','YYYY-MM-DD'), TO_DATE('2025-05-07','YYYY-MM-DD'), 13, 12, 17);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2023-A','Acompañamiento Espiritual Personal',
       'Sesiones de reflexión espiritual y acompañamiento personal guiadas.',
       TO_DATE('2023-05-01','YYYY-MM-DD'), TO_DATE('2023-05-10','YYYY-MM-DD'), 5, 3, 14);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2023-B','Campaña de Recolección de Alimentos',
       'Actividad comunitaria de recolección de alimentos para familias necesitadas.',
       TO_DATE('2023-07-05','YYYY-MM-DD'), TO_DATE('2023-07-15','YYYY-MM-DD'), 6, 4, 1);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2023-C','Centro de Donaciones Solidarias',
       'Servicio continuo de recepción y distribución de donaciones.',
       TO_DATE('2023-11-01','YYYY-MM-DD'), TO_DATE('2023-11-10','YYYY-MM-DD'), 7, 5, 2);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2024-A','Clínica Psicológica Comunitaria',
       'Atención psicológica gratuita los fines de semana para la comunidad.',
       TO_DATE('2024-03-10','YYYY-MM-DD'), TO_DATE('2024-03-25','YYYY-MM-DD'), 8, 6, 8);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2024-B','Tutorías Escolares Gratuitas',
       'Servicio de refuerzo escolar en materias troncales para estudiantes.',
       TO_DATE('2024-08-01','YYYY-MM-DD'), TO_DATE('2024-08-10','YYYY-MM-DD'), 10, 7, 16);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2025-A','Salud Mental para Estudiantes',
       'Charlas y acompañamiento sobre bienestar emocional estudiantil.',
       TO_DATE('2025-01-10','YYYY-MM-DD'), TO_DATE('2025-01-20','YYYY-MM-DD'), 12, 8, 8);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2025-B','Asesoría Jurídica Comunitaria',
       'Asistencia legal gratuita en temas de familia y comunidad.',
       TO_DATE('2025-04-01','YYYY-MM-DD'), TO_DATE('2025-04-15','YYYY-MM-DD'), 13, 9, 5);

INSERT INTO ACTIVIDAD (COD_ACTIVIDAD, NOMBRE, DESCRIPCION, F_CREACION, F_EDICION, ID_PERIODO, ID_HORARIO, ID_SALON)
VALUES ('SERV-2025-C','Voluntariado Don Bosco Solidario',
       'Programa de voluntariado juvenil para proyectos sociales del CCDB.',
       TO_DATE('2025-07-05','YYYY-MM-DD'), TO_DATE('2025-07-20','YYYY-MM-DD'), 15, 10, 1);

COMMIT;

--* Persona
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (1, '12345678', 'Ruben', 'Alejo', 'Conde', 'M', TO_DATE('16/5/1981', 'DD/MM/YYYY'), 'Rincón Portada', 'Bella Vista', '2150', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000001');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (2, '95327494', 'Diego', 'Mendoza', 'Martinez', 'M', TO_DATE('19/6/1978', 'DD/MM/YYYY'), 'Irpavi', 'Av. Montenegro', '4712', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000002');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (3, '71113651', 'Valeria', 'Gomez', 'Navarro', 'F', TO_DATE('21/1/1997', 'DD/MM/YYYY'), 'Cota Cota', 'Calle Potosi', '2567', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000003');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (4, '59372291', 'Elena', 'Morales', 'Garcia', 'F', TO_DATE('10/02/1988', 'DD/MM/YYYY'), 'San Miguel', 'Calle Goitia', '437', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000004');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (5, '17796793', 'Sofia', 'Alvarez', 'Suarez', 'F', TO_DATE('18/5/1996', 'DD/MM/YYYY'), 'San Miguel', 'Calle 21', '3394', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000005');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (6, '13172410', 'Diego', 'Flores', 'Jimenez', 'M', TO_DATE('08/08/1975', 'DD/MM/YYYY'), 'San Miguel', 'Calle Sagarnaga', '2793', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000006');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (7, '95418195', 'Maria', 'Sanz', 'Castro', 'F', TO_DATE('24/12/1999', 'DD/MM/YYYY'), 'Miraflores', 'Calle Sagarnaga', '3964', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000007');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (8, '38156237', 'Daniela', 'Perez', 'Garcia', 'F', TO_DATE('15/10/1980', 'DD/MM/YYYY'), 'San Miguel', 'Calle Illampu', '1622', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000008');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (9, '36238006', 'Isabel', 'Rojas', 'Guerrero', 'F', TO_DATE('12/05/1987', 'DD/MM/YYYY'), 'Miraflores', 'Av. Busch', '74', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000009');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (10, '76297818', 'Pedro', 'Vargas', 'Ortiz', 'M', TO_DATE('23/7/1977', 'DD/MM/YYYY'), 'Sopocachi', 'Av. Busch', '4684', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000010');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (11, '56305783', 'Miguel', 'Diaz', 'Aguilar', 'F', TO_DATE('18/4/1977', 'DD/MM/YYYY'), 'Miraflores', 'Calle Illampu', '4591', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000011');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (12, '36652874', 'Daniela', 'Castillo', 'Garcia', 'M', TO_DATE('04/10/1988', 'DD/MM/YYYY'), 'Calacoto', 'Av. Montenegro', '1989', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000012');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (13, '51386327', 'Valeria', 'Mendoza', 'Navarro', 'M', TO_DATE('27/9/2005', 'DD/MM/YYYY'), 'Irpavi', 'Av. Montenegro', '2573', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000013');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (14, '33486302', 'Ana', 'Mendoza', 'Jimenez', 'M', TO_DATE('09/04/1988', 'DD/MM/YYYY'), 'Miraflores', 'Calle 21', '3197', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000014');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (15, '98861981', 'Javier', 'Torres', 'Ramos', 'F', TO_DATE('29/7/1993', 'DD/MM/YYYY'), 'San Miguel', 'Av. Montenegro', '996', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000015');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (16, '66715126', 'Ana', 'Lopez', 'Nuñez', 'F', TO_DATE('13/1/1972', 'DD/MM/YYYY'), 'San Miguel', 'Av. Arce', '4971', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000016');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (17, '27761067', 'Javier', 'Diaz', 'Jimenez', 'F', TO_DATE('23/5/1984', 'DD/MM/YYYY'), 'San Pedro', 'Calle Sagarnaga', '3808', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000017');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (18, '16874757', 'Ricardo', 'Rivera', 'Gutierrez', 'M', TO_DATE('16/2/2000', 'DD/MM/YYYY'), 'Achumani', 'Calle Goitia', '3618', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000018');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (19, '4748652', 'Javier', 'Morales', 'Blanco', 'F', TO_DATE('10/07/2002', 'DD/MM/YYYY'), 'San Miguel', 'Av. 6 de Agosto', '4459', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000019');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (20, '85174007', 'Pedro', 'Ortega', 'Ramos', 'F', TO_DATE('03/02/1988', 'DD/MM/YYYY'), 'Achumani', 'Calle Murillo', '2851', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000020');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (21, '56440202', 'Valeria', 'Ortega', 'Serrano', 'M', TO_DATE('19/4/1976', 'DD/MM/YYYY'), 'Miraflores', 'Av. Montenegro', '4039', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000021');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (22, '54353317', 'Pedro', 'Castillo', 'Salazar', 'F', TO_DATE('01/07/1978', 'DD/MM/YYYY'), 'Sopocachi', 'Calle 21', '3076', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000022');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (23, '34256655', 'Valeria', 'Morales', 'Rubio', 'F', TO_DATE('16/2/1992', 'DD/MM/YYYY'), 'Zona Sur', 'Calle Potosi', '2497', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000023');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (24, '44910711', 'Miguel', 'Ortega', 'Fernandez', 'M', TO_DATE('09/08/1981', 'DD/MM/YYYY'), 'Sopocachi', 'Calle Goitia', '989', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000024');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (25, '36799016', 'Laura', 'Diaz', 'Guerrero', 'F', TO_DATE('11/08/1974', 'DD/MM/YYYY'), 'San Miguel', 'Av. 6 de Agosto', '812', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000025');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (26, '16844159', 'Fernando', 'Vargas', 'Sanchez', 'M', TO_DATE('08/10/2002', 'DD/MM/YYYY'), 'Miraflores', 'Calle 21', '2204', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000026');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (27, '38611057', 'Sofia', 'Rivera', 'Nuñez', 'M', TO_DATE('27/12/1994', 'DD/MM/YYYY'), 'San Miguel', 'Calle 21', '1813', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000027');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (28, '30047679', 'Sofia', 'Perez', 'Marin', 'F', TO_DATE('30/6/1970', 'DD/MM/YYYY'), 'Miraflores', 'Av. Arce', '3216', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000028');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (29, '72868205', 'Laura', 'Morales', 'Aguilar', 'F', TO_DATE('04/05/2000', 'DD/MM/YYYY'), 'Miraflores', 'Av. Busch', '2783', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000029');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (30, '16646318', 'Ricardo', 'Rivera', 'Navarro', 'M', TO_DATE('27/9/1990', 'DD/MM/YYYY'), 'Obrajes', 'Calle Illampu', '602', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000030');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (31, '90903479', 'Javier', 'Moreno', 'Jimenez', 'M', TO_DATE('10/05/1971', 'DD/MM/YYYY'), 'Achumani', 'Calle Illampu', '2627', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000031');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (32, '12345679', 'Ana', 'Quispe', 'Mamani', 'F', TO_DATE('12/03/1995', 'DD/MM/YYYY'), 'Villa Dolores', 'Calle 8', '300', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000032');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (33, '98765432', 'Luis', 'Condori', 'Flores', 'M', TO_DATE('23/11/1988', 'DD/MM/YYYY'), 'Rio Seco', 'Av. Litoral', '1500', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000033');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (34, '54321098', 'Carmen', 'Ramos', 'Gutierrez', 'F', TO_DATE('01/07/1976', 'DD/MM/YYYY'), 'Alto Lima', 'Calle Sucre', '250', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000034');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (35, '11223344', 'Jose', 'Vargas', 'Perez', 'M', TO_DATE('05/09/2001', 'DD/MM/YYYY'), 'Villa Adela', 'Calle D', '800', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000035');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (36, '22334455', 'Maria', 'Lopez', 'Quispe', 'F', TO_DATE('18/1/1990', 'DD/MM/YYYY'), '16 de Julio', 'Calle Potosí', '1200', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000036');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (37, '33445566', 'Juan', 'Mamani', 'Condori', 'M', TO_DATE('29/4/1982', 'DD/MM/YYYY'), 'Ciudad Satélite', 'Av. Satélite', '400', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000037');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (38, '44556677', 'Rosa', 'Flores', 'Ramos', 'F', TO_DATE('15/6/1970', 'DD/MM/YYYY'), 'Senkata', 'Calle E', '1800', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000038');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (39, '55667788', 'Carlos', 'Gutierrez', 'Vargas', 'M', TO_DATE('03/10/1998', 'DD/MM/YYYY'), 'Villa Dolores', 'Av. Illampu', '600', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000039');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (40, '66778899', 'Andrea', 'Perez', 'Lopez', 'F', TO_DATE('07/12/1985', 'DD/MM/YYYY'), 'Rio Seco', 'Calle Murillo', '1000', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000040');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (41, '77889900', 'Miguel', 'Quispe', 'Mamani', 'M', TO_DATE('20/2/1973', 'DD/MM/YYYY'), 'Alto Lima', 'Av. 6 de Agosto', '350', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000041');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (42, '88990011', 'Patricia', 'Condori', 'Flores', 'F', TO_DATE('11/08/2003', 'DD/MM/YYYY'), 'Villa Adela', 'Calle F', '950', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000042');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (43, '99001122', 'David', 'Ramos', 'Gutierrez', 'M', TO_DATE('25/5/1992', 'DD/MM/YYYY'), '16 de Julio', 'Calle Aroma', '1600', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000043');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (44, '10112233', 'Gabriela', 'Vargas', 'Perez', 'F', TO_DATE('09/07/1980', 'DD/MM/YYYY'), 'Ciudad Satélite', 'Av. Costanera', '550', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000044');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (45, '11223345', 'Fernando', 'Lopez', 'Quispe', 'M', TO_DATE('14/9/1975', 'DD/MM/YYYY'), 'Senkata', 'Calle G', '2100', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000045');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (46, '12345680', 'Susana', 'Mamani', 'Condori', 'F', TO_DATE('01/11/1997', 'DD/MM/YYYY'), 'Villa Dolores', 'Av. Montes', '700', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000046');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (47, '13456789', 'Roberto', 'Flores', 'Ramos', 'M', TO_DATE('08/03/1983', 'DD/MM/YYYY'), 'Rio Seco', 'Calle H', '1300', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000047');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (48, '14567890', 'Alejandra', 'Gutierrez', 'Vargas', 'F', TO_DATE('19/5/1971', 'DD/MM/YYYY'), 'Alto Lima', 'Av. Buenos Aires', '420', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000048');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (49, '15678901', 'Daniel', 'Perez', 'Lopez', 'M', TO_DATE('28/1/1999', 'DD/MM/YYYY'), 'Villa Adela', 'Calle I', '1100', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000049');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (50, '16789012', 'Valeria', 'Quispe', 'Mamani', 'F', TO_DATE('02/04/1986', 'DD/MM/YYYY'), '16 de Julio', 'Calle Yanacocha', '1900', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000050');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (51, '17890123', 'Esteban', 'Condori', 'Flores', 'M', TO_DATE('16/6/1974', 'DD/MM/YYYY'), 'Ciudad Satélite', 'Av. Mariscal Santa', '650', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000051');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (52, '18901234', 'Natalia', 'Ramos', 'Gutierrez', 'F', TO_DATE('22/10/2004', 'DD/MM/YYYY'), 'Senkata', 'Calle J', '2300', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000052');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (53, '19012345', 'Ricardo', 'Vargas', 'Perez', 'M', TO_DATE('04/12/1993', 'DD/MM/YYYY'), 'Villa Dolores', 'Av. Pando', '850', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000053');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (54, '20123456', 'Carolina', 'Lopez', 'Quispe', 'F', TO_DATE('13/2/1981', 'DD/MM/YYYY'), 'Rio Seco', 'Calle K', '1700', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000054');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (55, '21234567', 'Andres', 'Mamani', 'Condori', 'M', TO_DATE('27/4/1972', 'DD/MM/YYYY'), 'Alto Lima', 'Av. Montes', '480', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000055');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (56, '22345678', 'Viviana', 'Flores', 'Ramos', 'F', TO_DATE('09/08/2000', 'DD/MM/YYYY'), 'Villa Adela', 'Calle L', '1400', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000056');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (57, '23456789', 'Jorge', 'Gutierrez', 'Vargas', 'M', TO_DATE('21/10/1987', 'DD/MM/YYYY'), '16 de Julio', 'Calle Murillo', '2000', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000057');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (58, '24567890', 'Laura', 'Perez', 'Lopez', 'F', TO_DATE('05/12/1975', 'DD/MM/YYYY'), 'Ciudad Satélite', 'Av. 6 de Agosto', '750', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000058');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (59, '25678901', 'Oscar', 'Quispe', 'Mamani', 'M', TO_DATE('18/2/1996', 'DD/MM/YYYY'), 'Senkata', 'Calle M', '2500', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000059');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (60, '26789012', 'Pamela', 'Condori', 'Flores', 'F', TO_DATE('01/04/1984', 'DD/MM/YYYY'), 'Villa Dolores', 'Av. Illampu', '900', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000060');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (61, '30001000', 'Sofia', 'Quispe', 'Mamani', 'F', TO_DATE('10/05/2008', 'DD/MM/YYYY'), 'Villa Adela', 'Calle 2', '350', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000061');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (62, '30001001', 'Juan', 'Choque', 'Quispe', 'M', TO_DATE('20/1/2009', 'DD/MM/YYYY'), '16 de Julio', 'Av. Juan Pablo II', '1200', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000062');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (63, '30001002', 'Valeria', 'Mamani', 'Condori', 'F', TO_DATE('05/03/2010', 'DD/MM/YYYY'), 'Ciudad Satélite', 'Calle 6', '780', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000063');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (64, '30001003', 'Andres', 'Flores', 'Ramos', 'M', TO_DATE('15/11/2007', 'DD/MM/YYYY'), 'Senkata', 'Av. Litoral', '210', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000064');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (65, '30001004', 'Daniela', 'Condori', 'Flores', 'F', TO_DATE('28/8/2008', 'DD/MM/YYYY'), 'Villa Dolores', 'Calle 10', '990', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000065');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (66, '30001005', 'Jose', 'Ramos', 'Gutierrez', 'M', TO_DATE('01/06/2009', 'DD/MM/YYYY'), 'Rio Seco', 'Av. del Policía', '550', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000066');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (67, '30001006', 'Ana', 'Vargas', 'Perez', 'F', TO_DATE('12/02/2010', 'DD/MM/YYYY'), 'Alto Lima', 'Calle Oruro', '180', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000067');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (68, '30001007', 'Carlos', 'Lopez', 'Quispe', 'M', TO_DATE('03/04/2008', 'DD/MM/YYYY'), 'Villa Adela', 'Av. Héroes', '1400', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000068');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (69, '30001008', 'Patricia', 'Mamani', 'Condori', 'F', TO_DATE('18/10/2009', 'DD/MM/YYYY'), '16 de Julio', 'Calle G', '620', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000069');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (70, '30001009', 'David', 'Flores', 'Ramos', 'M', TO_DATE('22/4/2010', 'DD/MM/YYYY'), 'Ciudad Satélite', 'Av. Costanera', '310', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000070');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (71, '30001010', 'Gabriela', 'Gutierrez', 'Vargas', 'F', TO_DATE('01/12/2007', 'DD/MM/YYYY'), 'Senkata', 'Calle Potosí', '1600', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000071');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (72, '30001011', 'Fernando', 'Perez', 'Lopez', 'M', TO_DATE('14/6/2008', 'DD/MM/YYYY'), 'Villa Dolores', 'Av. Pando', '870', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000072');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (73, '30001012', 'Susana', 'Quispe', 'Mamani', 'F', TO_DATE('25/3/2009', 'DD/MM/YYYY'), 'Rio Seco', 'Calle Murillo', '230', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000073');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (74, '30001013', 'Roberto', 'Condori', 'Flores', 'M', TO_DATE('08/01/2010', 'DD/MM/YYYY'), 'Alto Lima', 'Av. Chacaltaya', '490', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000074');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (75, '30001014', 'Alejandra', 'Ramos', 'Gutierrez', 'F', TO_DATE('01/09/2008', 'DD/MM/YYYY'), 'Villa Adela', 'Calle I', '1150', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000075');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (76, '30001015', 'Daniel', 'Vargas', 'Perez', 'M', TO_DATE('19/5/2009', 'DD/MM/YYYY'), '16 de Julio', 'Av. Satélite', '700', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000076');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (77, '30001016', 'Valeria', 'Lopez', 'Quispe', 'F', TO_DATE('30/3/2010', 'DD/MM/YYYY'), 'Ciudad Satélite', 'Calle Aroma', '400', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000077');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (78, '30001017', 'Esteban', 'Mamani', 'Condori', 'M', TO_DATE('25/10/2007', 'DD/MM/YYYY'), 'Senkata', 'Av. 6 de Agosto', '1950', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000078');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (79, '30001018', 'Natalia', 'Flores', 'Ramos', 'F', TO_DATE('07/07/2008', 'DD/MM/YYYY'), 'Villa Dolores', 'Calle L', '920', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000079');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (80, '30001019', 'Ricardo', 'Gutierrez', 'Vargas', 'M', TO_DATE('14/2/2009', 'DD/MM/YYYY'), 'Rio Seco', 'Av. Illampu', '670', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000080');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (81, '30001020', 'Miguel', 'Chavez', 'Soto', 'M', TO_DATE('15/3/1985', 'DD/MM/YYYY'), 'Miraflores', 'Av. Busch', '1234', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000081');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (82, '30001021', 'Laura', 'Romero', 'Aguilar', 'F', TO_DATE('22/7/1992', 'DD/MM/YYYY'), 'Sopocachi', 'Calle Sagarnaga', '567', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000082');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (83, '30001022', 'Carlos', 'Fuentes', 'Paz', 'M', TO_DATE('01/11/1978', 'DD/MM/YYYY'), 'Calacoto', 'Av. Montenegro', '890', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000083');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (84, '30001023', 'Ana', 'Salazar', 'Rojas', 'F', TO_DATE('10/04/2000', 'DD/MM/YYYY'), 'Villa Dolores', 'Calle 8', '234', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000084');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (85, '30001024', 'Jose', 'Herrera', 'Vera', 'M', TO_DATE('05/09/1971', 'DD/MM/YYYY'), 'Rio Seco', 'Av. Litoral', '1678', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000085');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (86, '30001025', 'Maria', 'Nuñez', 'Castillo', 'F', TO_DATE('19/2/1995', 'DD/MM/YYYY'), 'Alto Lima', 'Calle Sucre', '345', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000086');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (87, '30001026', 'Juan', 'Espinosa', 'Soliz', 'M', TO_DATE('28/6/1989', 'DD/MM/YYYY'), '16 de Julio', 'Calle Potosí', '1345', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000087');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (88, '30001027', 'Daniela', 'Guerrero', 'Duran', 'F', TO_DATE('03/12/1982', 'DD/MM/YYYY'), 'Ciudad Satélite', 'Av. Satélite', '567', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000088');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (89, '30001028', 'Fernando', 'Mendieta', 'Parra', 'M', TO_DATE('14/1/1976', 'DD/MM/YYYY'), 'Senkata', 'Calle E', '1900', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000089');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (90, '30001029', 'Sofia', 'Vargas', 'Peña', 'F', TO_DATE('08/08/2005', 'DD/MM/YYYY'), 'Villa Adela', 'Calle D', '980', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000090');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (91, '30001030', 'Ricardo', 'Suarez', 'Rivera', 'M', TO_DATE('20/5/1998', 'DD/MM/YYYY'), 'Achumani', 'Calle Goitia', '378', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000091');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (92, '30001031', 'Isabel', 'Molina', 'Flores', 'F', TO_DATE('11/10/1973', 'DD/MM/YYYY'), 'San Miguel', 'Av. 6 de Agosto', '876', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000092');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (93, '30001032', 'Andres', 'Paredes', 'Miranda', 'M', TO_DATE('25/3/1980', 'DD/MM/YYYY'), 'Obrajes', 'Calle Illampu', '721', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000093');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (94, '30001033', 'Carla', 'Rios', 'Cardenas', 'F', TO_DATE('06/07/1990', 'DD/MM/YYYY'), 'Rincón Portada', 'Bella Vista', '2200', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000094');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (95, '30001034', 'Gabriel', 'Morales', 'Quiroga', 'M', TO_DATE('17/4/2003', 'DD/MM/YYYY'), 'Irpavi', 'Av. Montenegro', '4800', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000095');
INSERT INTO persona (id_persona, ci, nombre, paterno, materno, genero, f_nacimiento, zona, calle, nro, f_creacion, f_edicion, celular) VALUES (96, '30001036', 'Sebasatian', 'Herrera', 'Medina', 'M', TO_DATE('17/4/2003', 'DD/MM/YYYY'), 'Irpavi', 'Av. Montenegro', '4801', TO_DATE('22/10/2025', 'DD/MM/YYYY'), TO_DATE('22/10/2025', 'DD/MM/YYYY'), '70000096');

commit;

--* Rol
INSERT INTO rol (id_rol, tipo) VALUES (1, 'administrador');
INSERT INTO rol (id_rol, tipo) VALUES (2, 'secretario');
INSERT INTO rol (id_rol, tipo) VALUES (3, 'coordinador');

commit;

--* Nivel de Educacion
INSERT INTO nivel_educacion (id_nvl_edu, tipo) VALUES (1, 'Licenciatura');
INSERT INTO nivel_educacion (id_nvl_edu, tipo) VALUES (2, 'Maestría');
INSERT INTO nivel_educacion (id_nvl_edu, tipo) VALUES (3, 'Doctorado');
INSERT INTO nivel_educacion (id_nvl_edu, tipo) VALUES (4, 'Educación Primaria');
INSERT INTO nivel_educacion (id_nvl_edu, tipo) VALUES (5, 'Educación Secudaria');
INSERT INTO nivel_educacion (id_nvl_edu, tipo) VALUES (6, 'Bachillerato');
INSERT INTO nivel_educacion (id_nvl_edu, tipo) VALUES (7, 'Técnico Superior');
INSERT INTO nivel_educacion (id_nvl_edu, tipo) VALUES (8, 'Técnico Medio');
INSERT INTO nivel_educacion (id_nvl_edu, tipo) VALUES (9, 'Ingeniería');

commit;

--* tutor
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (1, 50, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (2, 54, 'Madre');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (3, 55, 'Tío');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (4, 56, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (5, 51, 'Padre');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (6, 52, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (7, 53, 'Padre');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (8, 54, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (9, 55, 'Tío');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (10, 56, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (11, 57, 'Padre');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (12, 58, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (13, 50, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (14, 51, 'Padre');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (15, 52, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (16, 53, 'Padre');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (17, 54, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (18, 55, 'Tío');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (19, 56, 'Tía');
INSERT INTO tutor (id_tutor, id_persona, parentesco) VALUES (20, 57, 'Tío');

commit;

--* Usuario
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (1, 1, 1, 'ruben.alejo@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (2, 2, 2, 'maria.gomez@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (3, 3, 3, 'carlos.ruiz@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (4, 4, 3, 'elena.morales@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (5, 5, 3, 'sofia.alvarez@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (6, 6, 3, 'diego.flores@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (7, 7, 3, 'maria.sanz@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (8, 8, 3, 'daniela.perez@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (9, 9, 2, 'isabel.rojas@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (10, 10, 3, 'pedro.vargas@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (11, 11, 3, 'miguel.diaz@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (12, 12, 3, 'daniela.castillo@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (13, 13, 3, 'valeria.mendoza@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (14, 14, 3, 'ana.mendoza@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (15, 15, 2, 'javier.torres@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (16, 16, 3, 'ana.lopez@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (17, 17, 3, 'javier.diaz@example.com', 'pass123', 'inactivo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (18, 18, 3, 'ricardo.rivera@example.com', 'pass123', 'inactivo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (19, 19, 3, 'javier.morales@example.com', 'pass123', 'inactivo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));
INSERT INTO usuario (id_usuario, id_persona, id_rol, email, contrasenia, estado, f_creacion, f_edicion) VALUES (20, 20, 2, 'pedro.ortega@example.com', 'pass123', 'activo', TO_DATE('20/10/2025', 'DD/MM/YYYY'), TO_DATE('20/10/2025', 'DD/MM/YYYY'));

commit;

--* Voluntario
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (1, 21, 'valeria.ortega@example.com', 1);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (2, 22, 'pedro.castillo@example.com', 9);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (3, 23, 'valeria.morales@example.com', 2);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (4, 24, 'miguel.ortega@example.com', 7);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (5, 25, 'laura.diaz@example.com', 1);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (6, 26, 'fernando.vargas@example.com', 9);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (7, 27, 'sofia.rivera@example.com', 2);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (8, 28, 'sofia.perez@example.com', 7);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (9, 29, 'laura.morales@example.com', 1);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (10, 30, 'ricardo.rivera@example.com', 9);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (11, 81, 'miguel.chavez@example.com', 1);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (12, 82, 'laura.romero@example.com', 9);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (13, 83, 'carlos.fuentes@example.com', 7);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (14, 84, 'ana.salazar@example.com', 3);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (15, 85, 'jose.herrera@example.com', 2);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (16, 86, 'maria.nuñez@example.com', 1);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (17, 87, 'juan.espinosa@example.com', 9);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (18, 88, 'daniela.guerrero@example.com', 7);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (19, 89, 'fernando.mendieta@example.com', 3);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (20, 90, 'sofia.vargas@example.com', 2);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (21, 91, 'ricardo.suarez@example.com', 1);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (22, 92, 'isabel.molina@example.com', 9);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (23, 93, 'andres.paredes@example.com', 7);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (24, 94, 'carla.rios@example.com', 3);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (25, 95, 'gabriel.morales@example.com', 2);
INSERT INTO voluntario (id_voluntario, id_persona, correo, id_nvl_edu) VALUES (26, 96, 'sebasatian.herrera@example.com', 1);

commit;

--* Participante
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (1, 61, 'PART-000001', 'activo', 1);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (2, 62, 'PART-000002', 'inactivo', 2);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (3, 63, 'PART-000003', 'activo', 3);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (4, 64, 'PART-000004', 'activo', 4);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (5, 65, 'PART-000005', 'inactivo', 5);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (6, 66, 'PART-000006', 'activo', 6);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (7, 67, 'PART-000007', 'activo', 7);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (8, 68, 'PART-000008', 'inactivo', 8);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (9, 69, 'PART-000009', 'activo', 9);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (10, 70, 'PART-000010', 'inactivo', 10);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (11, 71, 'PART-000011', 'activo', 11);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (12, 72, 'PART-000012', 'activo', 12);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (13, 73, 'PART-000013', 'inactivo', 13);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (14, 74, 'PART-000014', 'activo', 14);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (15, 75, 'PART-000015', 'inactivo', 15);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (16, 76, 'PART-000016', 'activo', 16);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (17, 77, 'PART-000017', 'activo', 17);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (18, 78, 'PART-000018', 'inactivo', 18);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (19, 79, 'PART-000019', 'activo', 19);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (20, 80, 'PART-000020', 'inactivo', 20);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (21, 31, 'PART-000021', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (22, 32, 'PART-000022', 'inactivo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (23, 33, 'PART-000023', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (24, 34, 'PART-000024', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (25, 35, 'PART-000025', 'inactivo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (26, 36, 'PART-000026', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (27, 37, 'PART-000027', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (28, 38, 'PART-000028', 'inactivo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (29, 39, 'PART-000029', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (30, 40, 'PART-000030', 'inactivo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (31, 41, 'PART-000031', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (32, 42, 'PART-000032', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (33, 43, 'PART-000033', 'inactivo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (34, 44, 'PART-000034', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (35, 45, 'PART-000035', 'inactivo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (36, 46, 'PART-000036', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (37, 47, 'PART-000037', 'activo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (38, 48, 'PART-000038', 'inactivo', NULL);
INSERT INTO participante (id_participante, id_persona, matricula, estado, id_tutor) VALUES (39, 49, 'PART-000039', 'activo', NULL);

commit;

--* Curso-Taller
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (1,  'https://wa.me/CUR-2022-A', 1);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (2,  'https://wa.me/CUR-2022-B', 2);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (3,  'https://wa.me/CUR-2023-A', 3);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (4,  'https://wa.me/CUR-2023-B', 4);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (5,  'https://wa.me/CUR-2023-C', 5);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (6,  'https://wa.me/CUR-2024-A', 6);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (7,  'https://wa.me/CUR-2024-B', 7);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (8,  'https://wa.me/CUR-2024-C', 8);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (9,  'https://wa.me/CUR-2025-A', 9);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (10, 'https://wa.me/CUR-2025-B', 10);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (11, 'https://wa.me/TALL-2022-A', 11);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (12, 'https://wa.me/TALL-2022-B', 12);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (13, 'https://wa.me/TALL-2023-A', 13);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (14, 'https://wa.me/TALL-2023-B', 14);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (15, 'https://wa.me/TALL-2023-C', 15);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (16, 'https://wa.me/TALL-2024-A', 16);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (17, 'https://wa.me/TALL-2024-B', 17);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (18, 'https://wa.me/TALL-2024-C', 18);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (19, 'https://wa.me/TALL-2025-A', 19);
INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (20, 'https://wa.me/TALL-2025-B', 20);

COMMIT;

--* Servicio
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (21, 'Atención Psicológica', 'Inactivo');
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (22, 'Orientación Educativa', 'Inactivo');
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (23, 'Acompañamiento Espiritual', 'Inactivo');
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (24, 'Asistencia Social', 'Inactivo');
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (25, 'Asistencia Social', 'Inactivo');
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (26, 'Atención Psicológica', 'Inactivo');
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (27, 'Educativo', 'Inactivo');
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (28, 'Salud Mental', 'Inactivo');
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (29, 'Asesoría Legal', 'Inactivo');
INSERT INTO servicio (id_actividad, tipo, estado) VALUES (30, 'Voluntariado', 'Inactivo');

COMMIT;

--* Voluntario Servicio
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (1, 2);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (1, 8);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (1, 12);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (1, 13);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (1, 19);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (1, 24);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (1, 26);

INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (2, 1);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (2, 2);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (2, 7);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (2, 9);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (2, 11);

INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (3, 1);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (3, 4);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (3, 5);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (3, 6);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (3, 17);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (3, 20);

INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (4, 3);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (4, 10);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (4, 12);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (4, 14);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (4, 21);

INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (5, 5);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (5, 6);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (5, 8);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (5, 15);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (5, 18);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (5, 23);

INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (6, 1);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (6, 7);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (6, 10);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (6, 13);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (6, 16);

INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (7, 22);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (7, 2);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (7, 9);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (7, 11);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (7, 17);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (7, 25);

INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (8, 3);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (8, 4);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (8, 12);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (8, 14);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (8, 21);

INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (9, 1);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (9, 5);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (9, 8);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (9, 13);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (9, 19);

INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (10, 2);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (10, 6);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (10, 9);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (10, 15);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (10, 18);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (10, 20);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (10, 22);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (10, 24);
INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (10, 26);

COMMIT;

--* Participante - Curso-Taller
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (1, 1);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (1, 8);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (1, 15);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (1, 21);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (1, 29);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (1, 38);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (2, 1);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (2, 2);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (2, 22);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (2, 7);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (2, 20);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (3, 3);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (3, 10);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (3, 23);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (3, 28);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (3, 34);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (4, 4);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (4, 11);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (4, 24);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (4, 30);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (5, 5);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (5, 12);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (5, 25);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (5, 33);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (6, 6);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (6, 13);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (6, 26);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (6, 32);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (6, 36);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (7, 7);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (7, 14);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (7, 27);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (7, 31);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (8, 1);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (8, 8);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (8, 16);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (8, 21);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (8, 28);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (9, 9);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (9, 17);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (9, 29);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (9, 35);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (10, 10);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (10, 18);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (10, 30);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (10, 37);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (11, 11);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (11, 19);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (11, 31);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (11, 39);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (12, 12);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (12, 20);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (12, 32);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (12, 34);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (13, 13);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (13, 33);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (13, 36);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (14, 14);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (14, 21);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (14, 34);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (14, 38);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (15, 15);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (15, 22);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (15, 35);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (16, 16);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (16, 24);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (16, 36);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (16, 39);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (17, 17);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (17, 25);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (17, 27);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (17, 37);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (17, 38);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (18, 18);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (18, 26);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (18, 32);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (18, 38);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (19, 13);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (19, 14);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (19, 18);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (19, 19);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (19, 39);

INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (20, 1);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (20, 20);
INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (20, 35);

COMMIT;

--* Aporte
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (1, 430, 'Aporte voluntario', TO_DATE('2022-02-21','YYYY-MM-DD'), TO_DATE('2023-07-18','YYYY-MM-DD'), 1);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (2, 370, 'Aporte voluntario', TO_DATE('2022-07-29','YYYY-MM-DD'), TO_DATE('2025-10-17','YYYY-MM-DD'), 2);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (3, 450, 'Colaboración económica', TO_DATE('2024-05-14','YYYY-MM-DD'), TO_DATE('2022-03-07','YYYY-MM-DD'), 3);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (4, 260, 'Aporte voluntario', TO_DATE('2023-04-22','YYYY-MM-DD'), TO_DATE('2024-10-31','YYYY-MM-DD'), 4);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (5, 330, 'Colaboración económica', TO_DATE('2023-02-12','YYYY-MM-DD'), TO_DATE('2025-08-23','YYYY-MM-DD'), 5);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (6, 120, 'Aporte voluntario', TO_DATE('2023-05-17','YYYY-MM-DD'), TO_DATE('2024-05-08','YYYY-MM-DD'), 6);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (7, 280, 'Colaboración económica', TO_DATE('2023-02-18','YYYY-MM-DD'), TO_DATE('2025-05-05','YYYY-MM-DD'), 7);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (8, 130, 'Donación para CCDB', TO_DATE('2023-08-23','YYYY-MM-DD'), TO_DATE('2024-11-09','YYYY-MM-DD'), 8);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (9, 270, 'Aporte voluntario', TO_DATE('2022-05-17','YYYY-MM-DD'), TO_DATE('2023-05-11','YYYY-MM-DD'), 9);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (10, 270, 'Colaboración económica', TO_DATE('2023-05-29','YYYY-MM-DD'), TO_DATE('2022-12-03','YYYY-MM-DD'), 10);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (11, 200, 'Aporte voluntario', TO_DATE('2023-01-06','YYYY-MM-DD'), TO_DATE('2025-06-19','YYYY-MM-DD'), 11);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (12, 160, 'Aporte voluntario', TO_DATE('2023-07-15','YYYY-MM-DD'), TO_DATE('2023-03-20','YYYY-MM-DD'), 12);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (13, 220, 'Colaboración económica', TO_DATE('2022-02-18','YYYY-MM-DD'), TO_DATE('2025-01-28','YYYY-MM-DD'), 13);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (14, 350, 'Aporte voluntario', TO_DATE('2023-03-06','YYYY-MM-DD'), TO_DATE('2025-06-17','YYYY-MM-DD'), 14);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (15, 240, 'Donación para CCDB', TO_DATE('2022-05-10','YYYY-MM-DD'), TO_DATE('2024-04-12','YYYY-MM-DD'), 15);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (16, 300, 'Colaboración económica', TO_DATE('2023-12-27','YYYY-MM-DD'), TO_DATE('2023-06-26','YYYY-MM-DD'), 16);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (17, 270, 'Colaboración económica', TO_DATE('2024-10-20','YYYY-MM-DD'), TO_DATE('2024-08-22','YYYY-MM-DD'), 17);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (18, 260, 'Aporte voluntario', TO_DATE('2024-08-17','YYYY-MM-DD'), TO_DATE('2022-10-06','YYYY-MM-DD'), 18);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (19, 420, 'Donación para CCDB', TO_DATE('2024-08-15','YYYY-MM-DD'), TO_DATE('2024-05-28','YYYY-MM-DD'), 19);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (20, 320, 'Colaboración económica', TO_DATE('2024-08-23','YYYY-MM-DD'), TO_DATE('2022-08-02','YYYY-MM-DD'), 20);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (21, 150, 'Aporte voluntario', TO_DATE('2022-04-05','YYYY-MM-DD'), TO_DATE('2025-08-05','YYYY-MM-DD'), 9);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (22, 400, 'Aporte voluntario', TO_DATE('2023-05-03','YYYY-MM-DD'), TO_DATE('2022-12-18','YYYY-MM-DD'), 3);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (23, 180, 'Colaboración económica', TO_DATE('2022-07-28','YYYY-MM-DD'), TO_DATE('2023-09-21','YYYY-MM-DD'), 1);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (24, 250, 'Aporte voluntario', TO_DATE('2022-11-19','YYYY-MM-DD'), TO_DATE('2022-03-12','YYYY-MM-DD'), 6);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (25, 200, 'Donación para CCDB', TO_DATE('2022-12-05','YYYY-MM-DD'), TO_DATE('2025-01-30','YYYY-MM-DD'), 1);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (26, 310, 'Aporte voluntario', TO_DATE('2023-05-21','YYYY-MM-DD'), TO_DATE('2023-10-25','YYYY-MM-DD'), 2);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (27, 280, 'Colaboración económica', TO_DATE('2023-07-17','YYYY-MM-DD'), TO_DATE('2022-05-27','YYYY-MM-DD'), 14);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (28, 360, 'Aporte voluntario', TO_DATE('2022-05-22','YYYY-MM-DD'), TO_DATE('2022-10-22','YYYY-MM-DD'), 2);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (29, 140, 'Colaboración económica', TO_DATE('2023-09-14','YYYY-MM-DD'), TO_DATE('2023-09-27','YYYY-MM-DD'), 4);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (30, 230, 'Aporte voluntario', TO_DATE('2022-05-20','YYYY-MM-DD'), TO_DATE('2022-08-19','YYYY-MM-DD'), 5);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (31, 370, 'Colaboración económica', TO_DATE('2023-01-22','YYYY-MM-DD'), TO_DATE('2025-03-01','YYYY-MM-DD'), 1);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (32, 220, 'Aporte voluntario', TO_DATE('2023-05-23','YYYY-MM-DD'), TO_DATE('2025-03-16','YYYY-MM-DD'), 8);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (33, 340, 'Donación para CCDB', TO_DATE('2023-11-04','YYYY-MM-DD'), TO_DATE('2023-08-01','YYYY-MM-DD'), 2);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (34, 290, 'Colaboración económica', TO_DATE('2022-10-22','YYYY-MM-DD'), TO_DATE('2023-09-02','YYYY-MM-DD'), 12);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (35, 310, 'Aporte voluntario', TO_DATE('2023-08-03','YYYY-MM-DD'), TO_DATE('2025-08-14','YYYY-MM-DD'), 7);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (36, 270, 'Donación para CCDB', TO_DATE('2023-05-28','YYYY-MM-DD'), TO_DATE('2024-09-08','YYYY-MM-DD'), 9);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (37, 200, 'Aporte voluntario', TO_DATE('2024-04-12','YYYY-MM-DD'), TO_DATE('2024-01-02','YYYY-MM-DD'), 18);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (38, 260, 'Colaboración económica', TO_DATE('2022-07-24','YYYY-MM-DD'), TO_DATE('2022-12-18','YYYY-MM-DD'), 6);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (39, 330, 'Aporte voluntario', TO_DATE('2023-03-05','YYYY-MM-DD'), TO_DATE('2023-12-11','YYYY-MM-DD'), 20);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (40, 210, 'Colaboración económica', TO_DATE('2022-07-24','YYYY-MM-DD'), TO_DATE('2023-07-25','YYYY-MM-DD'), 20);

INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (41, 380, 'Aporte voluntario', TO_DATE('2023-05-28','YYYY-MM-DD'), TO_DATE('2024-12-18','YYYY-MM-DD'), 5);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (42, 300, 'Aporte voluntario', TO_DATE('2023-03-11','YYYY-MM-DD'), TO_DATE('2025-04-15','YYYY-MM-DD'), 10);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (43, 340, 'Colaboración económica', TO_DATE('2023-07-27','YYYY-MM-DD'), TO_DATE('2024-12-27','YYYY-MM-DD'), 11);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (44, 290, 'Donación para CCDB', TO_DATE('2022-08-04','YYYY-MM-DD'), TO_DATE('2025-07-06','YYYY-MM-DD'), 15);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (45, 310, 'Aporte voluntario', TO_DATE('2023-01-25','YYYY-MM-DD'), TO_DATE('2025-01-19','YYYY-MM-DD'), 13);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (46, 270, 'Colaboración económica', TO_DATE('2022-04-03','YYYY-MM-DD'), TO_DATE('2023-06-16','YYYY-MM-DD'), 17);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (47, 200, 'Aporte voluntario', TO_DATE('2022-12-22','YYYY-MM-DD'), TO_DATE('2024-09-23','YYYY-MM-DD'), 16);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (48, 260, 'Donación para CCDB', TO_DATE('2022-06-07','YYYY-MM-DD'), TO_DATE('2024-04-25','YYYY-MM-DD'), 19);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (49, 330, 'Aporte voluntario', TO_DATE('2024-07-05','YYYY-MM-DD'), TO_DATE('2023-07-21','YYYY-MM-DD'), 3);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (50, 210, 'Colaboración económica', TO_DATE('2024-01-22','YYYY-MM-DD'), TO_DATE('2023-01-19','YYYY-MM-DD'), 8);

INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (51, 380, 'Aporte voluntario', TO_DATE('2023-08-11','YYYY-MM-DD'), TO_DATE('2025-03-07','YYYY-MM-DD'), 12);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (52, 430, 'Aporte voluntario', TO_DATE('2024-03-28','YYYY-MM-DD'), TO_DATE('2022-09-25','YYYY-MM-DD'), 14);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (53, 370, 'Colaboración económica', TO_DATE('2024-06-15','YYYY-MM-DD'), TO_DATE('2023-12-03','YYYY-MM-DD'), 6);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (54, 450, 'Aporte voluntario', TO_DATE('2022-05-18','YYYY-MM-DD'), TO_DATE('2023-01-21','YYYY-MM-DD'), 7);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (55, 260, 'Donación para CCDB', TO_DATE('2024-01-11','YYYY-MM-DD'), TO_DATE('2023-08-18','YYYY-MM-DD'), 2);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (56, 330, 'Aporte voluntario', TO_DATE('2023-02-11','YYYY-MM-DD'), TO_DATE('2025-04-03','YYYY-MM-DD'), 9);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (57, 120, 'Colaboración económica', TO_DATE('2024-04-16','YYYY-MM-DD'), TO_DATE('2024-12-30','YYYY-MM-DD'), 5);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (58, 280, 'Aporte voluntario', TO_DATE('2024-05-16','YYYY-MM-DD'), TO_DATE('2023-12-09','YYYY-MM-DD'), 4);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (59, 130, 'Colaboración económica', TO_DATE('2023-09-21','YYYY-MM-DD'), TO_DATE('2023-05-26','YYYY-MM-DD'), 11);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (60, 270, 'Aporte voluntario', TO_DATE('2023-12-01','YYYY-MM-DD'), TO_DATE('2022-09-05','YYYY-MM-DD'), 1);

INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (61, 270, 'Donación para CCDB', TO_DATE('2023-12-17','YYYY-MM-DD'), TO_DATE('2023-12-30','YYYY-MM-DD'), 20);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (62, 200, 'Aporte voluntario', TO_DATE('2022-10-13','YYYY-MM-DD'), TO_DATE('2025-01-15','YYYY-MM-DD'), 18);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (63, 160, 'Colaboración económica', TO_DATE('2022-04-05','YYYY-MM-DD'), TO_DATE('2023-12-25','YYYY-MM-DD'), 6);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (64, 220, 'Aporte voluntario', TO_DATE('2024-08-04','YYYY-MM-DD'), TO_DATE('2024-09-11','YYYY-MM-DD'), 20);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (65, 350, 'Donación para CCDB', TO_DATE('2023-08-10','YYYY-MM-DD'), TO_DATE('2024-01-01','YYYY-MM-DD'), 20);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (66, 240, 'Aporte voluntario', TO_DATE('2024-03-16','YYYY-MM-DD'), TO_DATE('2023-07-19','YYYY-MM-DD'), 5);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (67, 300, 'Colaboración económica', TO_DATE('2022-11-21','YYYY-MM-DD'), TO_DATE('2025-09-02','YYYY-MM-DD'), 10);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (68, 270, 'Aporte voluntario', TO_DATE('2022-10-21','YYYY-MM-DD'), TO_DATE('2023-10-30','YYYY-MM-DD'), 11);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (69, 260, 'Aporte voluntario', TO_DATE('2022-09-11','YYYY-MM-DD'), TO_DATE('2024-02-12','YYYY-MM-DD'), 15);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (70, 420, 'Colaboración económica', TO_DATE('2022-09-01','YYYY-MM-DD'), TO_DATE('2024-01-27','YYYY-MM-DD'), 13);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (71, 320, 'Aporte voluntario', TO_DATE('2023-01-27','YYYY-MM-DD'), TO_DATE('2025-07-23','YYYY-MM-DD'), 17);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (72, 380, 'Donación para CCDB', TO_DATE('2023-08-07','YYYY-MM-DD'), TO_DATE('2023-10-07','YYYY-MM-DD'), 16);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (73, 430, 'Aporte voluntario', TO_DATE('2023-02-05','YYYY-MM-DD'), TO_DATE('2023-12-01','YYYY-MM-DD'), 19);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (74, 370, 'Colaboración económica', TO_DATE('2023-08-15','YYYY-MM-DD'), TO_DATE('2024-04-19','YYYY-MM-DD'), 3);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (75, 450, 'Aporte voluntario', TO_DATE('2023-03-06','YYYY-MM-DD'), TO_DATE('2023-06-29','YYYY-MM-DD'), 8);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (76, 260, 'Donación para CCDB', TO_DATE('2024-03-21','YYYY-MM-DD'), TO_DATE('2023-07-12','YYYY-MM-DD'), 12);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (77, 330, 'Aporte voluntario', TO_DATE('2024-02-05','YYYY-MM-DD'), TO_DATE('2024-10-05','YYYY-MM-DD'), 18);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (78, 120, 'Colaboración económica', TO_DATE('2023-01-19','YYYY-MM-DD'), TO_DATE('2025-03-15','YYYY-MM-DD'), 19);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (79, 280, 'Aporte voluntario', TO_DATE('2024-01-05','YYYY-MM-DD'), TO_DATE('2023-08-22','YYYY-MM-DD'), 20);
INSERT INTO aporte (id_aporte, monto_total, descripcion, f_creacion, f_edicion, id_participante) VALUES (80, 300, 'Colaboración económica', TO_DATE('2022-03-02','YYYY-MM-DD'), TO_DATE('2023-05-18','YYYY-MM-DD'), 9);

COMMIT;

--* Historico de aportes
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (1, 1, TO_DATE('2022-03-15','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (2, 2, TO_DATE('2022-05-10','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (3, 3, TO_DATE('2022-08-21','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (4, 4, TO_DATE('2022-11-03','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (5, 5, TO_DATE('2023-01-18','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (6, 6, TO_DATE('2023-04-05','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (7, 7, TO_DATE('2023-06-30','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (8, 8, TO_DATE('2023-09-14','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (9, 9, TO_DATE('2023-11-25','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (10, 10, TO_DATE('2024-02-07','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (11, 11, TO_DATE('2024-04-19','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (12, 12, TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (13, 13, TO_DATE('2024-09-12','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (14, 14, TO_DATE('2024-11-24','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (15, 15, TO_DATE('2025-02-05','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (16, 16, TO_DATE('2025-04-18','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (17, 17, TO_DATE('2025-06-29','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (18, 18, TO_DATE('2025-09-11','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (19, 19, TO_DATE('2025-11-22','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (20, 20, TO_DATE('2025-12-30','YYYY-MM-DD'));

INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (1, 21, TO_DATE('2022-04-10','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (2, 22, TO_DATE('2022-06-15','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (3, 23, TO_DATE('2022-09-20','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (4, 24, TO_DATE('2022-12-05','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (5, 25, TO_DATE('2023-02-15','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (6, 26, TO_DATE('2023-05-10','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (7, 27, TO_DATE('2023-07-25','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (8, 28, TO_DATE('2023-10-01','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (9, 29, TO_DATE('2023-12-15','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (10, 30, TO_DATE('2024-03-05','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (11, 31, TO_DATE('2024-05-20','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (12, 32, TO_DATE('2024-08-10','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (13, 33, TO_DATE('2024-10-25','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (14, 34, TO_DATE('2024-12-30','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (15, 35, TO_DATE('2025-02-20','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (16, 36, TO_DATE('2025-05-05','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (17, 37, TO_DATE('2025-07-20','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (18, 38, TO_DATE('2025-09-30','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (19, 39, TO_DATE('2025-11-15','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (20, 40, TO_DATE('2025-12-28','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (1, 41, TO_DATE('2022-05-05','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (2, 42, TO_DATE('2022-07-18','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (3, 43, TO_DATE('2022-10-02','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (4, 44, TO_DATE('2022-12-20','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (5, 45, TO_DATE('2023-03-12','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (6, 46, TO_DATE('2023-05-25','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (7, 47, TO_DATE('2023-08-08','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (8, 48, TO_DATE('2023-10-22','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (9, 49, TO_DATE('2023-12-30','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (10, 50, TO_DATE('2024-03-18','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (11, 51, TO_DATE('2024-06-01','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (12, 52, TO_DATE('2024-08-15','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (13, 53, TO_DATE('2024-10-30','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (14, 54, TO_DATE('2024-12-31','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (15, 55, TO_DATE('2025-03-10','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (16, 56, TO_DATE('2025-05-25','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (17, 57, TO_DATE('2025-08-05','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (18, 58, TO_DATE('2025-10-15','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (19, 59, TO_DATE('2025-11-30','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (20, 60, TO_DATE('2025-12-25','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (1, 61, TO_DATE('2023-01-10','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (2, 62, TO_DATE('2023-03-22','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (3, 63, TO_DATE('2023-05-15','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (4, 64, TO_DATE('2023-07-28','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (5, 65, TO_DATE('2023-09-12','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (6, 66, TO_DATE('2023-11-05','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (7, 67, TO_DATE('2024-01-18','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (8, 68, TO_DATE('2024-03-30','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (9, 69, TO_DATE('2024-06-12','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (10, 70, TO_DATE('2024-08-25','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (11, 71, TO_DATE('2024-10-07','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (12, 72, TO_DATE('2024-12-19','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (13, 73, TO_DATE('2025-02-02','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (14, 74, TO_DATE('2025-04-15','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (15, 75, TO_DATE('2025-06-27','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (16, 76, TO_DATE('2025-09-08','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (17, 77, TO_DATE('2025-11-20','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (18, 78, TO_DATE('2025-12-30','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (19, 79, TO_DATE('2025-10-12','YYYY-MM-DD'));
INSERT INTO registro_historico_aporte (id_usuario, id_aporte, fecha) VALUES (20, 80, TO_DATE('2025-08-25','YYYY-MM-DD'));

COMMIT;

--* Registro de personas
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 2, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 3, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 4, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 5, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 6, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 7, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 8, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 9, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 10, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 11, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 12, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 13, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 14, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 15, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 16, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 17, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 18, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 19, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 20, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 21, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 22, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 23, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 24, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 25, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 26, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 27, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 28, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 29, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 30, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 31, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 32, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 33, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 34, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 35, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 36, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 37, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 38, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 39, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 40, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 41, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 42, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 43, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 44, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 45, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 46, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 47, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 48, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 49, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 50, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 51, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 52, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 53, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 54, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 55, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 56, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 57, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 58, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 59, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 60, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 61, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 62, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 63, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 64, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 65, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 66, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 67, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 68, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 69, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 70, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 71, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 72, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 73, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 74, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 75, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 76, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (2, 77, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (9, 78, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (15, 79, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (20, 80, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 81, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 82, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 83, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 84, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 85, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 86, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 87, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 88, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 89, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 90, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 91, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 92, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 93, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 94, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 95, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');
INSERT INTO registro_historico_persona (id_usuario, id_persona, fecha, descripcion)
VALUES (1, 96, TO_DATE('22/10/2025', 'DD/MM/YYYY'), 'agregado');

commit;
