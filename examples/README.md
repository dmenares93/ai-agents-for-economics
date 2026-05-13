# Examples

Ejemplos de código y datos para practicar flujos de trabajo con agentes de IA en economía.

La idea de esta carpeta es tener casos pequeños, transparentes y fáciles de correr. Sirven para probar cómo un agente puede ayudar a inspeccionar datos, explicar modelos, escribir o revisar código, interpretar resultados y documentar un análisis.

## Stata

| Ejemplo | Qué contiene | Qué se puede practicar con IA |
|---|---|---|
| [stata/simulated-rd-did/](stata/simulated-rd-did/) | Datos simulados de ingresos con edad, tratamiento y variables para DiD/RD. Incluye `.dta`, `.xlsx` y el do-file generador. | Inspección de datos, regresiones simples, diferencia-en-diferencias, regresión discontinua, generación de tablas y explicación de identificación. |
| [stata/card-krueger-did/](stata/card-krueger-did/) | Mini ejemplo de diferencias-en-diferencias inspirado en Card & Krueger, con empleo antes/después y grupo NJ/PA. | Replicar un estimador DiD manualmente, comparar con regresiones, pedir explicación econométrica y revisar robustez básica. |

## Prompts sugeridos

- "Inspecciona este `.dta` y dime qué variables hay, qué significan y qué modelo simple puedo estimar."
- "Escribe un do-file de Stata que estime una diferencia-en-diferencias y exporte una tabla limpia."
- "Explícame el coeficiente de interacción como si fuera para una clase de econometría aplicada."
- "Revisa este do-file y dime si hay rutas absolutas, supuestos frágiles o pasos que conviene documentar."
