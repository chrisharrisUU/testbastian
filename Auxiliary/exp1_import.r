# This script reads a CSV file in GNU R.
# While reading this file, comments will be created for all variables.
# The comments for values will be stored as attributes (attr) as well.

# data1_raw_file = file.choose()
# setwd("./")
data1_raw_file = here("Data/exp1_data.csv")

data1_raw = read.table(
  file=data1_raw_file, encoding="UTF-8",
  header = FALSE, sep = "\t", quote = "\"",
  dec = ".", row.names = "CASE",
  col.names = c(
    "CASE","SERIAL","REF","QUESTNNR","MODE","STARTED","RG01_CP","RG01","RG02_CP",
    "RG02x01","RG02x02","TR03_01","TR03_01a","TR03_02","TR03_02a","TR03_03",
    "TR03_03a","TR03_04","TR03_04a","TR03_05","TR03_05a","TR03_06","TR03_06a",
    "TR03_07","TR03_07a","TR03_08","TR03_08a","TR03_09","TR03_09a","TR03_10",
    "TR03_10a","TR03_11","TR03_11a","TR03_12","TR03_12a","TR03_13","TR03_13a",
    "TR03_14","TR03_14a","TR03_15","TR03_15a","TR03_16","TR03_16a","TR03_17",
    "TR03_17a","TR03_18","TR03_18a","TR03_19","TR03_19a","TR03_20","TR03_20a",
    "TR03_21","TR03_21a","TR03_22","TR03_22a","TR03_23","TR03_23a","TR03_24",
    "TR03_24a","TR03_25","TR03_25a","TR03_26","TR03_26a","TR03_27","TR03_27a",
    "TR03_28","TR03_28a","TR03_29","TR03_29a","TR03_30","TR03_30a","TR03_31",
    "TR03_31a","TR03_32","TR03_32a","TR03_33","TR03_33a","TR03_34","TR03_34a",
    "TR03_35","TR03_35a","TR03_36","TR03_36a","TR03_37","TR03_37a","TR03_38",
    "TR03_38a","TR03_39","TR03_39a","TR03_40","TR03_40a","TR04_01","TR04_01a",
    "TR04_02","TR04_02a","TR04_03","TR04_03a","TR04_04","TR04_04a","TR04_05",
    "TR04_05a","TR04_06","TR04_06a","TR04_07","TR04_07a","TR04_08","TR04_08a",
    "TR04_09","TR04_09a","TR04_10","TR04_10a","TR04_11","TR04_11a","TR04_12",
    "TR04_12a","TR04_13","TR04_13a","TR04_14","TR04_14a","TR04_15","TR04_15a",
    "TR04_16","TR04_16a","TR04_17","TR04_17a","TR04_18","TR04_18a","TR04_19",
    "TR04_19a","TR04_20","TR04_20a","TR04_21","TR04_21a","TR04_22","TR04_22a",
    "TR04_23","TR04_23a","TR04_24","TR04_24a","TR04_25","TR04_25a","TR04_26",
    "TR04_26a","TR04_27","TR04_27a","TR04_28","TR04_28a","TR04_29","TR04_29a",
    "TR04_30","TR04_30a","TR04_31","TR04_31a","TR04_32","TR04_32a","TR04_33",
    "TR04_33a","TR04_34","TR04_34a","TR04_35","TR04_35a","TR04_36","TR04_36a",
    "TR04_37","TR04_37a","TR04_38","TR04_38a","TR04_39","TR04_39a","TR04_40",
    "TR04_40a","DM06","DM02","DM03","DM05","DM07","DM07_01","DM09_01","DM09_02",
    "DM09_03","DM10","DM11_01","IV01_RV1","IV01_RV2","IV01_RV3","IV02_01","IV02_02",
    "IV02_03","IV02_04","IV04_01","IV04_02","IV04_03","IV04_04","IV04_05","IV04_06",
    "IV04_07","IV04_08","IV04_09","IV04_10","IV04_11","IV04_12","IV04_13","IV04_14",
    "IV04_15","IV04_16","IV04_17","IV04_18","IV04_19","IV04_20","IV04_21","IV04_22",
    "IV04_23","IV04_24","IV04_25","IV04_26","IV04_27","IV04_28","IV04_29","IV04_30",
    "IV04_31","IV04_32","IV04_33","IV04_34","IV04_35","IV04_36","IV04_37","IV04_38",
    "IV04_39","IV04_40","IV06_01","IV06_02","IV06_03","IV06_04","IV06_05","IV06_06",
    "IV06_07","IV06_08","IV06_09","IV06_10","IV06_11","IV06_12","IV06_13","IV06_14",
    "IV06_15","IV06_16","IV06_17","IV06_18","IV06_19","IV06_20","IV06_21","IV06_22",
    "IV06_23","IV06_24","IV06_25","IV06_26","IV06_27","IV06_28","IV06_29","IV06_30",
    "IV06_31","IV06_32","IV06_33","IV06_34","IV06_35","IV06_36","IV06_37","IV06_38",
    "IV06_39","IV06_40","IV07_01","IV07_02","IV07_03","IV07_04","IV07_05","IV08_01",
    "IV09_01","DV01_01","DV01_02","DV01_03","DV01_04","DV02","TIME001","TIME002",
    "TIME003","TIME004","TIME005","TIME006","TIME007","TIME008","TIME009","TIME010",
    "TIME011","TIME012","TIME013","TIME014","TIME015","TIME016","TIME_SUM",
    "MAILSENT","LASTDATA","FINISHED","Q_VIEWER","LASTPAGE","MAXPAGE","MISSING",
    "MISSREL","TIME_RSI","DEG_TIME"
  ),
  as.is = TRUE,
  colClasses = c(
    CASE="numeric", SERIAL="character", REF="character", QUESTNNR="character",
    MODE="factor", STARTED="POSIXct", RG01_CP="numeric", RG01="numeric",
    RG02_CP="numeric", RG02x01="numeric", RG02x02="numeric", TR03_01="numeric",
    TR03_01a="numeric", TR03_02="numeric", TR03_02a="numeric",
    TR03_03="numeric", TR03_03a="numeric", TR03_04="numeric",
    TR03_04a="numeric", TR03_05="numeric", TR03_05a="numeric",
    TR03_06="numeric", TR03_06a="numeric", TR03_07="numeric",
    TR03_07a="numeric", TR03_08="numeric", TR03_08a="numeric",
    TR03_09="numeric", TR03_09a="numeric", TR03_10="numeric",
    TR03_10a="numeric", TR03_11="numeric", TR03_11a="numeric",
    TR03_12="numeric", TR03_12a="numeric", TR03_13="numeric",
    TR03_13a="numeric", TR03_14="numeric", TR03_14a="numeric",
    TR03_15="numeric", TR03_15a="numeric", TR03_16="numeric",
    TR03_16a="numeric", TR03_17="numeric", TR03_17a="numeric",
    TR03_18="numeric", TR03_18a="numeric", TR03_19="numeric",
    TR03_19a="numeric", TR03_20="numeric", TR03_20a="numeric",
    TR03_21="numeric", TR03_21a="numeric", TR03_22="numeric",
    TR03_22a="numeric", TR03_23="numeric", TR03_23a="numeric",
    TR03_24="numeric", TR03_24a="numeric", TR03_25="numeric",
    TR03_25a="numeric", TR03_26="numeric", TR03_26a="numeric",
    TR03_27="numeric", TR03_27a="numeric", TR03_28="numeric",
    TR03_28a="numeric", TR03_29="numeric", TR03_29a="numeric",
    TR03_30="numeric", TR03_30a="numeric", TR03_31="numeric",
    TR03_31a="numeric", TR03_32="numeric", TR03_32a="numeric",
    TR03_33="numeric", TR03_33a="numeric", TR03_34="numeric",
    TR03_34a="numeric", TR03_35="numeric", TR03_35a="numeric",
    TR03_36="numeric", TR03_36a="numeric", TR03_37="numeric",
    TR03_37a="numeric", TR03_38="numeric", TR03_38a="numeric",
    TR03_39="numeric", TR03_39a="numeric", TR03_40="numeric",
    TR03_40a="numeric", TR04_01="numeric", TR04_01a="numeric",
    TR04_02="numeric", TR04_02a="numeric", TR04_03="numeric",
    TR04_03a="numeric", TR04_04="numeric", TR04_04a="numeric",
    TR04_05="numeric", TR04_05a="numeric", TR04_06="numeric",
    TR04_06a="numeric", TR04_07="numeric", TR04_07a="numeric",
    TR04_08="numeric", TR04_08a="numeric", TR04_09="numeric",
    TR04_09a="numeric", TR04_10="numeric", TR04_10a="numeric",
    TR04_11="numeric", TR04_11a="numeric", TR04_12="numeric",
    TR04_12a="numeric", TR04_13="numeric", TR04_13a="numeric",
    TR04_14="numeric", TR04_14a="numeric", TR04_15="numeric",
    TR04_15a="numeric", TR04_16="numeric", TR04_16a="numeric",
    TR04_17="numeric", TR04_17a="numeric", TR04_18="numeric",
    TR04_18a="numeric", TR04_19="numeric", TR04_19a="numeric",
    TR04_20="numeric", TR04_20a="numeric", TR04_21="numeric",
    TR04_21a="numeric", TR04_22="numeric", TR04_22a="numeric",
    TR04_23="numeric", TR04_23a="numeric", TR04_24="numeric",
    TR04_24a="numeric", TR04_25="numeric", TR04_25a="numeric",
    TR04_26="numeric", TR04_26a="numeric", TR04_27="numeric",
    TR04_27a="numeric", TR04_28="numeric", TR04_28a="numeric",
    TR04_29="numeric", TR04_29a="numeric", TR04_30="numeric",
    TR04_30a="numeric", TR04_31="numeric", TR04_31a="numeric",
    TR04_32="numeric", TR04_32a="numeric", TR04_33="numeric",
    TR04_33a="numeric", TR04_34="numeric", TR04_34a="numeric",
    TR04_35="numeric", TR04_35a="numeric", TR04_36="numeric",
    TR04_36a="numeric", TR04_37="numeric", TR04_37a="numeric",
    TR04_38="numeric", TR04_38a="numeric", TR04_39="numeric",
    TR04_39a="numeric", TR04_40="numeric", TR04_40a="numeric", DM06="numeric",
    DM02="numeric", DM03="numeric", DM05="numeric", DM07="numeric",
    DM07_01="logical", DM09_01="numeric", DM09_02="numeric", DM09_03="numeric",
    DM10="numeric", DM11_01="character", IV01_RV1="character",
    IV01_RV2="character", IV01_RV3="character", IV02_01="character",
    IV02_02="character", IV02_03="character", IV02_04="character",
    IV04_01="character", IV04_02="character", IV04_03="character",
    IV04_04="character", IV04_05="character", IV04_06="character",
    IV04_07="character", IV04_08="character", IV04_09="character",
    IV04_10="character", IV04_11="character", IV04_12="character",
    IV04_13="character", IV04_14="character", IV04_15="character",
    IV04_16="character", IV04_17="character", IV04_18="character",
    IV04_19="character", IV04_20="character", IV04_21="character",
    IV04_22="character", IV04_23="character", IV04_24="character",
    IV04_25="character", IV04_26="character", IV04_27="character",
    IV04_28="character", IV04_29="character", IV04_30="character",
    IV04_31="character", IV04_32="character", IV04_33="character",
    IV04_34="character", IV04_35="character", IV04_36="character",
    IV04_37="character", IV04_38="character", IV04_39="character",
    IV04_40="character", IV06_01="character", IV06_02="character",
    IV06_03="character", IV06_04="character", IV06_05="character",
    IV06_06="character", IV06_07="character", IV06_08="character",
    IV06_09="character", IV06_10="character", IV06_11="character",
    IV06_12="character", IV06_13="character", IV06_14="character",
    IV06_15="character", IV06_16="character", IV06_17="character",
    IV06_18="character", IV06_19="character", IV06_20="character",
    IV06_21="character", IV06_22="character", IV06_23="character",
    IV06_24="character", IV06_25="character", IV06_26="character",
    IV06_27="character", IV06_28="character", IV06_29="character",
    IV06_30="character", IV06_31="character", IV06_32="character",
    IV06_33="character", IV06_34="character", IV06_35="character",
    IV06_36="character", IV06_37="character", IV06_38="character",
    IV06_39="character", IV06_40="character", IV07_01="character",
    IV07_02="character", IV07_03="character", IV07_04="character",
    IV07_05="character", IV08_01="character", IV09_01="character",
    DV01_01="numeric", DV01_02="numeric", DV01_03="numeric", DV01_04="numeric",
    DV02="numeric", TIME001="integer", TIME002="integer", TIME003="integer",
    TIME004="integer", TIME005="integer", TIME006="integer", TIME007="integer",
    TIME008="integer", TIME009="integer", TIME010="integer", TIME011="integer",
    TIME012="integer", TIME013="integer", TIME014="integer", TIME015="integer",
    TIME016="integer", TIME_SUM="integer", MAILSENT="POSIXct",
    LASTDATA="POSIXct", FINISHED="logical", Q_VIEWER="logical",
    LASTPAGE="numeric", MAXPAGE="numeric", MISSING="numeric", MISSREL="numeric",
    TIME_RSI="numeric", DEG_TIME="numeric"
  ),
  skip = 1,
  check.names = TRUE, fill = TRUE,
  strip.white = FALSE, blank.lines.skip = TRUE,
  comment.char = "",
  na.strings = ""
)

rm(data1_raw_file)

attr(data1_raw, "project") = "bast1"
attr(data1_raw, "description") = "Bastian"
attr(data1_raw, "date") = "2022-05-05 14:55:54"
attr(data1_raw, "server") = "https://www.soscisurvey.de"

# Variable und Value Labels
data1_raw$TR03_01 = factor(data1_raw$TR03_01, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_02 = factor(data1_raw$TR03_02, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_03 = factor(data1_raw$TR03_03, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_04 = factor(data1_raw$TR03_04, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_05 = factor(data1_raw$TR03_05, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_06 = factor(data1_raw$TR03_06, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_07 = factor(data1_raw$TR03_07, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_08 = factor(data1_raw$TR03_08, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_09 = factor(data1_raw$TR03_09, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_10 = factor(data1_raw$TR03_10, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_11 = factor(data1_raw$TR03_11, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_12 = factor(data1_raw$TR03_12, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_13 = factor(data1_raw$TR03_13, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_14 = factor(data1_raw$TR03_14, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_15 = factor(data1_raw$TR03_15, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_16 = factor(data1_raw$TR03_16, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_17 = factor(data1_raw$TR03_17, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_18 = factor(data1_raw$TR03_18, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_19 = factor(data1_raw$TR03_19, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_20 = factor(data1_raw$TR03_20, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_21 = factor(data1_raw$TR03_21, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_22 = factor(data1_raw$TR03_22, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_23 = factor(data1_raw$TR03_23, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_24 = factor(data1_raw$TR03_24, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_25 = factor(data1_raw$TR03_25, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_26 = factor(data1_raw$TR03_26, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_27 = factor(data1_raw$TR03_27, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_28 = factor(data1_raw$TR03_28, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_29 = factor(data1_raw$TR03_29, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_30 = factor(data1_raw$TR03_30, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_31 = factor(data1_raw$TR03_31, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_32 = factor(data1_raw$TR03_32, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_33 = factor(data1_raw$TR03_33, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_34 = factor(data1_raw$TR03_34, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_35 = factor(data1_raw$TR03_35, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_36 = factor(data1_raw$TR03_36, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_37 = factor(data1_raw$TR03_37, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_38 = factor(data1_raw$TR03_38, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_39 = factor(data1_raw$TR03_39, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR03_40 = factor(data1_raw$TR03_40, levels=c("1","2","3","4"), labels=c("Person D","Person K","Person M","Person R"), ordered=FALSE)
data1_raw$TR04_01 = factor(data1_raw$TR04_01, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_02 = factor(data1_raw$TR04_02, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_03 = factor(data1_raw$TR04_03, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_04 = factor(data1_raw$TR04_04, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_05 = factor(data1_raw$TR04_05, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_06 = factor(data1_raw$TR04_06, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_07 = factor(data1_raw$TR04_07, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_08 = factor(data1_raw$TR04_08, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_09 = factor(data1_raw$TR04_09, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_10 = factor(data1_raw$TR04_10, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_11 = factor(data1_raw$TR04_11, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_12 = factor(data1_raw$TR04_12, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_13 = factor(data1_raw$TR04_13, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_14 = factor(data1_raw$TR04_14, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_15 = factor(data1_raw$TR04_15, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_16 = factor(data1_raw$TR04_16, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_17 = factor(data1_raw$TR04_17, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_18 = factor(data1_raw$TR04_18, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_19 = factor(data1_raw$TR04_19, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_20 = factor(data1_raw$TR04_20, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_21 = factor(data1_raw$TR04_21, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_22 = factor(data1_raw$TR04_22, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_23 = factor(data1_raw$TR04_23, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_24 = factor(data1_raw$TR04_24, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_25 = factor(data1_raw$TR04_25, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_26 = factor(data1_raw$TR04_26, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_27 = factor(data1_raw$TR04_27, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_28 = factor(data1_raw$TR04_28, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_29 = factor(data1_raw$TR04_29, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_30 = factor(data1_raw$TR04_30, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_31 = factor(data1_raw$TR04_31, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_32 = factor(data1_raw$TR04_32, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_33 = factor(data1_raw$TR04_33, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_34 = factor(data1_raw$TR04_34, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_35 = factor(data1_raw$TR04_35, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_36 = factor(data1_raw$TR04_36, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_37 = factor(data1_raw$TR04_37, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_38 = factor(data1_raw$TR04_38, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_39 = factor(data1_raw$TR04_39, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$TR04_40 = factor(data1_raw$TR04_40, levels=c("1","2"), labels=c("IN","OUT"), ordered=FALSE)
data1_raw$DM06 = factor(data1_raw$DM06, levels=c("1","2","-9"), labels=c("I agree","I disagree","[NA] Not answered"), ordered=FALSE)
data1_raw$DM02 = factor(data1_raw$DM02, levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","-9"), labels=c("18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95+","[NA] Not answered"), ordered=FALSE)
data1_raw$DM03 = factor(data1_raw$DM03, levels=c("1","2","3","-9"), labels=c("Male","Female","Not listed","[NA] Not answered"), ordered=FALSE)
data1_raw$DM05 = factor(data1_raw$DM05, levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","-9"), labels=c("Afghanistan","Albania","Algeria","Andorra","Angola","Antigua and Barbuda","Argentina","Armenia","Australia","Austria","Azerbaijan","The Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina Faso","Burundi","Cabo Verde","Cambodia","Cameroon","Canada","Central African Republic","Chad","Chile","China","Colombia","Comoros","Congo, Democratic Republic of the","Congo, Republic of the","Costa Rica","Côte d’Ivoire","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor (Timor-Leste)","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Eswatini","Ethiopia","Fiji","Finland","France","Gabon","The Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea, North","Korea, South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","[NA] Not answered"), ordered=FALSE)
data1_raw$DM10 = factor(data1_raw$DM10, levels=c("1","2","-9"), labels=c("Yes","No","[NA] Not answered"), ordered=FALSE)
data1_raw$DV02 = factor(data1_raw$DV02, levels=c("1","2","3","4","-9"), labels=c("Person D","Person K","Person M","Person R","[NA] Not answered"), ordered=FALSE)
attr(data1_raw$RG01,"1") = "freechoice"
attr(data1_raw$RG01,"2") = "assigned"
attr(data1_raw$RG02x01,"1") = "trustworthy"
attr(data1_raw$RG02x01,"2") = "untrustworthy"
attr(data1_raw$RG02x02,"1") = "trustworthy"
attr(data1_raw$RG02x02,"2") = "untrustworthy"
attr(data1_raw$TR03_01a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_02a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_03a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_04a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_05a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_06a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_07a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_08a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_09a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_10a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_11a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_12a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_13a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_14a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_15a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_16a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_17a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_18a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_19a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_20a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_21a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_22a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_23a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_24a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_25a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_26a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_27a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_28a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_29a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_30a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_31a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_32a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_33a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_34a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_35a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_36a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_37a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_38a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_39a,"-1") = "Mensuration impossible"
attr(data1_raw$TR03_40a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_01a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_02a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_03a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_04a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_05a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_06a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_07a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_08a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_09a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_10a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_11a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_12a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_13a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_14a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_15a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_16a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_17a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_18a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_19a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_20a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_21a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_22a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_23a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_24a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_25a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_26a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_27a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_28a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_29a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_30a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_31a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_32a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_33a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_34a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_35a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_36a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_37a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_38a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_39a,"-1") = "Mensuration impossible"
attr(data1_raw$TR04_40a,"-1") = "Mensuration impossible"
attr(data1_raw$DM07_01,"F") = "Not checked"
attr(data1_raw$DM07_01,"T") = "Checked"
attr(data1_raw$DM09_01,"1") = "Not at all 1"
attr(data1_raw$DM09_01,"2") = "[-2-]"
attr(data1_raw$DM09_01,"3") = "[-3-]"
attr(data1_raw$DM09_01,"4") = "[-4-]"
attr(data1_raw$DM09_01,"5") = "[-5-]"
attr(data1_raw$DM09_01,"6") = "[-6-]"
attr(data1_raw$DM09_01,"7") = "[-7-]"
attr(data1_raw$DM09_01,"8") = "[-8-]"
attr(data1_raw$DM09_01,"9") = "Very much 9"
attr(data1_raw$DM09_02,"1") = "Not at all 1"
attr(data1_raw$DM09_02,"2") = "[-2-]"
attr(data1_raw$DM09_02,"3") = "[-3-]"
attr(data1_raw$DM09_02,"4") = "[-4-]"
attr(data1_raw$DM09_02,"5") = "[-5-]"
attr(data1_raw$DM09_02,"6") = "[-6-]"
attr(data1_raw$DM09_02,"7") = "[-7-]"
attr(data1_raw$DM09_02,"8") = "[-8-]"
attr(data1_raw$DM09_02,"9") = "Very much 9"
attr(data1_raw$DM09_03,"1") = "Not at all 1"
attr(data1_raw$DM09_03,"2") = "[-2-]"
attr(data1_raw$DM09_03,"3") = "[-3-]"
attr(data1_raw$DM09_03,"4") = "[-4-]"
attr(data1_raw$DM09_03,"5") = "[-5-]"
attr(data1_raw$DM09_03,"6") = "[-6-]"
attr(data1_raw$DM09_03,"7") = "[-7-]"
attr(data1_raw$DM09_03,"8") = "[-8-]"
attr(data1_raw$DM09_03,"9") = "Very much 9"
attr(data1_raw$DV01_01,"1") = "0%"
attr(data1_raw$DV01_01,"101") = "100%"
attr(data1_raw$DV01_02,"1") = "0%"
attr(data1_raw$DV01_02,"101") = "100%"
attr(data1_raw$DV01_03,"1") = "0%"
attr(data1_raw$DV01_03,"101") = "100%"
attr(data1_raw$DV01_04,"1") = "0%"
attr(data1_raw$DV01_04,"101") = "100%"
attr(data1_raw$FINISHED,"F") = "Canceled"
attr(data1_raw$FINISHED,"T") = "Finished"
attr(data1_raw$Q_VIEWER,"F") = "Respondent"
attr(data1_raw$Q_VIEWER,"T") = "Spectator"
comment(data1_raw$SERIAL) = "Serial number (if provided)"
comment(data1_raw$REF) = "Reference (if provided in link)"
comment(data1_raw$QUESTNNR) = "Questionnaire that has been used in the interview"
comment(data1_raw$MODE) = "Interview mode"
comment(data1_raw$STARTED) = "Time the interview has started (Europe/Berlin)"
comment(data1_raw$RG01_CP) = "Condition: Complete clearances of the ballot, yet"
comment(data1_raw$RG01) = "Condition: Code drawn"
comment(data1_raw$RG02_CP) = "Trust: Complete clearances of the ballot, yet"
comment(data1_raw$RG02x01) = "Trust: Code drawn (1)"
comment(data1_raw$RG02x02) = "Trust: Code drawn (2)"
comment(data1_raw$TR03_01) = "choice: PartnerChoice"
comment(data1_raw$TR03_01a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_02) = "choice: PartnerChoice"
comment(data1_raw$TR03_02a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_03) = "choice: PartnerChoice"
comment(data1_raw$TR03_03a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_04) = "choice: PartnerChoice"
comment(data1_raw$TR03_04a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_05) = "choice: PartnerChoice"
comment(data1_raw$TR03_05a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_06) = "choice: PartnerChoice"
comment(data1_raw$TR03_06a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_07) = "choice: PartnerChoice"
comment(data1_raw$TR03_07a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_08) = "choice: PartnerChoice"
comment(data1_raw$TR03_08a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_09) = "choice: PartnerChoice"
comment(data1_raw$TR03_09a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_10) = "choice: PartnerChoice"
comment(data1_raw$TR03_10a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_11) = "choice: PartnerChoice"
comment(data1_raw$TR03_11a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_12) = "choice: PartnerChoice"
comment(data1_raw$TR03_12a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_13) = "choice: PartnerChoice"
comment(data1_raw$TR03_13a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_14) = "choice: PartnerChoice"
comment(data1_raw$TR03_14a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_15) = "choice: PartnerChoice"
comment(data1_raw$TR03_15a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_16) = "choice: PartnerChoice"
comment(data1_raw$TR03_16a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_17) = "choice: PartnerChoice"
comment(data1_raw$TR03_17a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_18) = "choice: PartnerChoice"
comment(data1_raw$TR03_18a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_19) = "choice: PartnerChoice"
comment(data1_raw$TR03_19a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_20) = "choice: PartnerChoice"
comment(data1_raw$TR03_20a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_21) = "choice: PartnerChoice"
comment(data1_raw$TR03_21a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_22) = "choice: PartnerChoice"
comment(data1_raw$TR03_22a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_23) = "choice: PartnerChoice"
comment(data1_raw$TR03_23a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_24) = "choice: PartnerChoice"
comment(data1_raw$TR03_24a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_25) = "choice: PartnerChoice"
comment(data1_raw$TR03_25a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_26) = "choice: PartnerChoice"
comment(data1_raw$TR03_26a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_27) = "choice: PartnerChoice"
comment(data1_raw$TR03_27a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_28) = "choice: PartnerChoice"
comment(data1_raw$TR03_28a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_29) = "choice: PartnerChoice"
comment(data1_raw$TR03_29a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_30) = "choice: PartnerChoice"
comment(data1_raw$TR03_30a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_31) = "choice: PartnerChoice"
comment(data1_raw$TR03_31a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_32) = "choice: PartnerChoice"
comment(data1_raw$TR03_32a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_33) = "choice: PartnerChoice"
comment(data1_raw$TR03_33a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_34) = "choice: PartnerChoice"
comment(data1_raw$TR03_34a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_35) = "choice: PartnerChoice"
comment(data1_raw$TR03_35a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_36) = "choice: PartnerChoice"
comment(data1_raw$TR03_36a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_37) = "choice: PartnerChoice"
comment(data1_raw$TR03_37a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_38) = "choice: PartnerChoice"
comment(data1_raw$TR03_38a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_39) = "choice: PartnerChoice"
comment(data1_raw$TR03_39a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR03_40) = "choice: PartnerChoice"
comment(data1_raw$TR03_40a) = "choice: PartnerChoice response time [ms]"
comment(data1_raw$TR04_01) = "Assigned: I/O"
comment(data1_raw$TR04_01a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_02) = "Assigned: I/O"
comment(data1_raw$TR04_02a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_03) = "Assigned: I/O"
comment(data1_raw$TR04_03a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_04) = "Assigned: I/O"
comment(data1_raw$TR04_04a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_05) = "Assigned: I/O"
comment(data1_raw$TR04_05a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_06) = "Assigned: I/O"
comment(data1_raw$TR04_06a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_07) = "Assigned: I/O"
comment(data1_raw$TR04_07a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_08) = "Assigned: I/O"
comment(data1_raw$TR04_08a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_09) = "Assigned: I/O"
comment(data1_raw$TR04_09a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_10) = "Assigned: I/O"
comment(data1_raw$TR04_10a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_11) = "Assigned: I/O"
comment(data1_raw$TR04_11a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_12) = "Assigned: I/O"
comment(data1_raw$TR04_12a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_13) = "Assigned: I/O"
comment(data1_raw$TR04_13a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_14) = "Assigned: I/O"
comment(data1_raw$TR04_14a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_15) = "Assigned: I/O"
comment(data1_raw$TR04_15a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_16) = "Assigned: I/O"
comment(data1_raw$TR04_16a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_17) = "Assigned: I/O"
comment(data1_raw$TR04_17a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_18) = "Assigned: I/O"
comment(data1_raw$TR04_18a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_19) = "Assigned: I/O"
comment(data1_raw$TR04_19a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_20) = "Assigned: I/O"
comment(data1_raw$TR04_20a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_21) = "Assigned: I/O"
comment(data1_raw$TR04_21a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_22) = "Assigned: I/O"
comment(data1_raw$TR04_22a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_23) = "Assigned: I/O"
comment(data1_raw$TR04_23a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_24) = "Assigned: I/O"
comment(data1_raw$TR04_24a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_25) = "Assigned: I/O"
comment(data1_raw$TR04_25a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_26) = "Assigned: I/O"
comment(data1_raw$TR04_26a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_27) = "Assigned: I/O"
comment(data1_raw$TR04_27a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_28) = "Assigned: I/O"
comment(data1_raw$TR04_28a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_29) = "Assigned: I/O"
comment(data1_raw$TR04_29a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_30) = "Assigned: I/O"
comment(data1_raw$TR04_30a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_31) = "Assigned: I/O"
comment(data1_raw$TR04_31a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_32) = "Assigned: I/O"
comment(data1_raw$TR04_32a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_33) = "Assigned: I/O"
comment(data1_raw$TR04_33a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_34) = "Assigned: I/O"
comment(data1_raw$TR04_34a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_35) = "Assigned: I/O"
comment(data1_raw$TR04_35a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_36) = "Assigned: I/O"
comment(data1_raw$TR04_36a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_37) = "Assigned: I/O"
comment(data1_raw$TR04_37a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_38) = "Assigned: I/O"
comment(data1_raw$TR04_38a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_39) = "Assigned: I/O"
comment(data1_raw$TR04_39a) = "Assigned: I/O response time [ms]"
comment(data1_raw$TR04_40) = "Assigned: I/O"
comment(data1_raw$TR04_40a) = "Assigned: I/O response time [ms]"
comment(data1_raw$DM06) = "AttCheck"
comment(data1_raw$DM02) = "Age"
comment(data1_raw$DM03) = "Gender"
comment(data1_raw$DM05) = "Country of residence"
comment(data1_raw$DM07) = "consent: Residual option (negative) or number of selected options"
comment(data1_raw$DM07_01) = "consent: I hereby declare that I have read the information letter about the Choice study and agree to participate in the study."
comment(data1_raw$DM09_01) = "AttentionCheck: I prefer to get bonuses over steady income (1)"
comment(data1_raw$DM09_02) = "AttentionCheck: I think receiving a bonus within 2 weeks is fast enough (2)"
comment(data1_raw$DM09_03) = "AttentionCheck: I prefer experiments where I can interact with other people (3)"
comment(data1_raw$DM10) = "Understanding"
comment(data1_raw$DM11_01) = "Questions: [01]"
comment(data1_raw$IV01_RV1) = "POST/GET Variable: PROLIFIC_PID"
comment(data1_raw$IV01_RV2) = "POST/GET Variable: STUDY_ID"
comment(data1_raw$IV01_RV3) = "POST/GET Variable: SESSION_ID"
comment(data1_raw$IV02_01) = "Sequence: Partner M"
comment(data1_raw$IV02_02) = "Sequence: Partner D"
comment(data1_raw$IV02_03) = "Sequence: Partner K"
comment(data1_raw$IV02_04) = "Sequence: Partner R"
comment(data1_raw$IV04_01) = "Partner: [No Description] 01"
comment(data1_raw$IV04_02) = "Partner: [No Description] 02"
comment(data1_raw$IV04_03) = "Partner: [No Description] 03"
comment(data1_raw$IV04_04) = "Partner: [No Description] 04"
comment(data1_raw$IV04_05) = "Partner: [No Description] 05"
comment(data1_raw$IV04_06) = "Partner: [No Description] 06"
comment(data1_raw$IV04_07) = "Partner: [No Description] 07"
comment(data1_raw$IV04_08) = "Partner: [No Description] 08"
comment(data1_raw$IV04_09) = "Partner: [No Description] 09"
comment(data1_raw$IV04_10) = "Partner: [No Description] 10"
comment(data1_raw$IV04_11) = "Partner: [No Description] 11"
comment(data1_raw$IV04_12) = "Partner: [No Description] 12"
comment(data1_raw$IV04_13) = "Partner: [No Description] 13"
comment(data1_raw$IV04_14) = "Partner: [No Description] 14"
comment(data1_raw$IV04_15) = "Partner: [No Description] 15"
comment(data1_raw$IV04_16) = "Partner: [No Description] 16"
comment(data1_raw$IV04_17) = "Partner: [No Description] 17"
comment(data1_raw$IV04_18) = "Partner: [No Description] 18"
comment(data1_raw$IV04_19) = "Partner: [No Description] 19"
comment(data1_raw$IV04_20) = "Partner: [No Description] 20"
comment(data1_raw$IV04_21) = "Partner: [No Description] 21"
comment(data1_raw$IV04_22) = "Partner: [No Description] 22"
comment(data1_raw$IV04_23) = "Partner: [No Description] 23"
comment(data1_raw$IV04_24) = "Partner: [No Description] 24"
comment(data1_raw$IV04_25) = "Partner: [No Description] 25"
comment(data1_raw$IV04_26) = "Partner: [No Description] 26"
comment(data1_raw$IV04_27) = "Partner: [No Description] 27"
comment(data1_raw$IV04_28) = "Partner: [No Description] 28"
comment(data1_raw$IV04_29) = "Partner: [No Description] 29"
comment(data1_raw$IV04_30) = "Partner: [No Description] 30"
comment(data1_raw$IV04_31) = "Partner: [No Description] 31"
comment(data1_raw$IV04_32) = "Partner: [No Description] 32"
comment(data1_raw$IV04_33) = "Partner: [No Description] 33"
comment(data1_raw$IV04_34) = "Partner: [No Description] 34"
comment(data1_raw$IV04_35) = "Partner: [No Description] 35"
comment(data1_raw$IV04_36) = "Partner: [No Description] 36"
comment(data1_raw$IV04_37) = "Partner: [No Description] 37"
comment(data1_raw$IV04_38) = "Partner: [No Description] 38"
comment(data1_raw$IV04_39) = "Partner: [No Description] 39"
comment(data1_raw$IV04_40) = "Partner: [No Description] 40"
comment(data1_raw$IV06_01) = "winlose: [No Description] 01"
comment(data1_raw$IV06_02) = "winlose: [No Description] 02"
comment(data1_raw$IV06_03) = "winlose: [No Description] 03"
comment(data1_raw$IV06_04) = "winlose: [No Description] 04"
comment(data1_raw$IV06_05) = "winlose: [No Description] 05"
comment(data1_raw$IV06_06) = "winlose: [No Description] 06"
comment(data1_raw$IV06_07) = "winlose: [No Description] 07"
comment(data1_raw$IV06_08) = "winlose: [No Description] 08"
comment(data1_raw$IV06_09) = "winlose: [No Description] 09"
comment(data1_raw$IV06_10) = "winlose: [No Description] 10"
comment(data1_raw$IV06_11) = "winlose: [No Description] 11"
comment(data1_raw$IV06_12) = "winlose: [No Description] 12"
comment(data1_raw$IV06_13) = "winlose: [No Description] 13"
comment(data1_raw$IV06_14) = "winlose: [No Description] 14"
comment(data1_raw$IV06_15) = "winlose: [No Description] 15"
comment(data1_raw$IV06_16) = "winlose: [No Description] 16"
comment(data1_raw$IV06_17) = "winlose: [No Description] 17"
comment(data1_raw$IV06_18) = "winlose: [No Description] 18"
comment(data1_raw$IV06_19) = "winlose: [No Description] 19"
comment(data1_raw$IV06_20) = "winlose: [No Description] 20"
comment(data1_raw$IV06_21) = "winlose: [No Description] 21"
comment(data1_raw$IV06_22) = "winlose: [No Description] 22"
comment(data1_raw$IV06_23) = "winlose: [No Description] 23"
comment(data1_raw$IV06_24) = "winlose: [No Description] 24"
comment(data1_raw$IV06_25) = "winlose: [No Description] 25"
comment(data1_raw$IV06_26) = "winlose: [No Description] 26"
comment(data1_raw$IV06_27) = "winlose: [No Description] 27"
comment(data1_raw$IV06_28) = "winlose: [No Description] 28"
comment(data1_raw$IV06_29) = "winlose: [No Description] 29"
comment(data1_raw$IV06_30) = "winlose: [No Description] 30"
comment(data1_raw$IV06_31) = "winlose: [No Description] 31"
comment(data1_raw$IV06_32) = "winlose: [No Description] 32"
comment(data1_raw$IV06_33) = "winlose: [No Description] 33"
comment(data1_raw$IV06_34) = "winlose: [No Description] 34"
comment(data1_raw$IV06_35) = "winlose: [No Description] 35"
comment(data1_raw$IV06_36) = "winlose: [No Description] 36"
comment(data1_raw$IV06_37) = "winlose: [No Description] 37"
comment(data1_raw$IV06_38) = "winlose: [No Description] 38"
comment(data1_raw$IV06_39) = "winlose: [No Description] 39"
comment(data1_raw$IV06_40) = "winlose: [No Description] 40"
comment(data1_raw$IV07_01) = "Accounts: Account Participant"
comment(data1_raw$IV07_02) = "Accounts: Account D"
comment(data1_raw$IV07_03) = "Accounts: Account K"
comment(data1_raw$IV07_04) = "Accounts: Account M"
comment(data1_raw$IV07_05) = "Accounts: Account R"
comment(data1_raw$IV08_01) = "Order control: [No Description] 01"
comment(data1_raw$IV09_01) = "Earned: [No Description] 01"
comment(data1_raw$DV01_01) = "Trustworthiness: [No Description] 01"
comment(data1_raw$DV01_02) = "Trustworthiness: [No Description] 02"
comment(data1_raw$DV01_03) = "Trustworthiness: [No Description] 03"
comment(data1_raw$DV01_04) = "Trustworthiness: [No Description] 04"
comment(data1_raw$DV02) = "Preference"
comment(data1_raw$TIME001) = "Time spent on page 1"
comment(data1_raw$TIME002) = "Time spent on page 2"
comment(data1_raw$TIME003) = "Time spent on page 3"
comment(data1_raw$TIME004) = "Time spent on page 4"
comment(data1_raw$TIME005) = "Time spent on page 5"
comment(data1_raw$TIME006) = "Time spent on page 6"
comment(data1_raw$TIME007) = "Time spent on page 7"
comment(data1_raw$TIME008) = "Time spent on page 8"
comment(data1_raw$TIME009) = "Time spent on page 9"
comment(data1_raw$TIME010) = "Time spent on page 10"
comment(data1_raw$TIME011) = "Time spent on page 11"
comment(data1_raw$TIME012) = "Time spent on page 12"
comment(data1_raw$TIME013) = "Time spent on page 13"
comment(data1_raw$TIME014) = "Time spent on page 14"
comment(data1_raw$TIME015) = "Time spent on page 15"
comment(data1_raw$TIME016) = "Time spent on page 16"
comment(data1_raw$TIME_SUM) = "Time spent overall (except outliers)"
comment(data1_raw$MAILSENT) = "Time when the invitation mailing was sent (personally identifiable recipients, only)"
comment(data1_raw$LASTDATA) = "Time when the data was most recently updated"
comment(data1_raw$FINISHED) = "Has the interview been finished (reached last page)?"
comment(data1_raw$Q_VIEWER) = "Did the respondent only view the questionnaire, omitting mandatory questions?"
comment(data1_raw$LASTPAGE) = "Last page that the participant has handled in the questionnaire"
comment(data1_raw$MAXPAGE) = "Hindmost page handled by the participant"
comment(data1_raw$MISSING) = "Missing answers in percent"
comment(data1_raw$MISSREL) = "Missing answers (weighted by relevance)"
comment(data1_raw$TIME_RSI) = "Degradation points for being very fast"
comment(data1_raw$DEG_TIME) = "Degradation points for being very fast"



# Assure that the comments are retained in subsets
as.data.frame.avector = as.data.frame.vector
`[.avector` <- function(x,i,...) {
  r <- NextMethod("[")
  mostattributes(r) <- attributes(x)
  r
}
data1_raw_tmp = data.frame(
  lapply(data1_raw, function(x) {
    structure( x, class = c("avector", class(x) ) )
  } )
)
mostattributes(data1_raw_tmp) = attributes(data1_raw)
data1_raw = data1_raw_tmp
rm(data1_raw_tmp)

