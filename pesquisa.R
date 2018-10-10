# install.packages("ggplot2")
# install.packages("descr")
# install.packages("dplyr")
# install.packages("readr")
# install.packages("readxl")

library(descr)#estatistica descritiva
library(dplyr)#manupulação de dados
library(ggplot2)#graficos
library(readr)#leitura de db
library(readxl)#leitura de planilhas excel

eleitor_mg <- read_xlsx("ELEICOES 2018 MG.xlsx")
dim(eleitor_mg)

total <- eleitor_mg %>% summarise(n=n())
total = as.integer(total)
print(total)
class(total)

###teste de cargo eleitoral

dim(eleitor_mg$DS_CARGO)
cargo = as.character(eleitor_mg$DS_CARGO)
dim(cargo)
eleitor_mg %>% filter(cargo== "SENADOR") %>% summarise(n = n())
eleitor_mg %>% filter(cargo== "DEPUTADO ESTADUAL") %>% summarise(n = n())
ggplot(eleitor_mg, aes(cargo, total))+geom_col(fill = "#1464E8", title = "")


#### teste de cor e raça, sexo e 

eleitor_mg %>% filter(DS_GENERO== "MASCULINO") %>% summarise(n = n())

eleitor_mg %>% filter(DS_GENERO== "FEMININO") %>% summarise(n = n())

eleitor_mg %>% filter(DS_COR_RACA== "PRETA") %>% summarise(n = n())
eleitor_mg %>% filter(DS_COR_RACA== "BRANCA") %>% summarise(n = n())
eleitor_mg %>% filter(DS_COR_RACA== "PARDA") %>% summarise(n = n())
eleitor_mg %>% filter(DS_COR_RACA== "AMARELA") %>% summarise(n = n())
eleitor_mg %>% filter(DS_COR_RACA== "INDÍGENA") %>% summarise(n = n())

freq(eleitor_mg$DS_COR_RACA)
ggplot(eleitor_mg, aes(DS_GENERO))+geom_bar()+xlab("Sexo")+ylab("nº de candidatos")
ggplot(eleitor_mg, aes(DS_COR_RACA))+geom_bar()+xlab("RAÇA")+ylab("nº de candidatos")

ggplot(eleitor_mg, aes(eleitor_mg$DT_NASCIMENTO, hoje))+geom_area()
help(Sys.Date)

hoje = format(Sys.Date(),"%d/%m/%Y")
hoje 
ano <- substr(hoje,7,10)
ano = as.integer(ano)

data_nasc = eleitor_mg$DT_NASCIMENTO
nasc<-substr(data_nasc,7,10)
nasc = as.integer(nasc)


niver<-(ano - nasc)
niver
eleitor_mg$NR_IDADE_DATA_POSSE = niver





