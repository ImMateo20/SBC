CREATE DATABASE proyecto_SBC;

USE proyecto_SBC;

ALTER TABLE usuarios ADD rol ENUM ('usuario', 'admin') NOT NULL DEFAULT 'usuario';

create table
    usuarios (
        id int primary key auto_increment,
        nombre varchar(50) not null,
        apellido_paterno varchar(50) not null,
        apellido_materno varchar(50) not null,
        email varchar(50) not null UNIQUE,
        password varchar(255) not null,
        rol ENUM ('usuario', 'admin') NOT NULL DEFAULT 'usuario'
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
        informacion TEXT DEFAULT NULL,
        imagen VARCHAR(255)
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