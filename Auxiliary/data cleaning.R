#################################
##### SHP 8 - Data Analysis #####
#################################

#Load packages

library(dplyr)
library(tidyverse)
library(ggplot2)
library(readxl)

#Load data

data <- read_excel("~/data_bast1_2022-04-23_17-59.xlsx") #insert doc name
View(data)

#Clean data

data_experiment <- data %>%
  as_tibble()%>%
  select(-SERIAL, -REF, -QUESTNNR, -MODE, -RG01_CP, -RG02_CP)%>%
  subset(FINISHED != "0" & DM09_01 == "6" & DM09_02 == "9" & DM09_03 == "9" & DM10 == "1" & DM07 == "1")%>% #check for consent, delete unfinished questionnaires, inattentive people and participants who did not understand the rules
  subset(!is.na(TR03_40)|!is.na(TR04_40)) #delete participants that did not make it to the end (TR03 for choice condition and TR04 for assigned condition). For some reason deleting the FINISHED != 1 observations was not enough

#Create dummy variables
##reminder: R and K are the untrustworthy looking faces, D and M are trustworthy looking

data_experiment$trustKR <- ifelse(data_experiment$RG02x01 == '2', 1, 0) #Dummy variable that = 1 when K is the cooperator and 0 when R is the cooperator
data_experiment$trustDM <- ifelse(data_experiment$RG02x02 == '2', 1, 0) #Same thing but for D and M respectively
data_experiment$choice <- ifelse(data_experiment$RG01 == '1', 1, 0) #Equals 1 when choice condition, 0 otherwise

#Delete some more unnecessary variables

data_experiment <- data1 %>%
  select(-starts_with("RG02"), -RG01, -STARTED, - starts_with("DM09"), - FINISHED, - STARTED, -starts_with("IV03"), -ends_with("a"), - starts_with("TR03"), -starts_with("IV02"), -MAILSENT, -Q_VIEWER, -DM10, -starts_with("DM07"), -starts_with("TIME"), -LASTPAGE, -MAXPAGE)%>%
  rename(Trustworthiness_D= DV01_01)%>%
  rename(Trustworthiness_K = DV01_02)%>%
  rename(Trustworthiness_M = DV01_03)%>%
  rename(Trustworthiness_R = DV01_04)%>%
  rename(preference = DV02) #1 = D, 2 = K, 3 = M, 4 = R

data_experiment$Trustworthiness_K <-  strtoi(data_experiment$Trustworthiness_K)
data_experiment$Trustworthiness_M <- strtoi(data_experiment$Trustworthiness_M)
data_experiment$Trustworthiness_R <-  strtoi(data_experiment$Trustworthiness_R)
data_experiment$Trustworthiness_D <- strtoi(data_experiment$Trustworthiness_D)

data_choice <- data_experiment %>%
  subset(data_experiment$choice == '1')%>%
  select(-TR04, -IV08_01)

data_assigned <- data_experiment %>%
  subset(data_experiment$choice == '0')

#from these datasets the effects on trustworthiness ratings can be calculated as well as the descriptives
#IV04, IV06, etc. can be separated for the mixed effects model