library(tidyverse)
library(readxl)
library(dplyr)
library(tidyr)
library(readr)
library(dplyr)
library(lubridate)
library(stringr)

setwd("D:/ABCN/Github/manos-a-la-data/data/2020/2020-07-29")
barreras <- readxl::read_xls("Data Logros al 31.12.2017.xls",skip = 1)

barreras$`FECHA DE MODIF.`
table(barreras$`TIPO DE ACTUACIÓN`)
table(barreras$ENTIDAD)
unique(barreras$ENTIDAD)

barreras$TIPO_ENTIDAD <- "Otros"
names(barreras)

View(barreras)

barreras <- barreras %>%
  mutate(TIPO_ENTIDAD = case_when(
                          grepl("MUNICIPALIDA", ENTIDAD) ~ "Gobierno Regional",
                          grepl("UNIVERSIDAD", ENTIDAD) ~ "Universidad",
                          grepl("MINISTERIO", ENTIDAD) ~ "Ejecutivo",
                          grepl("ASAMBLEA", ENTIDAD) ~ "Universidad",
                          grepl("SEGURO SOCIAL DE SALUD", ENTIDAD) ~ "Otras instituciones del Estado",
                          grepl("COLEGIO ODONTOLÓGICO", ENTIDAD) ~ "Colegios profesionales",
                          grepl("REGISTRO NACIONAL", ENTIDAD) ~ "Otras instituciones del Estado",
                          grepl("SUPERINTENDENCIA", ENTIDAD) ~ "Instituciones autónomas del Estado",
                          grepl("PRESIDENCIA DEL CONSEJO", ENTIDAD) ~ "Ejecutivo",
                          grepl("AUTORIDAD PORTUARIA", ENTIDAD) ~ "Otras instituciones del Estado",
                          grepl("DEFENSORIA DEL", ENTIDAD) ~ "Instituciones autónomas del Estado",
                          grepl("SERVICIO NACIONAL", ENTIDAD) ~ "Colegios profesionales",
                          
                          )
  )

barreras2 <- barreras %>% filter(TIPO_ENTIDAD %in% c(NA))
unique(barreras2$ENTIDAD)
