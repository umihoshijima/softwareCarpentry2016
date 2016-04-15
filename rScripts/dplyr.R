install.packages('dplyr')
#load my favorite package
library(dplyr)

dat <- read.csv(filename <- file.choose())
View(dat)
head(dat)
glimpse(dat)
dim(dat)

select(dat, order, species)
select(dat, starts_with('adult'))
select(dat, -order)

filter(dat, order=="Carnivora")
filter(dat, order=="Carnivora" & adult_body_mass_g<5000)

arrange(dat, adult_body_mass_g)
arrange(dat, desc(adult_body_mass_g))
arrange(dat, order, adult_body_mass_g)

dat.1 <- arrange(dat, adult_body_mass_g)
head(dat.1)

a = group_by(dat, order)
b = summarize(a, mean_mass = mean(adult_body_mass_g, na.rm = TRUE))
c = mutate(a, mean_mass = mean(adult_body_mass_g, na.rm = TRUE))
head(c)
glimpse(c)

d <- summarize(a, mean_mass = mean(adult_body_mass_g, na.rm = TRUE), 
              sd_mass = sd(adult_body_mass_g, na.rm = TRUE))

a <- group_by(dat, order)
e <- mutate(a, mean_mass = mean(adult_body_mass_g, na.rm = TRUE), 
           norm_mass = adult_body_mass_g / mean_mass)

e <- mutate(group_by(dat, order), mean_mass = mean(adult_body_mass_g, na.rm = TRUE), 
            norm_mass = adult_body_mass_g / mean_mass)

e <- dat %>%   #Take our data
  group_by(order) %>% #split it up by order
  mutate(mean_mass = mean(adult_body_mass_g, na.rm = TRUE), norm_mass = adult_body_mass_g/mean_mass) %>% #find average weight for every order
  arrange(desc(norm_mass))
View(e)

### Which order has the most species?
most_species <- dat %>%
  group_by(order) %>%
  summarize(sp_count = length(species)) %>%
  arrange(desc(sp_count))
most_species

# Which order has the widest range of body mass (max-min)?
range_size_species <- dat %>%
  group_by(order) %>%
  summarize( mass_range = max(adult_body_mass_g, na.rm = TRUE)-min(adult_body_mass_g, na.rm = TRUE) )%>%
  arrange(desc(mass_range))
View(range_size_species)


#which carnivore has the largest body length to body mass ratio?
carn_length_mass <- dat %>%
  filter(order == "Carnivora") %>%
  mutate(length_mass_ratio = adult_head_body_len_mm / adult_body_mass_g) %>%
  arrange(desc(length_mass_ratio))
  
dat$order
dat$adult_head_body_len_mm
