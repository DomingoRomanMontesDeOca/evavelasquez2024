sn$ = selected$("Sound")
tg = selected("TextGrid")
ton = selected("Pitch")

# ene de sílabas

select tg

ene_silabas = Count intervals where: 2, "is not equal to", ""


tabla_data_silabas = Create Table with column names: "tabla", 0, { "archivo", "silaba", "duracion", "semitonos", "intensidad", "cesuras", "etiquetas", "max_st", "min_st", "pendiente" }

writeInfoLine: "==========="


for i to ene_silabas

	select tg

	etiquetado$ = Get label of interval: 2, i

	if etiquetado$ <> ""

		select tabla_data_silabas

		ene_filas_tabla = Get number of rows

		Append row

		Set string value: ene_filas_tabla + 1, "archivo", sn$
		Set string value:  ene_filas_tabla + 1, "silaba", etiquetado$

	endif
endfor

