install.packages("tidyverse")
library(tidyverse)
penguins <- read_table("penguin_data.txt")
a <- lm(flipper_length_mm ~ body_mass_g, data = penguins)
summary(a)

an <- aov(body_mass_g ~ sex, data = penguins)
summary(an)

an2 <- aov(body_mass_g ~ species, data = penguins)
summary(an2)


ggplot(penguins, aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(size=2, shape=23)
ggsave("figs/1_flipper_bodymass_regression.png") 

penguins_female <- subset(penguins, sex == "female")
write_tsv(penguins_female, "Results/1_penguin_female_only.txt")

penguins_sex <- subset(penguins, sex != "NA")
ggplot(penguins_sex, aes(x=sex, y=flipper_length_mm, fill=species, outlier.shape = NA)) + geom_boxplot() + xlab("Sex") + ylab("Flipper Length (mm)")
ggsave("figs/sex_bodymass_regression.png") 

# 😈😈😈😈😈😈😈😈😈😈😈