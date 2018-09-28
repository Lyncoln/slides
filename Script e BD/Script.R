library(tidyverse)
library(likert)
library(readxl)
setwd("F://Metodos 2//Trabalho")
BD = read_excel("F:/Metodos 2/Trabalho/BD.xlsx")
BD2= BD %>% 
  select(6:15)
BD2 = mutate_at(BD2,vars(1:3),function(x)factor(x,levels =1:5,labels=c("Muito Ruim","Ruim","Regular","Bom","Ótimo")))
BD2 = mutate_at(BD2,vars(4:10),function(x)ordered(x,levels=c("Muito Ruim","Ruim","Regular","Bom","Ótimo"),labels=c("Muito Ruim","Ruim","Regular","Bom","Ótimo")))

vet = NULL
for( i in 1:10 ){
  vet[i] = str_sub(names(BD2[,i]),start = 4)
}
names(BD2) = vet
BD2 = as.data.frame(BD2)

plot(likert(BD2)) + ggtitle("Nota Geral do Evento")



x= c("12345")
substr(x,2,199)
