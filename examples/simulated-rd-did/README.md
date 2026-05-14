# Simulated RD and DiD data

Datos simulados de 60.000 observaciones para ejemplos básicos de econometría aplicada en Stata.

## Archivos

| Archivo | Descripción |
|---|---|
| `Simul_60k.dta` | Base Stata con ingresos, edad, variables de tratamiento y una interacción DiD. |
| `Simul_60k.xlsx` | Misma lógica de datos en Excel para probar visores o importación. |
| `dofile/create_simul_data.do` | Script que genera la base simulada. |

## Variables principales

| Variable | Descripción |
|---|---|
| `edad` | Edad simulada entre 20 y 60. |
| `y1` | Ingreso simulado. |
| `treated` | Indicador de grupo tratado. |
| `treatment` | Indicador de periodo o condición de tratamiento. |
| `DD` | Interacción `treatment * treated`. |

## Aplicaciones posibles con IA

- Pedirle al agente que inspeccione la base y sugiera modelos simples.
- Estimar una diferencia-en-diferencias.
- Explorar una regresión discontinua alrededor de `edad == 50`.
- Generar tablas, gráficos y explicaciones de resultados para docencia.

## Prompt de partida

```text
Mira `Simul_60k.dta`, describe las variables y escribe un do-file de Stata que estime un modelo de diferencia-en-diferencias.
```
