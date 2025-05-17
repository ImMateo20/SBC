CREATE DATABASE proyecto_SBC;

USE proyecto_SBC;

create table
    usuarios (
        id int primary key auto_increment,
        nombre varchar(50) not null,
        apellido_paterno varchar(50) not null,
        apellido_materno varchar(50) not null,
        email varchar(50) not null UNIQUE,
        password varchar(255) not null
    );

CREATE TABLE
    preguntas (
        id INT AUTO_INCREMENT PRIMARY KEY,
        codigo VARCHAR(50) NOT NULL, -- Por ejemplo: "Edad", "Genero", "Polidipsia"
        texto TEXT NOT NULL, -- Texto de la pregunta
        tipo VARCHAR(20) NOT NULL -- 'number', 'radio', etc.
    );

CREATE TABLE
    opciones (
        id INT AUTO_INCREMENT PRIMARY KEY,
        pregunta_id INT NOT NULL,
        texto TEXT NOT NULL, -- Texto de la opción, por ejemplo: "Siempre", "Nunca"
        valor INT, -- Valor asociado, por ejemplo: 0, 1, 2, ...
        FOREIGN KEY (pregunta_id) REFERENCES preguntas (id) ON DELETE CASCADE
    );

CREATE TABLE
    reglas (
        id INT AUTO_INCREMENT PRIMARY KEY,
        diagnostico VARCHAR(100),
        recomendacion TEXT,
        edad_min INT DEFAULT NULL,
        edad_max INT DEFAULT NULL
    );
CREATE TABLE
    reglas (
        id INT AUTO_INCREMENT PRIMARY KEY,
        diagnostico VARCHAR(100),
        recomendacion TEXT,
    );

CREATE TABLE
    condiciones (
        id INT AUTO_INCREMENT PRIMARY KEY,
        regla_id INT,
        atributo VARCHAR(100),
        valor VARCHAR(10),
        FOREIGN KEY (regla_id) REFERENCES reglas (id) ON DELETE CASCADE
    );

CREATE TABLE
    evaluaciones (
        id INT AUTO_INCREMENT PRIMARY KEY,
        usuario_id INT,
        fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
        diagnostico VARCHAR(100),
        recomendacion TEXT,
        FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE CASCADE
    );

CREATE TABLE
    respuestas (
        id INT AUTO_INCREMENT PRIMARY KEY,
        evaluacion_id INT,
        sintoma VARCHAR(100),
        valor VARCHAR(10),
        FOREIGN KEY (evaluacion_id) REFERENCES evaluaciones (id) ON DELETE CASCADE
    );

--PARA INSERTAR LAS PREGUNTAS EN LA BASE DE DATOS
--1
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    ('Edad', 'Ingrese su edad', 'radio');

--2
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    ('Genero', '¿Cúal es su genero?', 'radio');

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (2, 'Hombre.', 0),
    (2, 'Mujer.', 1);

--3
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Peso',
        'En caso de que sepa su peso, ingréselo (kg)',
        'number'
    );

--4
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Estatura',
        'En caso de que sepa su estatura, ingrésela (cm)',
        'number'
    );

--5
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Embarazo',
        '¿En este momento se encuentra embarazada?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (5, 'No.', 0),
    (5, 'Sí.', 1);

--6
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Polidipsia',
        '¿Con qué frecuencia siente una sed intensa durante el día?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (6, 'Nunca.', 0),
    (6, 'Rara vez.', 1),
    (6, 'A veces.', 2),
    (6, 'Frecuentemente.', 3),
    (6, 'Siempre.', 4);

--7
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Poliuria',
        '¿Qué tan frecuente es su necesidad de orinar, incluso por la noche?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (7, 'Nunca.', 0),
    (7, 'Rara vez.', 1),
    (7, 'A veces.', 2),
    (7, 'Frecuentemente.', 3),
    (7, 'Siempre.', 4);

--8
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Polifagia',
        '¿Siente hambre constantemente, incluso después de comer?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (8, 'Nunca.', 0),
    (8, 'Rara vez.', 1),
    (8, 'A veces.', 2),
    (8, 'Frecuentemente.', 3),
    (8, 'Siempre.', 4);

--9
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Fatiga',
        '¿Se ha sentido cansado o sin energía en la mayoría de los días?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (9, 'Nunca.', 0),
    (9, 'Rara vez.', 1),
    (9, 'A veces.', 2),
    (9, 'Frecuentemente.', 3),
    (9, 'Siempre.', 4);

--10
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'BajarPeso',
        '¿Ha notado pérdida de peso sin haber hecho dieta o ejercicio?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (10, 'Nada.', 0),
    (10, 'Muy poco.', 1),
    (10, 'Poco.', 2),
    (10, 'Moderado.', 3),
    (10, 'Mucho.', 4);

--11
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Vision',
        '¿Tiene visión borrosa o dificultad para enfocar objetos?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (11, 'Nunca.', 0),
    (11, 'Rara vez.', 1),
    (11, 'A veces.', 2),
    (11, 'Frecuentemente.', 3),
    (11, 'Siempre.', 4);

--12
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Hormigueo',
        '¿Siente hormigueo o entumecimiento en sus manos o pies?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (12, 'Nunca.', 0),
    (12, 'Rara vez.', 1),
    (12, 'A veces.', 2),
    (12, 'Frecuentemente.', 3),
    (12, 'Siempre.', 4);

--13
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Infecciones',
        '¿Tiene infecciones frecuentes como urinarias, en piel o encías?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (13, 'Nunca.', 0),
    (13, 'Rara vez.', 1),
    (13, 'A veces.', 2),
    (13, 'Frecuentemente.', 3),
    (13, 'Siempre.', 4);

--14
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Heridas',
        '¿Nota que sus heridas tardan en cicatrizar más de lo normal?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (14, 'Nunca.', 0),
    (14, 'Rara vez.', 1),
    (14, 'A veces.', 2),
    (14, 'Frecuentemente.', 3),
    (14, 'Siempre.', 4);

--15
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Acantosis',
        '¿Ha observado manchas oscuras en su cuello, axilas u otros pliegues de la piel?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (15, 'Nunca.', 0),
    (15, 'Rara vez.', 1),
    (15, 'A veces.', 2),
    (15, 'Frecuentemente.', 3),
    (15, 'Siempre.', 4);

--16
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Irritabilidad',
        '¿Siente irritabilidad o cambios de humor repentinos?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (16, 'Nunca.', 0),
    (16, 'Rara vez.', 1),
    (16, 'A veces.', 2),
    (16, 'Frecuentemente.', 3),
    (16, 'Siempre.', 4);

--17
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Concentracion',
        '¿Le cuesta concentrarse o se siente confundido con frecuencia?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (17, 'Nunca.', 0),
    (17, 'Rara vez.', 1),
    (17, 'A veces.', 2),
    (17, 'Frecuentemente.', 3),
    (17, 'Siempre.', 4);

--18
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Candidiasis',
        '¿Ha tenido infecciones por hongos de forma recurrente en la zona íntima?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (18, 'Nunca.', 0),
    (18, 'Rara vez.', 1),
    (18, 'A veces.', 2),
    (18, 'Frecuentemente.', 3),
    (18, 'Siempre.', 4);

--19
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'PielSeca',
        '¿Tiene sensación de resequedad o comezón persistente en la piel?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (19, 'Nunca.', 0),
    (19, 'Rara vez.', 1),
    (19, 'A veces.', 2),
    (19, 'Frecuentemente.', 3),
    (19, 'Siempre.', 4);

--20
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'BocaSeca',
        '¿Ha notado resequedad en la boca durante el día o la noche?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (20, 'Nunca.', 0),
    (20, 'Rara vez.', 1),
    (20, 'A veces.', 2),
    (20, 'Frecuentemente.', 3),
    (20, 'Siempre.', 4);

--21
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'Picazon',
        '¿Tiene picazón frecuente en distintas zonas del cuerpo?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (21, 'Nunca.', 0),
    (21, 'Rara vez.', 1),
    (21, 'A veces.', 2),
    (21, 'Frecuentemente.', 3),
    (21, 'Siempre.', 4);

--22
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'HistorialFamiliarDiabetes',
        '¿Tiene familiares que hayan padecido de diabetes?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (22, 'No.', 0),
    (22, 'Sí.', 1);

--23
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'IngestaRefrescos',
        '¿Con que frecuencia realiza al menos 30 minutos de ejercicio?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (23, 'Nunca.', 0),
    (23, '1 día a la semana.', 1),
    (23, '2 a 3 días a la semana.', 2),
    (23, '4 a 5 días a la semana.', 3),
    (23, 'Todos los días.', 4);

--24
INSERT INTO
    preguntas (codigo, texto, tipo)
VALUES
    (
        'IngestaRefrescos',
        '¿Con que frecuencia ingiere refrescos?',
        'radio'
    );

INSERT INTO
    opciones (pregunta_id, texto, valor)
VALUES
    (24, 'Nunca.', 0),
    (24, 'Rara vez.', 1),
    (24, 'A veces.', 2),
    (24, 'Frecuentemente.', 3),
    (24, 'Siempre.', 4);