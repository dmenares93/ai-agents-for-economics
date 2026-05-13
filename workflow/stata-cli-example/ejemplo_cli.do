*------------------------------------------------------------------
* ejemplo_cli.do
*
* Ejemplo mínimo para probar el ejecutable de Stata desde la terminal
* (modo batch). Carga el dataset de ejemplo `auto`, muestra una
* tabulación y una regresión simple.
*
* Uso (macOS, StataNow MP):
*   /Applications/StataNow/StataMP.app/Contents/MacOS/stata-mp -b do ejemplo_cli.do
*
* El log queda en `ejemplo_cli.log` al lado de este archivo.
*------------------------------------------------------------------

clear all
set more off

display "=========================================="
display "  Ejemplo CLI de Stata — dataset auto"
display "=========================================="

sysuse auto, clear

describe

tabulate foreign

summarize price mpg weight

regress price mpg weight foreign

display "Listo: ejecución terminada OK."
