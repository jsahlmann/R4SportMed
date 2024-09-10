library(tidyverse)
library(openxlsx)

n = 150

set.seed(123)
id <- paste0("id_", seq(1, n))
gender <- sample(c("female", "male"), n, replace = TRUE)
dob <- round(runif(n, min = 1989 , max = 2005), 0)
ic <- sort(as.Date("2024-01-02") + runif(n, 0, 90))
intervention <- sample(c("Training", "Kontrolle"), n, replace = TRUE)
hr1 <- round(rnorm(n, mean = 130, sd = 10), 0)
hr2 <- round(rnorm(n, mean = 150, sd = 15), 0)
heartrate <- ifelse(intervention == "Training", hr1, hr2)
score <- as.integer(sample(c(0, 1, 2, 3), n, replace = TRUE))

my_data <- data.frame(id, gender, dob, ic, intervention, heartrate, score)

write.xlsx(my_data, file = "erste_schritte/studiendaten.xlsx")

#t.test(heartrate ~ intervention)


