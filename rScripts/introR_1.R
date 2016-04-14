12
#changing directory
setwd("~/Desktop/software-carpentry-2016/data-files/r-lesson/data/")
list.files()
read.csv('inflammation-01.csv', header = FALSE)


weight_kg <- 55
weight_kg
#convert weights to pounds
weight_kg*2.2
#Change weight_kg to 57.5
weight_kg <- 57.5
weight_kg

#Calculate weight in pounds, save to variable weight_lb
weight_lb <- weight_kg * 2.2
weight_lb

# Raptor weight increases to 100
weight_kg <- 100
#Display these variables to check them out
weight_kg
weight_lb

#import data, save to variable dat.
dat <- read.csv('inflammation-01.csv', header = FALSE)
dat
#What "class" is the dat data>?
class(dat)
# Dimsntions of dat, rows then columns. 
dim(dat)
#Bros before columns - always. 
#top left value of dat
dat[1,1]
#30th row and 20th column of dat
dat[30,20]
#first 4 rows, first 10 columns of dat
dat[1:4 , 1:10]
#rows 5-10, columns 1-10 of dat
dat[5:10, 1:10]
#specific rows and columns
dat[c(3,8,37,56), c(10,14,29)  ]
#all values out of 5th row
dat[5,]
#all values of 16th column
dat[,16]

#save first row to variable raptor_1.
raptor_1 <- dat[1,]
#max and min inflammation for the first raptor (row 1)
max (raptor_1)
min (raptor_1)

#max inflammation of raptor 2
max ( dat[2,])
#average inflammation of 7th day
mean(dat[,7])
#median inflammation of 7th day
median(dat[,7])
#standard deviation of 7th day inflammation
sd(dat[,7])


mean(raptor_1)
#you have to do this instead, because raptor_1 is a data frame:
mean(as.numeric(raptor_1))
class(raptor_1)

#find out how apply works. 
?apply
#Average inflammation of each raptor over the whole time period
avg_raptor_inflammation <- apply(dat, 1, mean)
avg_raptor_inflammation

#average inflammation of every time period over all raptors. 
avg_day_inflammation <- apply (dat, 2, mean)
avg_day_inflammation

# 
raptor_1 = dat[1,]

## Challenge 1
animal <- c('m', 'o', 'n', 'k', 'e', 'y')
animal[1:3]
animal[4:6]

#first four characters in reverse:
animal[4:1]

animal[-1]
animal[-4]
animal[-1:-4]

animal[c(5,2,3)]

#plot the average inflammation for every day
plot(avg_day_inflammation)

#plot the max inflammation for every day
max_day_inflammation <- apply (dat, 2, max)
plot(max_day_inflammation)

# plot the min inflammation for every day
min_day_inflammation <- apply (dat, 2, min)
plot(min_day_inflammation)

# plot the standard deviation of inflammation for every day. 
sd_day_inflammation <- apply (dat, 2, sd)
plot(sd_day_inflammation)


