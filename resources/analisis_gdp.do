*------------------------------------------------------------------*
* analisis_gdp.do
* Ejemplo de script de Stata: carga gdp_latam.dta y calcula
* estadisticos descriptivos + grafico de evolucion del PIB.
*------------------------------------------------------------------*

clear all
set more off
capture log close

* Directorio de trabajo (ajustar segun corresponda)
cd "`c(pwd)'"

log using "analisis_gdp.log", replace text

* 1. Cargar datos
use "gdp_latam.dta", clear
describe
summarize gdp

* 2. Estadisticos por pais
bysort country: summarize gdp

* 3. Tabla resumen
tabstat gdp, by(country) statistics(mean min max sd) format(%12.0fc)

* 4. Crecimiento anual del PIB por pais
sort country year
by country: gen gdp_growth = (gdp - gdp[_n-1]) / gdp[_n-1] * 100
label variable gdp_growth "Crecimiento anual del PIB (%)"

* 5. Regresion simple: tendencia temporal
encode country, gen(country_id)
xtset country_id year
regress gdp year i.country_id

* 6. Grafico de evolucion
twoway (line gdp year, by(country)), ///
    title("Evolucion del PIB - America Latina") ///
    ytitle("PIB (US$ corrientes)") xtitle("Año")
graph export "gdp_evolucion.png", replace

log close
display "Listo: analisis completado."
