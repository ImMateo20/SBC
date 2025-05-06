const evaluarRespuestas = (respuestas, edad) => {
  const reglas = [
    //REGLAS PREDIABETES

    {
      condiciones: {
        Polidipsia: "2",
        Poliuria: "2",
        Acantosis: "3",
      },
      diagnostico: "Alerta Prediabetes",
      recomendacion:
        "Mejora tu alimentación, realiza chequeos periódicos y mantente hidratado con agua natural.",
    },
    {
      condiciones: {
        Polidipsia: "2",
        Poliuria: "2",
        Acantosis: "3",
        Fatiga: "2",
        BajarPeso: "0",
        Vision: "2",
      },
      diagnostico: "Alerta Prediabetes",
      recomendacion:
        "Haz actividad física regular y reduce el consumo de azúcares refinados.",
    },
    {
      condiciones: {
        Polidipsia: "4",
        Poliuria: "4",
        Fatiga: "4",
        Vision: "4",
        Acantosis: "4",
      },
      diagnostico: "Prediabetes",
      recomendacion:
        "Estás en un estado previo a diabetes. Cambios en estilo de vida son urgentes.",
    },
    {
      condiciones: {
        Polidipsia: "3",
        Ejercicio: "0",
        HistorialFamiliarDiabetes: "1",
      },
      diagnostico: "Alerta Diabetes",
      recomendacion:
        "Haz ejercicio al menos 30 min al dia. Consulta con un especialista y realiza estudios de glucosa en sangre, familiares con diabetes puede ser motivo de padecerlo tambien.",
    },
    //REGLAS DIANETES TIPO 1

    {
      condiciones: {
        Acantosis: "3",
        Poliuria: "3",
        Polidipsia: "3",
      },
      diagnostico: edad > 40 ? "Posible Diabetes Tipo 1" : null,
      recomendacion:
        "Requiere atención inmediata, acude al médico para pruebas específicas.",
    },
    {
      condiciones: {
        Polidipsia: "3",
        Poliuria: "3",
        Polifagia: "3",
        BajarPeso: "3",
      },
      diagnostico: "Posible Diabetes Tipo 1",
      recomendacion:
        "Consulta de inmediato, podría tratarse de un cuadro agudo de diabetes tipo 1.",
    },
    {
      condiciones: {
        Fatiga: "2",
        Irritabilidad: "3",
        Mojar: "3",
      },
      diagnostico: edad < 12 ? "Posible Diabetes Tipo 1" : null,
      recomendacion:
        "Estos síntomas son comunes en niños y adolescentes, requiere atención médica urgente.",
    },
    {
      condiciones: {
        Polidipsia: "4",
        Poliuria: "4",
        Polifagia: "4",
        Fatiga: "4",
        BajarPeso: "4",
        Vision: "4",
        Irritabilidad: "4",
        // Mojar: "4",
      },
      diagnostico: "Diabetes Tipo 1",
      recomendacion:
        "Se requieren insulina y monitoreos constantes, consulta urgente.",
    },
    //REGLAS DIANETES TIPO 2

    {
      condiciones: {
        IngestaRefrescos: "4",
        Ejercicio: "0",
        BajarPeso: "2",
        Picazon: "3",
      },
      diagnostico: "Posible Diabetes Tipo 2",
      recomendacion:
        "Limita el consumo de bebidas azucaradas y aumenta la actividad física semanal.",
    },
    {
      condiciones: {
        Polidipsia: "3",
        Poliuria: "3",
        Fatiga: "3",
        BajarPeso: "1",
      },
      diagnostico: "Posible Diabetes Tipo 2",
      recomendacion:
        "Haz ejercicio, mejora tu dieta y solicita pruebas de HbA1c.",
    },
    {
      condiciones: {
        Vision: "2",
        Hormigueo: "3",
        Infecciones: "3",
      },
      diagnostico: "Posible Diabetes Tipo 2",
      recomendacion:
        "La diabetes tipo 2 puede dañar nervios y piel, visita a un médico general.",
    },
    {
      condiciones: {
        BocaSeca: "4",
        Infecciones: "4",
        Heridas: "4",
        Polidipsia: "4",
        Poliuria: "4",
        Fatiga: "4",
      },
      diagnostico: "Diabetes Tipo 2",
      recomendacion:
        "Consulta con especialista, necesitas cambio completo de estilo de vida.",
    },
    //REGLAS DIANETES GESTACIONAL

    {
      condiciones: {
        Polidipsia: "3",
        Poliuria: "3",
        Fatiga: "3",
        Embarazo: "1",
      },
      diagnostico: "Posible Diabetes Gestacional",
      recomendacion:
        "Controla tu dieta durante el embarazo y realiza controles periódicos de glucosa.",
    },
    {
      condiciones: {
        Polidipsia: "2",
        IngestaRefrescos: "4",
        Ejercicio: "0",
        Embarazo: "1",
      },
      diagnostico: "Alerta Diabetes Gestacional",
      recomendacion:
        "Evita bebidas azucaradas, haz ejercicio moderado y consulta con tu obstetra para descartar riesgos.",
    },
    {
      condiciones: {
        Polidipsia: "4",
        Poliuria: "4",
        Fatiga: "4",
        Embarazo: "1",
      },
      diagnostico: "Diabetes Gestacional",
      recomendacion:
        "Consulta ginecológico y nutricional urgente, cambios necesarios en dieta y monitoreo.",
    },
    //REGLAS DIABETES TIPO LADA

    {
      condiciones: {
        Polidipsia: "3",
        Poliuria: "3",
        Fatiga: "3",
        Candidiasis: "2",
      },
      diagnostico: edad > 30 && edad < 50 ? "Posible Diabetes Tipo LADA" : null,
      recomendacion:
        "Este tipo de diabetes suele confundirse con tipo 2, consulta con un endocrinólogo.",
    },
    {
      condiciones: {
        Concentracion: "4",
        Candidiasis: "4",
        PielSeca: "4",
        Picazon: "4",
        Fatiga: "4",
        Polidipsia: "4",
      },
      diagnostico: "Diabetes Tipo LADA",
      recomendacion:
        "Consulta con endocrinólogo, podría requerir insulina temprana.",
    },
  ];


  let mejoresCoincidencias = [];

  for (const regla of reglas) {
    if (!regla.diagnostico) continue;

    const condiciones = Object.entries(regla.condiciones);

    const cumpleTodas = condiciones.every(
      ([clave, valorEsperado]) => respuestas[clave] === valorEsperado
    );

    if (cumpleTodas) {
      mejoresCoincidencias.push({
        diagnostico: regla.diagnostico,
        recomendacion: regla.recomendacion,
        cantidadCondiciones: condiciones.length,
      });
    }
  }

  if (mejoresCoincidencias.length > 0) {
    const mejor = mejoresCoincidencias.reduce((a, b) =>
      a.cantidadCondiciones > b.cantidadCondiciones ? a : b
    );

    return {
      diagnostico: mejor.diagnostico,
      recomendacion: mejor.recomendacion,
    };
  }

  return {
    diagnostico: "Sin posible alerta de diabetes",
    recomendacion:
      "No existe riesgo de diabetes, sin embargo es importante seguir cuidando de tu salud, así como mantener una buena alimentación, limitar azúcares y hacer ejercicio.",
  };
};


export default evaluarRespuestas;