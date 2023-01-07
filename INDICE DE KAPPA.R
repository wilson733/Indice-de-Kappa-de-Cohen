##Carga de paquetes

if(!require(pacman)) install.packages("pacman")
library(pacman)

pacman::p_load(irr,dplyr, DescTools, sf, rel)

##Importacion de datos

archivo <-
  choose.files(caption = "Seleccione archivo a estandatizar (shp, gpkg)",
               multi = FALSE)
file_name <- paste0(tools::file_path_sans_ext(archivo),
                    '_estandarizado.',
                    tools::file_ext(archivo))

shp <- st_read(archivo)

data<- st_drop_geometry(shp)

##Calculo de Kappa de Cohen (para 2 observadores)

irr::kappa2(data[-3])

##Calculo de IC 95% para Kappa de Cohen

ckap(data[-3], conf.level= 0.95)

##Calculo de Kappa de Fleiss (para mas de 2 observadores)

##irr::kappam.fleiss(data, detail = TRUE)

##Calculo de IC de 95% para Kappa de Fleiss

##DescTools::KappaM(data, method= "Fleiss", conf.level= 0.95)

##Calculo de concordancia para ambos

irr::agree(data)
