# Setup -------------------------------------------------------------------

if (!require(needs)) {install.packages("needs"); library(needs)}
if (!require(goallabr)) {
  if (!require(devtools)) {install.packages("devtools"); library(devtools)}
  install_github("chrisharrisUU/goallabr")
}
needs(BayesFactor, dplyr, ggplot2, ggsci, goallabr,
      gridExtra, haven, Hmisc, here, lme4, lmerTest,
      magrittr, tidyr, papaja, purrr, svglite)
prioritize(dplyr)

# Color palette for graphs
pal <- ggsci::pal_uchicago()(5)[c(3, 5, 1)]

# source(here("Auxiliary/functions.R"))

# Data import -------------------------------------------------------------

# source(here("Auxiliary/exp1_import.r"))
rm(as.data.frame.avector, `[.avector`)