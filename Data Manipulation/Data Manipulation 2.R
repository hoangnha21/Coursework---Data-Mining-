# Read the data "hflights" from "hflights" package. 

install.packages("hflights")
library(hflights)

data(hflights)

View(hflights)
?hflights
flights <- hflights

str(flights)

# Look at the first 20 instances in your data set.

head(flights, n = 20)
flights[1: 20, ]

# View all flights on January 1st.
library(dplyr)
filter(flights, Month == 1, DayofMonth == 1)

flights %>% filter(Month == 1, DayofMonth == 1)

flights[flights$Month == 1 & flights$DayofMonth == 1, ]

# Only view the American or United Airlines carriers.

flights %>% filter(UniqueCarrier == "AA" | UniqueCarrier == "UA")

flights$UniqueCarrier

flights[flights$UniqueCarrier == "AA" | flights$UniqueCarrier == "UA"]

# Look at a subset of your dataset that contains 
# the variables "Year, Month, DayofMonth" and 
# any other variables that contains the words "Taxi" and "Delay".

select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))
?select
?dplyr


# Print a subset of your dataset that includes the following variables 
# "Departure Time", "Arrivales Time" and "Flight Number". 

flights[, c("DepTime", "ArrTime", "FlightNum")]

flights %>% select("DepTime", "ArrTime", "FlightNum")

# Print all the aircraft carriers whose departure time is delayed 
# more than 60 minutes. 

flights %>% select(UniqueCarrier, DepDelay) %>%  filter(DepDelay > 60)

# Look at the carriers with their departure delays and 
# sort them based on their departure delays.

flights %>% select(UniqueCarrier, DepDelay) %>%  arrange(DepDelay)


# Add a new variable called speed = distance/airtime * 60.

mutate(flights, speed = Distance/AirTime * 60)
flights <- mutate(flights, speed = Distance/AirTime * 60)

flights <- flights[, -22]

# Calculate average arrival delay to each destination. 

flights %>% group_by(Dest) %>% summarise(mean(ArrDelay, na.rm = TRUE))
# For each carrier, calculate the percentage of flights 
# canceled or diverted.

x <- flights %>% group_by(UniqueCarrier) %>% summarise_each(funs= mean, Cancelled, Diverted)
x[, -1]*100
# For each day of the year, count the total number of flights and 
# sort in descending order.

x<- flights %>% 
  group_by(Month, DayofMonth) %>% 
  summarise(counts = n()) %>% 
  arrange(desc(counts))
