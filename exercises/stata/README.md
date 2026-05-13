# Stata examples

Casos simples para practicar análisis de datos y econometría aplicada con agentes de IA.

Estos ejemplos son deliberadamente chicos: la gracia es que el usuario pueda abrir los datos, pedirle al agente que los inspeccione, generar un primer do-file, revisar resultados y discutir identificación sin perderse en una base grande.

## Ejemplos incluidos

| Carpeta | Datos | Uso principal |
|---|---|---|
| [simulated-rd-did/](simulated-rd-did/) | `Simul_60k.dta`, `Simul_60k.xlsx` | Simulación simple para DiD y regresión discontinua. |
| [card-krueger-did/](card-krueger-did/) | `DinD_ex.dta` | Diferencias-en-diferencias con estructura antes/después y grupo tratado/control. |

## Ideas de uso con IA

- Pedir una auditoría inicial del dataset: variables, tamaños, missings, rangos sospechosos.
- Pedir un do-file reproducible desde cero.
- Comparar estimación manual versus regresión.
- Convertir resultados en una explicación para clase, paper corto o nota técnica.
- Pedir mejoras de estilo para código Stata existente.
