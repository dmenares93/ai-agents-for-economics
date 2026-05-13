# Ingeniería de prompts

Material de clase sobre fundamentos del **prompt engineering** y su uso práctico en programación, especialmente para trabajar con agentes de IA en tareas de economía, análisis de datos y código.

## Material incluido

| Archivo | Descripción |
|---|---|
| [main.tex](main.tex) | Presentación Beamer: "Módulo 3: Fundamentos del Prompt Engineering". |
| [figs/](figs/) | Figuras usadas en la presentación. |
| [FEN_CMD-EDContinua_original.png](FEN_CMD-EDContinua_original.png) | Logo usado en portada y láminas. |

## Contenidos principales

- Qué es el prompt engineering y por qué funciona como interfaz entre intención humana y respuesta de IA.
- Naturaleza de los LLM como modelos predictivos de tokens.
- Principios clave: claridad, contexto, orientación al objetivo e iteración.
- Estructura recomendada de un prompt: contexto, instrucción principal, criterios de salida y restricciones.
- Valor del prompt engineering en programación.
- Sesgos de los modelos de lenguaje y cómo usarlos de forma consciente:
  - primacy y recency,
  - anclaje,
  - confirmación,
  - disponibilidad/popularidad,
  - efecto halo.
- Técnicas de prompting para programación:
  - zero-shot,
  - one-shot y few-shot,
  - chain-of-thought,
  - persona-based prompting,
  - refinement-based prompting,
  - progressive hint prompting,
  - least-to-most prompting,
  - customización de salida e identificación de errores.

## Cómo compilar la presentación

Desde esta carpeta:

```bash
pdflatex main.tex
```

Si hay referencias o elementos pendientes, correr dos veces:

```bash
pdflatex main.tex
pdflatex main.tex
```

## Prompts sugeridos para practicar

```text
Convierte esta presentación en una guía breve para estudiantes de economía que están empezando a usar agentes de IA.
```

```text
Lee `main.tex` y extrae cinco reglas prácticas para escribir mejores prompts cuando pido ayuda con código Stata o Python.
```

```text
Transforma la sección sobre sesgos de LLM en una tabla con: sesgo, qué problema causa, cómo aprovecharlo y ejemplo de prompt.
```
