# Siehe CheatSheet: befehlsreferenzen/RStudio (Hg) - Data Wrangling with dplyr.pdf
library(tidyverse)

ae = read.csv(file = "data/ae.csv", 
              sep = ",", header = TRUE, quote = "\"'")

head(ae)

summary(ae)

head(tibble::as_tibble(ae))

dplyr::glimpse(ae)

# select() wählt Variablen aus
# %>% wird als Piping-Operator bezeichnet, das Ergebnis links 
# wird als Eingabe rechts an erster Stelle eingegeben.
# select() in dieser Form entspricht dem KEEP in SAS.
ae1 <- ae %>% select(DOMAIN, USUBJID, AEDECOD, AEBODSYS)
head(ae1)

# Die Domain soll ebenfalls entfernt werden. Mehrere Variablen 
# werden als Vektor übergeben -c(DOMAIN, AEDECOD)
# select mit Minus-Zeichen entspricht dem DROP in SAS.
ae2 <- ae1 %>% select(-DOMAIN)
head(ae2)

ae %>% select(ends_with("DY")) %>% head()

ae %>% select(starts_with("AELLT")) %>% head()

ae %>% select(matches(".ST.")) %>% head()

ae1 %>% filter(AEDECOD == "ERYTHEMA") %>% head()

ae1 %>% filter(AEDECOD == "ERYTHEMA" & USUBJID == "01-701-1023") %>% head()

ae1 %>% filter(AEDECOD == "ERYTHEMA" | USUBJID == "01-701-1023") %>% head()

# Bestimmte Beobachtungen herausschneiden
head(ae1)
ae2 <- ae1 %>% slice(2:4)
ae2

ae1 %>% 
  group_by(AEDECOD) %>%
  count()

# Häufigkeitstabellen
ae1_pct <- ae1 %>% 
  group_by(AEDECOD) %>%
  count() %>%
  ungroup() %>%
  mutate(pct = round(n / sum(n) * 100, 2),
         pct2 = n/sum(n) * 100)
ae1_pct
# Cave: Zu frühes Runden ...
sum(ae1_pct$pct)
sum(ae1_pct$pct2)




# Einen Vektor erzeugen, der einen Studienteilnehmer enthält, der nicht
# in der AE-Tabelle ist und zwei Studienteilnehmer herausnehmen, die in der 
# AE-Tabelle sind.
v1 <- c(head(unique(ae$USUBJID), length(unique(ae$USUBJID)) - 2),
        "01-700-1000")
set.seed(123)
v2 <- sample(c("TRT_A", "TRT_B", "TRT_C"), length(v1), replace = TRUE)

df_trt <- data.frame("USUBJID" = v1, "TRTP" = v2) %>%
  arrange(USUBJID)
head(df_trt)

# Alle AEs, die ein Treatment haben und alle Treamtents,
# die kein AE haben.
df_all <- full_join(ae, df_trt, by = c("USUBJID"), ) %>% 
  select(USUBJID, AETERM, TRTP) %>%
  filter(is.na(AETERM) | is.na(TRTP))
df_all

# Zahl der Patienten mit AE und ohne Treatment
df_all %>%
  filter(is.na(TRTP)) %>%
  select(USUBJID) %>%
  unique() %>%
  count() %>%
  pull()

# Zahl der Patienten mit Treatment und ohne AE
df_all %>%
  filter(is.na(AETERM)) %>%
  select(USUBJID) %>%
  unique() %>%
  count() %>%
  pull()


