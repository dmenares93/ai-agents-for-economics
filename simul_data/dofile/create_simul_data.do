clear all

set seed 1234
set obs 60000

// gemerar variable de edad entre 20 y 60
gen edad = runiformint(20, 60)

// genera ingresos normal
gen y1 = rnormal(800000, 10000)

// ingresas mas bonificacion por edad
replace y1 = y1 + rnormal(10000, 10000)*edad
table edad, statistic(mean y1)

*=========== Simulacion Regresion Discontinua =============*

// efecto programa a los 50 años
replace y1 = y1 + rnormal(250000, 10000) if edad == 50



*=========== Simulacion Diferencias en Diferencias =============*

// Generar variable treated con asignación aleatoria 50/50
gen random_treated = runiform()
sort random_treated
gen treated = (_n <= _N/2)
drop random_treated

// Generar variable treatment con asignación aleatoria 50/50
gen random_treatment = runiform()
sort random_treatment
gen treatment = (_n <= _N/2)
drop random_treatment

// Asignar incrementos
gen incremento = 0
replace incremento = rnormal(200000, 10000) if treatment == 1
replace incremento = incremento +  rnormal(100000, 10000) if treatment == 1 & treated == 1

// Aplicar el incremento a y1
gen y1_old = y1
replace y1 = y1 + incremento if !missing(incremento)
drop incremento

table treatment treated, statistic(mean y1_old)
table treatment treated, statistic(mean y1)

gen DD = treatment * treated

//label variables
label variable y1 "Ingreso"
label variable treatment "Tratamiento"
label variable treated "Tratado"
label variable DD "Tratamiento * Tratado"
label variable edad "Edad"
drop y1_old


save "../Simul_60k.dta", replace