# Datos Simulados — Programa AYUN

Este directorio contiene una base de datos simulada (`Simul_60k.dta`, 60.000 observaciones) construida para ejercicios de econometría aplicada, en particular **Diferencias en Diferencias (DiD)** y, de forma complementaria, **Regresión Discontinua (RD)**.

El script que genera los datos está en [dofile/create_simul_data.do](dofile/create_simul_data.do).

## Contexto

Los datos simulan la evaluación del **programa AYUN**, una intervención hipotética sobre el ingreso de las personas. La base permite estimar el efecto causal del programa comparando unidades tratadas vs. no tratadas, antes y después de la intervención.

## Estructura de la simulación

### Variables base
- `edad`: entero uniforme entre 20 y 60 años.
- `y1`: ingreso, generado como `rnormal(800000, 10000)` más una bonificación por edad (`rnormal(10000, 10000) * edad`).

### Componente de Regresión Discontinua
- A las personas con `edad == 50` se les suma un efecto de `rnormal(250000, 10000)` sobre `y1` (corte/discontinuidad a los 50 años).

### Componente de Diferencias en Diferencias
- `treated`: asignación aleatoria 50/50 (grupo de tratamiento vs. control).
- `treatment`: período post-intervención, asignación aleatoria 50/50 (post vs. pre).
- `DD = treatment * treated`: indicador del grupo tratado en el período post.

**Efectos aplicados sobre `y1`:**
- Si `treatment == 1` (post): se suma `rnormal(200000, 10000)` — efecto temporal común a todas las unidades en el período post.
- Si `treatment == 1 & treated == 1` (tratados, post): se suma adicionalmente `rnormal(100000, 10000)` — **este es el efecto causal del programa AYUN**, de aproximadamente **100.000 unidades monetarias en promedio**.

Por lo tanto, el coeficiente esperado de la interacción `DD` en una regresión DiD debería estar cercano a **100.000**.

## Archivos

- `Simul_60k.dta` — dataset final en formato Stata.
- `dofile/create_simul_data.do` — script que genera los datos (semilla `1234` para reproducibilidad).

## Uso sugerido

```stata
use "Simul_60k.dta", clear
reg y1 treated treatment DD, robust
```

El coeficiente sobre `DD` recupera el efecto promedio del programa AYUN sobre los tratados en el período post-intervención.
