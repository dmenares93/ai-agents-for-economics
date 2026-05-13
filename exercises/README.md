# Exercises

Ejercicios prácticos con datos y scripts para practicar flujos de trabajo con agentes de IA en economía.

La idea de esta carpeta es tener casos pequeños, transparentes y fáciles de correr. Sirven para probar cómo un agente puede ayudar a inspeccionar datos, explicar modelos, escribir o revisar código, interpretar resultados y documentar un análisis.

Son deliberadamente chicos: la gracia es que el usuario pueda abrir los datos, pedirle al agente que los inspeccione, generar un primer do-file, revisar resultados y discutir identificación sin perderse en una base grande.

## Ejercicios incluidos

| Ejercicio | Datos | Qué se puede practicar con IA |
|---|---|---|
| [simul_data/](simul_data/) | Do-file `create_simul_data.do` + `Simul_60k.dta` / `.xlsx` | Cómo se genera la base simulada que usan los otros ejercicios. Útil para revisar el DGP, modificar parámetros o pedirle al agente que explique el proceso generador. |
| [simulated-rd-did/](simulated-rd-did/) | `Simul_60k.dta`, `Simul_60k.xlsx` | Inspección de datos, regresiones simples, diferencia-en-diferencias, regresión discontinua, generación de tablas y explicación de identificación. |
| [simulated-rd-did_skill/](simulated-rd-did_skill/) | `Simul_60k.dta` + skill local `.claude/skills/stata/SKILL.md` | **Ejemplo del resultado de aplicar una skill.** Misma base que el ejercicio anterior, pero organizada según una skill de Stata que impone una estructura de carpetas estándar (`dofile/`, `log/`, `table/`, `graph/`, `temp/`, `data/`, `output/`). Útil para comparar un flujo "a mano" vs. un flujo guiado por skill. |
| [card-krueger-did/](card-krueger-did/) | `DinD_ex.dta` | Replicar un estimador DiD manualmente (inspirado en Card & Krueger), comparar con regresiones, pedir explicación econométrica y revisar robustez básica. |

## Ideas de uso con IA

- Pedir una auditoría inicial del dataset: variables, tamaños, missings, rangos sospechosos.
- Pedir un do-file reproducible desde cero.
- Comparar estimación manual versus regresión.
- Convertir resultados en una explicación para clase, paper corto o nota técnica.
- Pedir mejoras de estilo para código Stata existente.

## Prompts sugeridos

- "Inspecciona este `.dta` y dime qué variables hay, qué significan y qué modelo simple puedo estimar."
- "Escribe un do-file de Stata que estime una diferencia-en-diferencias y exporte una tabla limpia."
- "Explícame el coeficiente de interacción como si fuera para una clase de econometría aplicada."
- "Revisa este do-file y dime si hay rutas absolutas, supuestos frágiles o pasos que conviene documentar."
- "Compara las carpetas `simulated-rd-did/` y `simulated-rd-did_skill/`: ¿qué aporta tener una skill de Stata que imponga estructura?"
