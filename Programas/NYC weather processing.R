library(tidyverse)
library(lubridate)

setwd('C:/Users/franm/OneDrive/Documents/Personales/Javier/Academicos/UGR - Estadistica Aplicada/Materias/24-25/TFM')
getwd()

nycweather<-read.csv('data/NYC weather 2022-2024 v2.csv')

str(nycweather)

nycweather$date<-as.Date(nycweather$timestamp) #, format = "%Y-%M-%D")

str(nycweather)


# Estadísticas basicas usando R
nycweather_num <- subset(nycweather, select = -c(date, timestamp))
summary(nycweather_num)


#Creamos funciones para aplicar transformaciones 

#fahrenheit a celsius
fahrenheit_to_celsius <- function(f_temp) {
  c_temp <- (f_temp - 32) * 5/9
  return(c_temp)
}

#Pulgadas cubicas a milimetros cubicos
#(1 cubic inch = 16,387.064 cubic millimeters.)
cubic_in_to_cubic_mm <- function(cubic_inches) {
  cubic_mm <- cubic_inches * 16387.064
  return(cubic_mm)
}

#inches a milimetros
inches_to_mm <- function(inches) {
  mm <- inches * 25.4
  return(mm)
}


nycweather$temp_cent<- fahrenheit_to_celsius(nycweather$temperature)
nycweather$presip_mm<-cubic_in_to_cubic_mm(nycweather$precipitation)
nycweather$snow_mm<-inches_to_mm(nycweather$snow_depth)


nycweather_num <- subset(nycweather, select = -c(date, timestamp))
summary(nycweather_num)



