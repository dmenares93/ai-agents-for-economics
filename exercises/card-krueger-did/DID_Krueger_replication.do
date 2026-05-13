/*===========================================================================
  Card & Krueger (1994) - Minimum Wages and Employment
  Difference-in-Differences Replication
  AER, September 1994, vol. 84
===========================================================================*/

* Ruta del dataset: corre este do-file desde esta misma carpeta.
global data "DinD_ex.dta"

* Matriz para guardar resultados resumidos:
* filas: PA, NJ, Diferencia (NJ - PA)
* columnas: antes, despues, DiD, (quedan columnas libres sin usar)
mat T = J(3,6,.)

* ===== 1) Periodo "antes" (after == 0) =====
use "$data", clear
drop if after == 1

* Compara medias de empleo (fte) entre estados (nj=0/1).
ttest fte, by(nj)
* Guarda medias por grupo y diferencia entre grupos.
mat T[1,1] = r(mu_1)
mat T[2,1] = r(mu_2)
mat T[3,1] = r(mu_2) - r(mu_1)

* ===== 2) Periodo "despues" (after == 1) =====
use "$data", clear
drop if after == 0

* Repite la comparacion de medias en el periodo posterior.
ttest fte, by(nj)
mat T[1,2] = r(mu_1)
mat T[2,2] = r(mu_2)
mat T[3,2] = r(mu_2) - r(mu_1)


* ===== 3) Construccion manual del estimador DiD =====
* Cambio en PA (antes - despues)
mat T[1,3] = T[1,1] - T[1,2]
* Cambio en NJ (antes - despues)
mat T[2,3] = T[2,1] - T[2,2]
* Diferencia de cambios: estimador DiD.
mat T[3,3] = T[3,1] - T[3,2]

* Etiquetas de filas para lectura de la matriz.
mat rownames T = PA NJ Difference

* Muestra tabla resumen.
mat list T


* ===== 4) DiD con comando especializado =====
use "$data", clear
* Instala/actualiza el paquete "diff" desde SSC.
ssc install diff, replace
* t(): grupo tratado/control, p(): periodo, robust: EE robustos.
diff fte, t(nj) p(after) robust


* ===== 5) Regresiones con cambio en empleo (dfte) =====
use "$data", clear
* DiD por MCO usando cambio en empleo como dependiente.
reg dfte njafter nj after

use "$data", clear
* Misma especificacion con errores robustos.
reg dfte njafter nj after, robust



* ===== 6) Regresiones con nivel de empleo (fte) =====
use "$data", clear
reg fte njafter nj after

use "$data", clear
* Misma especificacion con errores robustos.
reg fte njafter nj after, robust



* ===== 7) Errores agrupados y modelo de panel FE =====
use "$data", clear
* Agrupa errores estandar por unidad/panel (sheet).
reg fte njafter nj after, cluster(sheet)

use "$data", clear
* Declara estructura panel por identificador de unidad.
xtset sheet
* Efectos fijos por unidad; nj puede absorberse por FE.
xtreg fte nj njafter after, fe i(sheet)
