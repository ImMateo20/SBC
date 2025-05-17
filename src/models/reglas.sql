INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Sin riesgo','No existe riesgo de diabetes, sin embargo es importante seguir cuidando de tu salud, así como mantener una buena alimentación, limitar azúcares y hacer ejercicio.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Alerta prediabetes', 'Mejora tu alimentación, realiza chequeos periódicos y mantente hidratado con agua natural.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Prediabetes', 'Estás en un estado previo a diabetes. Cambios en estilo de vida son urgentes.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Alerta diabetes', 'Haz ejercicio al menos 30 min al dia. Consulta con un especialista y realiza estudios de glucosa en sangre, familiares con diabetes puede ser motivo de padecerlo tambien.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Posible diabetes tipo 1', 'Consulta de inmediato, podría tratarse de un cuadro agudo de diabetes tipo 1.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Diabetes tipo 1', 'Se requieren insulina y monitoreos constantes, consulta urgente.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Posible diabetes tipo 2', 'Limita el consumo de bebidas azucaradas, mejora tu dieta, solicita pruebas de HbA1c y aumenta la actividad física semanal.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Diabetes tipo 2', 'La diabetes tipo 2 puede dañar nervios y piel, visita a un médico general, necesitas cambio completo de estilo de vida.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Posible diabetes gestacional', 'Controla tu dieta durante el embarazo y realiza controles periódicos de glucosa.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Alerta diabetes gestacional', 'Evita bebidas azucaradas, haz ejercicio moderado y consulta con tu obstetra para descartar riesgos.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Diabetes gestacional', 'Consulta ginecológico y nutricional urgente, cambios necesarios en dieta y monitoreo.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Posible diabetes tipo LADA', 'Este tipo de diabetes suele confundirse con tipo 2, consulta con un endocrinólogo.');
INSERT INTO reglas (diagnostico, recomendacion) VALUES ('Diabetes tipo LADA', 'Consulta con endocrinólogo, podría requerir insulina temprana.');

////////////////////////////////////////////////////

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Polidipsia', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (2, 'Polidipsia', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (3, 'Polidipsia', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Polidipsia', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (10, 'Polidipsia', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (5, 'Polidipsia', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Polidipsia', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (9, 'Polidipsia', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Polidipsia', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (6, 'Polidipsia', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Polidipsia', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (11, 'Polidipsia', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Polidipsia', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Poliuria', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (2, 'Poliuria', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (3, 'Poliuria', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Poliuria', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (10, 'Poliuria', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (5, 'Poliuria', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Poliuria', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (9, 'Poliuria', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Poliuria', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Poliuria', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'Poliuria', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (11, 'Poliuria', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (6, 'Poliuria', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Polifagia', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Polifagia', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Polifagia', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (5, 'Polifagia', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Polifagia', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Polifagia', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (6, 'Polifagia', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Polifagia', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'Polifagia', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Fatiga', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (2, 'Fatiga', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (3, 'Fatiga', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Fatiga', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (10, 'Fatiga', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (5, 'Fatiga', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Fatiga', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (9, 'Fatiga', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Fatiga', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (6, 'Fatiga', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Fatiga', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (11, 'Fatiga', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'Fatiga', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'BajarPeso', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'BajarPeso', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'BajarPeso', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (5, 'BajarPeso', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'BajarPeso', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'BajarPeso', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (6, 'BajarPeso', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'BajarPeso', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'BajarPeso', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Vision', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (2, 'Vision', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (3, 'Vision', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Vision', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (5, 'Vision', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Vision', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Vision', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (6, 'Vision', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Vision', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'Vision', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Hormigueo', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Hormigueo', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Hormigueo', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Hormigueo', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Hormigueo', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Hormigueo', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'Hormigueo', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Infecciones', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Infecciones', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Infecciones', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Infecciones', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Infecciones', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Heridas', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Heridas', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Heridas', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Heridas', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Heridas', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Acantosis', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Acantosis', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (2, 'Acantosis', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (3, 'Acantosis', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Acantosis', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Acantosis', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Irritabilidad', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Irritabilidad', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Irritabilidad', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (5, 'Irritabilidad', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Irritabilidad', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (6, 'Irritabilidad', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Irritabilidad', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Concentracion', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Concentracion', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Concentracion', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Concentracion', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'Concentracion', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Candidiasis', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Candidiasis', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Candidiasis', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Candidiasis', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'Candidiasis', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'PielSeca', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'PielSeca', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'PielSeca', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'PielSeca', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'PielSeca', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'BocaSeca', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'BocaSeca', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'BocaSeca', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'BocaSeca', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'BocaSeca', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Picazon', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Picazon', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Picazon', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Picazon', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (12, 'Picazon', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Picazon', '4');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (13, 'Picazon', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'Ejercicio', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'Ejercicio', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'Ejercicio', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Ejercicio', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Ejercicio', '4');

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'IngestaRefrescos', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (2, 'IngestaRefrescos', '1');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (3, 'IngestaRefrescos', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (4, 'IngestaRefrescos', '2');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (7, 'IngestaRefrescos', '3');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (8, 'IngestaRefrescos', '4');


//////////////////////////////////////////////////

INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Polidipsia', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Poliuria', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Polifagia', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Fatiga', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'BajarPeso', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Vision', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Hormigueo', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Infecciones', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Heridas', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Acantosis', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Irritabilidad', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Concentracion', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Candidiasis', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'PielSeca', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'BocaSeca', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Picazon', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'Ejercicio', '0');
INSERT INTO condiciones (regla_id, atributo, valor) VALUES (1, 'IngestaRefrescos', '0');