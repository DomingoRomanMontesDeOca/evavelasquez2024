sn$ = selected$("Sound")
tg = selected("TextGrid")
ton = selected("Pitch")

# ene de sílabas

select tg

ene_silabas = Get number of intervals: 2

tabla_data_silabas = Create Table with column names: "tabla", ene_silabas, { "archivo", "silaba", "duracion", "semitonos", "intensidad", "cesuras", "etiquetas", "max_st", "min_st", "pendiente" }
writeInfoLine: "==========="
for i to ene_silabas
	select tg
	etiquetado$ = Get label of interval: 2, i
	select tabla_data_silabas
	Set string value: i, "archivo", sn$
	Set string value: i, "silaba", etiquetado$
	endif
endfor
