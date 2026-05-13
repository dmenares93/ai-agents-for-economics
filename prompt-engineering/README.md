# Módulo 3: Fundamentos del Prompt Engineering

El *prompt engineering* es la disciplina que diseña y redacta de forma deliberada las instrucciones que se dan a un modelo de lenguaje (LLM) para guiarlo hacia una salida específica y de calidad. Aunque un LLM como ChatGPT se basa en técnicas de predicción de texto, su comportamiento puede moldearse significativamente si el *prompt* está bien concebido. Es, en esencia, la **interfaz de diseño entre la intención humana y la respuesta generada por la IA**:

```
Humano  →  Prompt  →  LLM  →  Salida
```

---

## 1. Naturaleza y propósito

Los LLM funcionan como motores de autocompletado extremadamente sofisticados: predicen el siguiente *token* en función del contexto dado. Por eso, la forma en que formulamos la entrada determina:

- **Relevancia de la respuesta:** un *prompt* claro reduce ambigüedades.
- **Precisión técnica:** en programación, puede marcar la diferencia entre un código ejecutable y uno con errores.
- **Eficiencia del desarrollo:** un buen *prompt* evita iteraciones innecesarias.

El objetivo central del *prompt engineering* es **traducir un problema humano en un conjunto de instrucciones que el modelo pueda interpretar de forma predecible**, para que su salida sea útil y verificable.

---

## 2. Principios clave

La práctica efectiva del *prompt engineering* se apoya en varios principios:

- **Claridad y especificidad:** expresar el problema en términos concretos, evitando ambigüedades.
- **Contexto suficiente:** proporcionar información de entorno (lenguaje de programación, restricciones de datos, objetivo final) para que el modelo entienda el escenario.
- **Orientación al objetivo:** el *prompt* no solo pregunta, sino que define qué forma debe tener la respuesta: un bloque de código, una explicación paso a paso o un archivo en un formato determinado.
- **Iteración y refinamiento:** el *prompt* se mejora de manera progresiva, analizando las salidas y ajustando las instrucciones para alcanzar el resultado deseado.

Estos principios hacen que el diseño de *prompts* sea un **proceso de ingeniería**, más que un simple arte de redactar preguntas.

---

## 3. Estructura recomendada

Berryman y Ziegler (2024) proponen visualizar el *prompt* como un documento técnico con partes definidas, adaptables a cada tarea:

1. **Contexto:** breve descripción del problema, del entorno o de los datos relevantes.
2. **Instrucción principal:** lo que se quiere que el modelo produzca, en forma de acción concreta.
3. **Criterios de salida:** formato esperado (bloque de código, JSON, tabla, explicación textual).
4. **Condiciones o restricciones:** por ejemplo, uso de librerías estándar, límites de tiempo o estilo de programación.

Una estructura así no solo mejora la **calidad de la respuesta**, sino que también facilita su **reproducibilidad** e **integración** en flujos de trabajo de desarrollo.

---

## 4. Valor en programación

En el contexto del desarrollo de software, estos fundamentos se convierten en una **herramienta estratégica**:

- Permiten obtener **código más seguro y mantenible** desde el primer intento.
- Facilitan la **automatización de tareas repetitivas** sin necesidad de reentrenar modelos.
- Favorecen la **colaboración humano–IA**, transformando al LLM en un verdadero asistente de programación.

---

## 5. Sesgos en los modelos de lenguaje y cómo aprovecharlos

Los modelos de lenguaje no son neutrales. Al entrenarse en enormes volúmenes de texto para predecir el siguiente *token* con máxima probabilidad, desarrollan patrones de respuesta que llamamos **sesgos**. Lejos de ser solo un problema, estos sesgos pueden **aprovecharse de forma consciente en el *prompt engineering*** (Berryman y Ziegler, 2024). Comprender por qué surgen, a nivel matemático, permite diseñar *prompts* que los utilicen en nuestro favor.

### 5.1 Efecto de posición: *primacy* y *recency*

**Qué es.** La información situada al inicio del *prompt* influye más en el formato y el tono, mientras que lo del final impacta más en el contenido sustantivo. La parte central suele perder fuerza, fenómeno conocido como "*Valley of Meh*".

**Génesis técnica.** Los *Transformers* utilizan mecanismos de *auto-atención* con codificación posicional. Durante el entrenamiento, las cabeceras de atención tienden a asignar más atención a los tokens de los extremos, y la entropía cruzada premia la predicción eficiente del siguiente *token*. Como resultado, el modelo recuerda mejor el principio y el final de la secuencia, mientras la información intermedia queda atenuada.

**Uso estratégico.** Colocar al principio las instrucciones de estilo (por ejemplo, "Sigue las convenciones del lenguaje y comenta cada función") y al final los datos clave o la pregunta central, para que el modelo los priorice.

### 5.2 Sesgo de anclaje

**Qué es.** Tendencia a dar peso desproporcionado a la primera pista o contexto recibido.

**Génesis técnica.** En la *auto-atención*, los primeros tokens suelen servir para establecer la representación de contexto. Como el modelo predice token a token, las primeras señales condicionan la distribución de probabilidades de todo el resto, generando un "efecto arrastre" en el razonamiento.

**Uso estratégico.** Emplear un "ancla" deliberada:

> *"Actúa como revisor senior de código y optimiza la eficiencia del siguiente script."*

De esta manera se fija de inicio la perspectiva que el modelo mantendrá.

### 5.3 Sesgo de confirmación

**Qué es.** El modelo tiende a reforzar la hipótesis implícita en la pregunta, en lugar de cuestionarla.

**Génesis técnica.** El objetivo de entrenamiento minimiza la pérdida buscando la continuación más plausible dado el contexto. Si el *prompt* insinúa una respuesta, la distribución de probabilidad se concentra en tokens que la confirmen; "contradecir" el contexto tiene menor probabilidad.

**Uso estratégico.** Presentar la hipótesis y luego pedir crítica:

> *"Mi algoritmo burbuja es eficiente. Examina y explica por qué esta afirmación podría ser incorrecta."*

Así se induce al modelo a primero confirmar y luego, por indicación explícita, buscar contraargumentos.

### 5.4 Sesgo de disponibilidad o popularidad

**Qué es.** Favorece soluciones o ejemplos frecuentes en los datos de entrenamiento.

**Génesis técnica.** El entrenamiento en *corpora* masivos pondera de forma natural las secuencias más repetidas, ya que éstas tienen mayor probabilidad de aparición y menor pérdida en la predicción. El modelo "prefiere" patrones comunes porque estadísticamente son más seguros.

**Uso estratégico.** Si se busca un estándar conocido:

> *"Proporciona la forma más común de conectar una aplicación con una base de datos PostgreSQL."*

Y si se quieren alternativas, se debe pedir explícitamente:

> *"Propón una opción menos frecuente o más innovadora."*

### 5.5 Efecto halo

**Qué es.** Tras una primera respuesta convincente, los usuarios tienden a confiar ciegamente en las siguientes.

**Génesis técnica.** No es solo humano: el modelo, al recibir retroalimentación positiva implícita (por ejemplo, continuaciones sin corrección), refuerza patrones de respuesta similares. En paralelo, el sesgo es principalmente del usuario: el tono seguro del modelo genera percepción de autoridad.

**Uso estratégico.** Pedir siempre *auto-revisión*:

> *"Ahora revisa tu propio código y señala posibles vulnerabilidades de seguridad."*

Se fuerza al modelo a cuestionar su propia salida y se evita caer en confianza ciega.

### *Bias-aware prompting*

Esta práctica, propuesta por Berryman y Ziegler (2024), consiste en **conocer los sesgos y explotarlos conscientemente** para guiar el comportamiento del modelo. No se trata de eliminarlos, sino de **usarlos como palancas de diseño**, siempre validando externamente mediante **pruebas unitarias**, **revisión de código** y **documentación oficial**. El ciclo es:

1. **Conocer** los sesgos → 2. **Aprovechar** los sesgos → 3. **Validar** resultados → (volver a 1).

### Resumen de sesgos

| Sesgo | Idea clave |
|---|---|
| Efecto de posición | El inicio y el final pesan más que el medio. |
| Anclaje | La primera instrucción fija el tono del razonamiento. |
| Confirmación | El modelo refuerza hipótesis en lugar de cuestionarlas. |
| Disponibilidad | Prefiere ejemplos comunes en los datos. |
| Halo | Respuestas iniciales convincentes generan confianza ciega. |

---

## 6. Tipos de *prompt* para programación

La calidad del código que generan los modelos de lenguaje depende fuertemente de la forma en que se formula el *prompt*. Los estudios recientes en ingeniería de *prompts* para programación identifican **patrones y técnicas** que mejoran la **precisión**, la **seguridad** y la **mantenibilidad** del código generado (Della Porta et al., 2025; Tony et al., 2024; Berryman y Ziegler, 2024).

### 6.1 Zero-Shot Prompting

**Descripción.** El modelo recibe solo la instrucción, sin ejemplos previos.

**Ventajas.** Rápido y directo; ideal para tareas estándar o cuando no hay datos de entrenamiento específicos.

**Desventajas.** Puede generar código incompleto o inseguro si la tarea es compleja.

**Ejemplo.** *"Escribe una función que calcule la mediana de una lista de números."*

**Uso recomendado.** Tareas simples, utilidades de *scripting*, prototipos rápidos.

### 6.2 One-Shot y Few-Shot Prompting

**Descripción.** Se incluyen uno o varios ejemplos de entrada–salida antes de la solicitud principal.

**Beneficio.** El modelo aprende el formato y el estilo deseado a partir de los ejemplos.

**Consideración.** Requiere preparar ejemplos relevantes y bien diseñados.

**Ejemplo (*few-shot*).**

```
Entrada: [1,2,3] → Salida: 2
Entrada: [4,4,5] → Salida: 4
Ahora: calcula la mediana de [10,2,3,8]
```

**Aplicación.** Cuando se necesita un estilo de código consistente (por ejemplo, siguiendo las convenciones del lenguaje elegido) o un patrón de arquitectura repetible.

### 6.3 Chain-of-Thought (CoT)

**Descripción.** Se indica explícitamente que el modelo razone paso a paso antes de dar el resultado.

**Fortalezas.** Mejora la lógica en algoritmos complejos; útil para problemas de optimización o estructuras de datos avanzadas.

**Ejemplo.** *"Piensa paso a paso: primero describe el algoritmo para ordenar una lista enlazada y luego escribe el código correspondiente."*

**Consejo.** Ideal para *debugging* y para comprender el razonamiento detrás del código generado.

### 6.4 Persona-based Prompting

**Descripción.** Se asigna un rol específico al modelo para influir en el estilo de la solución.

**Ejemplo.** *"Actúa como un ingeniero senior experto en seguridad. Genera una función que procese datos de usuario evitando inyecciones SQL."*

**Utilidad.** Asegura que el código cumpla con estándares de seguridad o con un nivel de calidad específico.

### 6.5 Refinement-Based Techniques

Orientadas a iterar y mejorar el resultado en ciclos sucesivos (Tony et al., 2024; Berryman y Ziegler, 2024).

**a) Recursive Criticism and Improvement (RCI).** El modelo revisa su propio código, identifica errores y los corrige en ciclos sucesivos.

> *"Genera un script que haga web scraping. Ahora revisa tu respuesta y señala posibles problemas de seguridad. Corrige el código según tu revisión."*

**b) Self-Refine.** Similar a RCI, pero con pasos automáticos de autoevaluación y mejora continua.

**Beneficio.** Refuerza la calidad y seguridad del código sin intervención constante del usuario.

### 6.6 Progressive Hint Prompting

**Descripción.** El modelo recibe pistas progresivas que lo guían hacia la solución.

**Uso típico.** Cuando se busca que el modelo construya un algoritmo complejo en etapas, por ejemplo:

1. Diseñar la estructura de clases.
2. Implementar los métodos.
3. Optimizar la eficiencia.

**Ventaja.** Favorece el aprendizaje guiado y la generación de código modular.

### 6.7 Least-to-Most Prompting

**Descripción.** Se comienza resolviendo subtareas simples y se avanza hacia la tarea más compleja.

**Ejemplo.** Primero pedir funciones auxiliares (p. ej., para validar entradas), luego la función principal.

**Beneficio.** Facilita el desarrollo de software modular y *testable*, y reduce la probabilidad de errores en etapas posteriores.

### 6.8 Output Customization / Error Identification

**Descripción.** Patrones donde el *prompt* exige un formato de salida específico (por ejemplo, solo código) o que el modelo detecte y explique errores en su propia respuesta.

**Ejemplo.** *"Escribe únicamente el código, sin explicaciones. Luego genera un reporte de errores potenciales en el mismo script."*

**Aplicación.** Útil para *pipelines* automáticos de verificación de código y para entornos de desarrollo continuo.

---

## 7. Recomendaciones prácticas

- **Combina técnicas:** por ejemplo, inicia con *few-shot* y agrega una fase RCI para reforzar la seguridad del código (Tony et al., 2024; Berryman y Ziegler, 2024).
- **Especifica entorno y librerías:** indica el lenguaje, su versión, dependencias o *frameworks* relevantes.
- **Integra validación automática:** añade en el *prompt* la instrucción de crear *tests* unitarios para verificar la solución.

---

## Referencias

- Berryman, J., & Ziegler, A. (2024). *Prompt Engineering for LLMs: The Art and Science of Building Large Language Model–Based Applications*. O'Reilly Media.
- Della Porta, A., Lambiase, S., & Palomba, F. (2025). *Do Prompt Patterns Affect Code Quality? A First Empirical Assessment of ChatGPT-Generated Code*. arXiv:2504.13656v1.
- Tony, C., Díaz Ferreyra, N. E., Mutas, M., Dhiff, S., & Scandariato, R. (2024). *Prompting Techniques for Secure Code Generation: A Systematic Investigation*. arXiv:2407.07064v2.
