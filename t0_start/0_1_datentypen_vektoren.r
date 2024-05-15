# R kann verschiedene Datentypen verarbeiten.
# Datentypen unterscheiden sich in den Funktionen, die auf sie ausgeführt 
# werden können und in ihrem Speicherbedarf.
# Siehe CheatSheet: befehlsreferenzen/McNeill 2015 - Base R.pdf

# Integer
# Die Funktion c() kombiniert mehrere Elemente zu einem Vektor.
# Unterschiedliche Typen werden in den allgemeinsten Typ umgewandelt (gecastet).
v <- c(1L, 2L, 3L)
v

typeof(v)

str(v)

# Double
v <- c(1.0, 2.0, 3.0)
v

typeof(v)

str(v)

# Logical
v <- c(TRUE, FALSE, FALSE, TRUE)
v

typeof(v)

str(v)

# Character
v <- c("Anton", "Berta", "Christine")
v

typeof(v)

str(v)

# Auf Stringverarbeitung wird an dieser Stelle nicht eingegangen.
# Siehe Dokumentation zum Paket stringr
# Anderer Kurs bei Gelegenheit ...

# Einfache komplexe Zahl.
complex_value <- 3 + 2i
complex_value

typeof(complex_value)

str(complex_value)

sqrt(-1)
sqrt(-1+0i)
(0+1i)**2

# Vektor von komplexen Zahlen.
complex_vector <- complex(real = c(1, 2, 3), 
                          imaginary = c(3, 2,1))
complex_vector

typeof(complex_vector)

str(complex_vector)

# Raw Daten sind byteweise Darstellungen.
v <- charToRaw(c("Hallo!"))
v
v1 <- charToRaw(c("ÖPNV"))
v1
v2 <- charToRaw(c("OPNV"))
v2

typeof(v)

str(v)


# Vektor aus unterschiedlichen Typen führt zu Typumwandlungen.
v <- c(1L, 1, TRUE)
v
typeof(v)
str(v)

v <- c(1L, 1, TRUE, "abc")
v
typeof(v)
str(v)


# seq() erzeugt eine Sequenz von Elementen mit 
v1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
v1
v1 <- seq(1:10)
v1
v2 <- seq(1, 10, by = 0.5)
v2
v3 <- seq(0, 100, by = 10)
v3
# rep() wiederholt kompletten Vektor oder elementweise
v4 <- c("rot", "gelb", "grün", "blau", "schwarz", "weiß")
v4
v5 <- rep(v4, times = 2)
v5
v6 <- rep(v4, each = 2)
v6

# Elemente auswählen nach Position
v4
v4[3] # das dritte Element
v4[-v3] # alle außer dem dritten Element
v4[3:5] # Elemente 3 bis 5
v4[-(3:5)] # alle außer den Elementen 3 bis 5
v4[c(2, 4)] # Element 2 und Element 4
v4[length(v4)] # Letztes Element, eine von vielen Möglichkeiten


# Elemente auswählen nach Wert
v2
v2[v2 == 4] # Element gleich 4
v2[v2 < 4] # Elemente kleiner als 4
mychoice <- c(2, 4, 6, 8, 10, 12)
v2[v2 %in% mychoice]

# Vektor sortieren
v5
sort(v5)
order(v5)

# Im Vektor die Reihenfolge der Elemente umkehren
rev(v5)
rev(sort(v5))

# Eindeutige Elemente ausgeben / Dubletten entfernen
unique(v5)
sort(unique(v5))

# Einfache Häufigkeitstabelle
table(v5)

# Einfache Stichprobe mit Häufigkeitstabelle
set.seed(123)
n <- 1000
s1 <- sample(x = c("rot", "gelb", "grün"), 
             size = n, 
             replace = TRUE, 
             prob = c(1/4, 1/4, 1/2))
table(s1)
dfs1 <- data.frame(table(s1))

dfs1$Pct <- dfs1$Freq/n*100
dfs1



# Matrizen
m1 <- matrix(seq(1:12), nrow = 4, byrow = TRUE)
m1
m2 <- matrix(seq(1:12), nrow = 4, byrow = FALSE)
m2

# Wichtig für viele statistische Verfahren, wenn man diese per Hand
# nachrechnen will :-)
# Datenstruktur als Grundlage für Bildverarbeitung in R.
# Anderer Kurs bei Gelegenheit ...

# Paket imager wurde nicht als notwendig vorausgesetzt.
# Daher nur Demonstration an dieser Stelle.
#
# suppressPackageStartupMessages(library(imager))
# m2 <- matrix(runif(10000, 0, 1), nrow = 100)
# cimg2 <- as.cimg(m2)
# plot(cimg2, rescale = TRUE)
# hist(cimg2)
# 
# m2 <- matrix(rnorm(10000, 0.5, 0.5), nrow = 100)
# cimg2 <- as.cimg(m2)
# plot(cimg2, rescale = TRUE)
# hist(cimg2)

