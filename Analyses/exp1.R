# Setup -------------------------------------------------------------------

if (!require(needs)) {install.packages("needs"); library(needs)}
if (!require(goallabr)) {
  if (!require(devtools)) {install.packages("devtools"); library(devtools)}
  install_github("chrisharrisUU/goallabr")
}
needs(BayesFactor, dplyr, ggplot2, ggsci, goallabr,
      gridExtra, haven, Hmisc, here, lme4, lmerTest,
      magrittr, mclogit, tidyr, papaja, purrr, svglite)
prioritize(dplyr)

# Color palette for graphs
pal <- ggsci::pal_uchicago()(5)[c(3, 5, 1, 6)]

# Functions ---------------------------------------------------------------

# Import functions from GitHub
# https://stackoverflow.com/a/35720824/10357426
source_https <- function(u, unlink.tmp.certs = FALSE) {
  # load package
  if (!require(RCurl)) {install.packages("RCurl"); library(RCurl)}
  
  # read script lines from website using a security certificate
  if (!file.exists(here("Auxiliary/cacert.pem"))) {
    download.file(url = "http://curl.haxx.se/ca/cacert.pem", destfile = here("Auxiliary/cacert.pem"))
  }
  script <- getURL(u, followlocation = TRUE, cainfo = here("Auxiliary/cacert.pem"))
  if (unlink.tmp.certs) {unlink(here("Auxiliary/cacert.pem"))}
  
  # parase lines and evealuate in the global environement
  eval(parse(text = script), envir = .GlobalEnv)
}

# My functions for outputting inference tests in APAish style
source_https("https://raw.githubusercontent.com/chrisharrisUU/testoutputs/master/functions.R")

# Data import -------------------------------------------------------------

source(here("Auxiliary/exp1_import.r"))
rm(as.data.frame.avector, `[.avector`)

# Data cleaning -----------------------------------------------------------

rename_variables <- function(.data) {
  # ID
  id <- .data$IV01_RV1
  
  # Conditions
  cond <- ifelse(.data$RG01 == '1', "free choice", "forced choice")
  trustKR <- ifelse(.data$RG02x01 == '2', "K", "R") # Dummy variable that = 1 when K is the cooperator and 0 when R is the cooperator
  trustDM <- ifelse(.data$RG02x02 == '2', "D", "M") # Same thing but for D and M respectively
  
  # Free choice trials
  trials <- .data %>%
    select(contains("TR03")) %>%
    select(-contains("a"))
  
  opting <- .data %>%
    select(contains("TR04")) %>%
    select(-contains("a"))
  
  forcedtrials <- .data %>%
    select(contains("IV04")) %>%
    mutate(across(.cols = contains("IV04"),
                  .fns = ~case_when(.x == 1 ~ "D",
                                    .x == 2 ~ "K",
                                    .x == 3 ~ "M",
                                    .x == 4 ~ "R",
                                    TRUE ~ "error")))
  
  # DVs
  dvs <- .data %>%
    transmute(trustworthiness_D = DV01_01,
              trustworthiness_K = DV01_02,
              trustworthiness_M = DV01_03,
              trustworthiness_R = DV01_04,
              preference = DV02) #1 = D, 2 = K, 3 = M, 4 = R
  
  # Demographics
  dem <- .data %>%
    transmute(age = DM02,
              gender = DM03,
              residence = DM05,
              attcheck1 = DM09_01,
              attcheck2 = DM09_02,
              attcheck3 = DM09_03,
              understanding = DM10,
              openresponse = DM11_01)
  
  # Earned
  account <- .data$IV09_01
  
  cbind(id, cond, trustDM, trustKR, trials, opting, forcedtrials, dvs, dem, account)
}
data1 <- rename_variables(data1_raw) %>%
  mutate(attentionscore = ifelse(attcheck1 == 6, 1, 0) + ifelse(attcheck2 == 9, 1, 0) + ifelse(attcheck2 == 9, 1, 0)) %>%
  filter(attentionscore > 1)

# Prolific ----------------------------------------------------------------

# # Approval
# data1 %>%
#   select(id) %>%
#   # summarize(N = n())
#   write.csv(file = "Output/Prolific/exp1_Prolific_confirmed.csv", row.names = FALSE)
# 
# # Extra earnings
# data1 %>%
#   mutate(extra_earnings = round(as.numeric(account) - 1, digits = 2)) %>%
#   select(id, extra_earnings) %>%
#   filter(extra_earnings > 0) %>%
#   # summarize(M = mean(extra_earnings),
#   #           min = min(extra_earnings),
#   #           max = max(extra_earnings))
#   transmute(pay = paste(id, extra_earnings, sep = ",")) %>%
#   write.csv(file = "Output/Prolific/exp1_Prolific_earnings.csv", row.names = FALSE)
# 
# # Excluded participants
# rename_variables(data1_raw) %>%
#   mutate(attentionscore = ifelse(attcheck1 == 6, 1, 0) + ifelse(attcheck2 == 9, 1, 0) + ifelse(attcheck2 == 9, 1, 0)) %>%
#   filter(attentionscore < 2) %>%
#   select(id, attentionscore) %>%
#   filter(id == "5f2e22b0d49b95188fd9b5a3")
# 
# findparticipant <- function(.id) {
#   data1_raw %>%
#     rename_variables() %>%
#     mutate(attentionscore = ifelse(attcheck1 == 6, 1, 0) + ifelse(attcheck2 == 9, 1, 0) + ifelse(attcheck2 == 9, 1, 0)) %>%
#     filter(attentionscore < 2) %>%
#     select(id, attentionscore) %>%
#     filter(id == .id)
# }
# 
# data1_raw %>%
#   rename_variables() %>%
#   mutate(attentionscore = ifelse(attcheck1 == 6, 1, 0) + ifelse(attcheck2 == 9, 1, 0) + ifelse(attcheck2 == 9, 1, 0)) %>%
#   select(id, attentionscore) %>%
#   filter(id == "59b7eb9791f20c00012fe164")


# Counterbalancing --------------------------------------------------------

df_est <- data1 %>%
  mutate(trust_trust     = ifelse(trustDM == "D", trustworthiness_D, trustworthiness_M),
         trust_notrust   = ifelse(trustDM == "D", trustworthiness_M, trustworthiness_D),
         notrust_trust   = ifelse(trustKR == "K", trustworthiness_K, trustworthiness_R),
         notrust_notrust = ifelse(trustKR == "K", trustworthiness_R, trustworthiness_K)) %>%
  select(id, cond, contains("trust_"), contains("notrust_")) %>%
  pivot_longer(cols = -c(id, cond),
               names_to = "condhelp",
               values_to = "trust") %>%
  mutate(behavior = ifelse(condhelp == "trust_trust" | condhelp == "notrust_trust", "Cooperator", "Defector"),
         looks = ifelse(condhelp == "trust_trust" | condhelp == "trust_notrust", "high-TW", "low-TW")) %>%
  select(-condhelp) %>%
  mutate(cond = factor(cond, levels = c("forced choice", "free choice")),
         looks = factor(looks, levels = c("low-TW", "high-TW")),
         behavior = factor(behavior))

df_pref <- data1 %>%
  select(cond, preference, trustDM, trustKR) %>%
  mutate(pref_helper = substr(preference, 8, 8)) %>%
  mutate(pref_behav = ifelse(pref_helper == trustDM | pref_helper == trustKR, "Cooperator", "Defector"),
         pref_looks = ifelse(pref_helper == "M" | pref_helper == "D", "high-TW", "low-TW")) %>%
  mutate(pref_behav = factor(pref_behav, levels = c("Defector", "Cooperator")),
         pref_looks = factor(pref_looks, levels = c("low-TW", "high-TW")))

df_samp <- data1 %>%
  filter(cond == "free choice") %>%
  mutate(across(.cols = contains("TR03"),
                .fns = ~substr(.x, 8, 8))) %>%
  mutate(across(.cols = contains("TR03"),
                .fns = ~ifelse(.x == "M" | .x == "D",
                               ifelse(.x == trustDM | .x == trustKR, "high-TW_Cooperator", "high-TW_Defector"),
                               ifelse(.x == trustDM | .x == trustKR, "low-TW_Cooperator", "low-TW_Defector")))) %>%
  select(id, contains("TR03")) %>%
  pivot_longer(cols = -c(id),
               names_to = "trial",
               values_to = "choice") %>%
  mutate(trial = substr(trial, 6, 7)) %>%
  mutate(trial = as.double(trial)) %>%
  group_by(trial, choice) %>%
  summarize(count = n(),
            .groups = "drop_last")

df_samp2 <- data1 %>%
  filter(cond == "forced choice") %>%
  mutate(across(.cols = contains("IV04"),
                .fns = ~ifelse(.x == "M" | .x == "D",
                               ifelse(.x == trustDM | .x == trustKR, "high-TW_Cooperator", "high-TW_Defector"),
                               ifelse(.x == trustDM | .x == trustKR, "low-TW_Cooperator", "low-TW_Defector")))) %>%
  select(id, contains("TR04"), contains("IV04")) %>%
  rename_with(.cols = contains("TR04"),
              .fn = ~paste0("tr", 1:40)) %>%
  rename_with(.cols = contains("IV04"),
              .fn = ~paste0("pa", 1:40)) %>%
  pivot_longer(cols = -c(id),
               names_to = c(".value", ".value", "trial"),
               names_pattern = "(.)(.)(.)") %>%
  mutate(trial = as.double(trial),
         pa = factor(pa)) %>%
  rename(opting = tr,
         partner = pa) %>%
  mutate(choice = ifelse(opting == "IN", 1, 0)) %>%
  group_by(trial, partner) %>%
  summarize(M = mean(choice),
            .groups = "drop_last")

# Sampling ----------------------------------------------------------------

df_samp %>%
  ggplot(aes(x = trial,
             y = count,
             color = choice)) +
  geom_point(size = .9) +
  geom_line(size = .2,
            alpha = .3) +
  geom_smooth(method = "loess",
              span = 1,
              size = 1,
              formula = "y ~ x") +
  scale_color_manual(values = pal, name = "Group") +
  theme_apa() +
  labs(y = "Number of participants choosing this partner",
       x = "Trial number") +
  guides(color = guide_legend(title = "Partner type"))
# ggsave(filename = "Output/sampling1.svg", device = "svg", dpi = 320, width = 9.08, height = 5.72)


df_samp2 %>%
  ggplot(aes(x = trial,
             y = M,
             color = partner)) +
  geom_point(size = .9) +
  geom_line(size = .2,
            alpha = .3) +
  geom_smooth(method = "loess",
              span = 1,
              size = 1,
              formula = "y ~ x") +
  scale_color_manual(values = pal, name = "Group") +
  theme_apa() +
  labs(y = "Number of participants choosing this partner",
       x = "Trial number") +
  guides(color = guide_legend(title = "Partner type"))

# Estimation --------------------------------------------------------------

# Means
df_est %>%
  group_by(cond, behavior, looks) %>%
  summarize(M = mean(trust),
            SD = sd(trust),
            .groups = "drop_last")

# Graph
df_est %>%
  # Aggregate data
  group_by(cond, behavior, looks) %>%
  summarize(Mtrust = mean(trust),
            CIlower = mean(trust) - sd(trust),
            CIupper = mean(trust) + sd(trust),
            .groups = "drop_last") %>%
  # Build plot
  ggplot(aes(x = looks,
             y = Mtrust,
             color = behavior)) +
  geom_pointrange(aes(ymin = CIlower, ymax = CIupper)) +
  scale_color_manual(values = pal, name = "Partner type") +
  theme_apa() +
  facet_wrap(~ cond) +
  labs(y = "Trustworthiness belief",
       x = "Facial appearance")
  

# Model using lme4 and lmerTest
df_est %>%
  lmer(trust ~ cond * behavior * looks + (1|id), data = .) %>%
  summary()

# Preference --------------------------------------------------------------

# Table
df_pref %$% table(pref_looks, pref_behav)

# Graph
df_pref %>%
  ggplot() +
  geom_count(aes(x = pref_looks,
                 y = pref_behav)) +
  facet_wrap(~ cond) +
  theme_apa() +
  labs(y = "Partner type",
       x = "Facial appearance")