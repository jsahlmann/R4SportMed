# Erste Schritte
#
# R-Dateien sind Programmdateien, die man schrittweise oder insgesamt ausführen kann.
# Es sind normale Textdateien, die mit jedem Editor bearbeitet werden können.
#
# Wir fangen jetzt mit dem Einlesen von Daten an.

library(readxl) # Mit Paketen bzw. Packages kann man die Funktionalitäten erweitern.
my_data <- read_excel("erste_schritte/studiendaten.xlsx")
View(my_data)

str(my_data)

summary(my_data)

head(my_data)

class(my_data)
class(my_data$id)
class(my_data$gender)
class(my_data$dob)
class(my_data$ic)
class(my_data$intervention)
class(my_data$heartrate)
class(my_data$score)

# Wir haben die Datentypen
# - data.frame
# - character
# - numeric
# - integer
# - Date (integer oder numeric)
#
# Jeder Typ hat seine Anwendungen und man sollte die Typen so genau wie möglich
# festlegen. Das verhindert später auch Fehler beim Rechnen.

# Wir machen einen kurzen Exkurs zu den verschiedenen Datentypen.

file.edit("t0_start/0_1_datentypen_vektoren.r")

# Das war ein schneller Überblick über die verschiedenen Datentypen und den
# Vektor als erste Datentruktur.
# Wir überspringen aus Zeitgründen die Datenstruktur Liste und wenden uns gleich
# der Datenstruktur data.frame zu, die wir bereits oben gesehen haben.

file.edit("t0_start/0_3_data_frames.r")

# data.frame sind eine gute Grundlage, um seine Studiendaten zu speichern und
# weiter zu verarbeiten.
# Das Package tidyverse ist aktuell der wichtigste Baustein, um die Daten weiter
# zu bearbeiten und zu aggregieren.

file.edit("t0_start/0_4_tidyverse.r")

# Wir können Packages aus tidyverse für die Bearbeitung und Analyse
# unser Studiendaten benutzen.

my_data %>%
  group_by(gender) %>%
  count()

my_data %>%
  group_by(gender) %>%
  count() %>%
  mutate(pct = round(n/nrow(my_data) * 100, 2))

my_data %>%
  group_by(gender, intervention) %>%
  count()

my_data %>%
  group_by(gender, intervention) %>%
  count() %>%
  mutate(pct = round(n/nrow(my_data) * 100, 2))

my_data %>%
  group_by(gender, intervention) %>%
  count() %>%
  mutate(pct = round(n/nrow(my_data) * 100, 2)) %>%
  ungroup() %>%
  summarise(pct_sum = sum(pct))

my_data %>%
  group_by(intervention) %>%
  summarise(
    mean1 = mean(heartrate),
    min1 = min(heartrate),
    max1 = max(heartrate),
    median1 = median(heartrate),
    sd1 = sd(heartrate)
  )

my_data %>%
  group_by(intervention, gender) %>%
  summarise(
    mean1 = mean(heartrate),
    min1 = min(heartrate),
    max1 = max(heartrate),
    median1 = median(heartrate),
    sd1 = sd(heartrate)
  )

df_summarise<- my_data %>%
  group_by(intervention) %>%
  summarise(
    mean1 = mean(heartrate),
    min1 = min(heartrate),
    max1 = max(heartrate),
    median1 = median(heartrate),
    sd1 = sd(heartrate)
  )

library(flextable)
df_summarise %>%
  flextable()

# Das Paket / Package flextable() ist ein sehr mächtiges Paket für die
# Tabellengestaltung.
# Wir kommen noch darauf zurück.
#
# Zunächst noch ein kleiner Grafikeinschub.
#

file.edit("t0_ggplot2/ggplot2_start.R")


file.edit("t0_ggplot2/0_6_ggpot_vs.r")

file.edit("t1_table_1/t1_ablauf.R")

file.edit("t2_ae_tables/t2_ablauf.R")

