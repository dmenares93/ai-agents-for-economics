# Card and Krueger DiD example

Mini ejemplo de diferencias-en-diferencias inspirado en Card y Krueger (1994), usando empleo antes/después y comparación entre New Jersey y Pennsylvania.

## Archivos

| Archivo | Descripción |
|---|---|
| `DinD_ex.dta` | Base en formato Stata. |
| `DID_Krueger_replication.do` | Do-file con estimación manual, comando `diff`, regresiones y errores robustos/cluster. |

## Variables principales

| Variable | Descripción |
|---|---|
| `sheet` | Identificador de unidad/panel. |
| `fte` | Empleo equivalente a tiempo completo. |
| `nj` | Indicador de New Jersey. |
| `after` | Indicador de periodo posterior. |
| `njafter` | Interacción `nj * after`. |
| `dfte` | Cambio en empleo. |

## Aplicaciones posibles con IA

- Pedir al agente que explique el estimador DiD fila por fila.
- Comparar el cálculo manual con la regresión `reg fte njafter nj after`.
- Revisar si el do-file es reproducible y portable.
- Pedir una interpretación del coeficiente `njafter`.
- Transformar el análisis en una tabla lista para una nota o clase.


