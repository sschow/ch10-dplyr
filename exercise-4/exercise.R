# Exercise 4: practicing with dplyr

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
library(nycflights13)
library(dplyr)

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
View(flights)
dim(flights)
row.names(flights)
colnames(flights)

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
flights <- mutate(flights, gained_time = arr_delay - dep_delay)
View(flights)

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
flights_descending  <- arrange(flights, gained_time)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
flights_descending <- mutate(flights, gained_time = arr_delay - dep_delay) %>% 
  arrange(desc(gained_time)) 

# Make a histogram of the amount of time gained using the `hist()` function
hist(flights$gained_time)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
mean_gained <- mean(flights$gained_time, na.rm = TRUE)
# on average, the flights gained time 

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
seatac <- filter(flights, dest == "SEA") %>% 
  select(origin, dest, gained_time)

# On average, did flights to SeaTac gain or loose time?
mean_seatac <- mean(seatac$gained_time, na.rm = TRUE)

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!
jfk_sea <- summarize (avg_time = mean(gained_time) )

