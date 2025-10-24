```{r writecsv}
start_time <- Sys.time()

#ESCRIBIENDO PARA RESPALDO LA DATA FUENTE
ruta_salida <- "C:/Users/franm/OneDrive/Documents/Personales/Javier/Academicos/UGR - Estadistica Aplicada/Materias/24-25/TFM/data/nyc/citibike-tripdata/datos_filtrados.csv"

write_csv(datos_filtrados2,ruta_salida,na='')

end_time <- Sys.time()
time_taken <- end_time - start_time
print(time_taken)

```

```{r readcsv}
start_time <- Sys.time()

# Importar el archivo CSV nuevamente
datos_importados <- read.csv(ruta_salida)

# Comparar los datos originales con los importados
identical(datos_filtrados2, datos_importados)

str(datos_filtrados2)
str(datos_importados)


end_time <- Sys.time()
time_taken <- end_time - start_time
print(time_taken)

```