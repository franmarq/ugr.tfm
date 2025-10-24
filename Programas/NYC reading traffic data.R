library(tidyverse)
library(lubridate)

setwd('C:/Users/franm/OneDrive/Documents/Personales/Javier/Academicos/UGR - Estadistica Aplicada/Materias/24-25/TFM')
getwd()

nyctraffic<-read.csv('data/Automated_Traffic_Volume_Counts_20250802.csv')

str(nyctraffic)

###################################

#Validacion de las fechas completitud

# Crear la variable 'fecha' y sumar 'vol' por fecha
vol_fecha <- nyctraffic %>%
  # 1. Crear la variable 'fecha'
  # Concatenamos Yr, M y D en formato 'YYYY-MM-DD' y la convertimos a tipo fecha.
  mutate(fecha = as.Date(paste(Yr, M, D, sep = "-"))) %>%
  # 2. Agrupar los registros por la nueva variable 'fecha'
  group_by(fecha) %>%
  # Excluir antes de 2022-11-01 y después de 2024-10-31
  filter(fecha >= as.Date("2022-11-01") & fecha <= as.Date("2024-10-31") & Boro!="Manhattan") %>%
  # 3. Sumar la variable 'vol' para cada grupo (fecha)
  summarise(volumen_total_diario = sum(Vol, na.rm = TRUE)) %>%
  # Opcional: Desagrupar el dataframe si planeas hacer más operaciones que no requieran la agrupación
  ungroup() %>%
  # Opcional: Ordenar por fecha para una mejor visualización
  arrange(fecha)


####################################

nyctraffic1<-nyctraffic[nyctraffic$Boro=="Manhattan" & nyctraffic$Yr %in% c("2022","2023","2024"),]

frecuencia_street_dplyr <- nyctraffic1 %>%
  count(street, sort = TRUE)

# Crear la variable 'fecha' y sumar 'vol' por fecha
volumen_diario_por_fecha <- nyctraffic1 %>%
  # 1. Crear la variable 'fecha'
  # Concatenamos Yr, M y D en formato 'YYYY-MM-DD' y la convertimos a tipo fecha.
  mutate(fecha = as.Date(paste(Yr, M, D, sep = "-"))) %>%
  # 2. Agrupar los registros por la nueva variable 'fecha'
  group_by(fecha) %>%
  # Excluir antes de 2022-11-01 y después de 2024-10-31
  filter(fecha >= as.Date("2022-11-01") & fecha <= as.Date("2024-10-31")) %>%
  # 3. Sumar la variable 'vol' para cada grupo (fecha)
  summarise(volumen_total_diario = sum(Vol, na.rm = TRUE)) %>%
  # Opcional: Desagrupar el dataframe si planeas hacer más operaciones que no requieran la agrupación
  ungroup() %>%
  # Opcional: Ordenar por fecha para una mejor visualización
  arrange(fecha)