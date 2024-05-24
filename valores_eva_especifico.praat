# eva velazquez upegui y domingo román montes de oca
# 2024

# Versión de prueba 8 de abril 2024


# crea nombres de variables para cada 
sn = selected("Sound")
sn$ = selected$("Sound")
tg = selected("TextGrid")
tono = selected("Pitch")

select tono
x_tono = Get mean: 0, 0, "Hertz"


select sn
intensidad = To Intensity: 100, 0, "yes"


select tg
ene_silabas = Get number of intervals: 2
ene_cesuras = Get number of points: 3
ene_etiquetasTB = Get number of points: 4

tabla = Create Table with column names: "table", ene_silabas, { "archivo", "silaba", "duracion", "st", "intensidad", "cesura", "eTBiqueta" }

for i to ene_silabas
	select tg
	silaba$ = Get label of interval: 2, i

	if silaba$ <> ""
		ini = Get start time of interval: 2, i
		fin = Get end time of interval: 2, i
		dur = fin-ini
		
		select intensidad
		intensidad_silaba = Get mean: ini, fin, "energy"
		select tono
		x_silaba_f0 = Get mean: ini, fin, "Hertz"

		st = 12*log2(x_silaba_f0/x_tono)
		select tabla
		Set string value: i, "archivo", sn$
		Set string value: i, "silaba", silaba$
		Set numeric value: i, "duracion", dur
		Set numeric value: i, "st", st
		Set numeric value: i, "intensidad", intensidad_silaba
	endif
endfor

select tabla
select intensidad
Remove


# ========================

# escribe el valor de la cesura.

select tg

for i to ene_cesuras

	select tg

	tiempo_cesura = Get time of point: 3, i

	etiqueta_cesura$ = Get label of point: 3, i

	intervalo_tier_2 = Get interval at time: 2, tiempo_cesura

	intervalo_real = 	intervalo_tier_2 - 2

	select tabla

	Set string value: intervalo_real, "cesura", etiqueta_cesura$
	
endfor

writeInfoLine: "=========="

# escribe el valor de la etiqueta de tono.

select tg

for i to ene_etiquetasTB

	select tg

	tiempo_etiquetaTB = Get time of point: 4, i

	etiqueta_TB$ = Get label of point: 4, i

	intervalo_tier_2 = Get interval at time: 2, tiempo_etiquetaTB

	select tabla

	Set string value: intervalo_tier_2, "eTBiqueta", etiqueta_TB$
	
endfor




select tabla

enefilasfinal = Get number of rows

valor$ = Get value: enefilasfinal, "eTBiqueta"

Set string value: enefilasfinal-1, "eTBiqueta", valor$	


Remove row: enefilasfinal

Remove row: 1
