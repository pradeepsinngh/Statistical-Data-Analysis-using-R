# Roulette Game Simulation
# Author: Pradeep Singh
# Email: psingh2@sdsu.edu

# define numbers in roulette game (0 - 36 and 00)
numbers <- c("0", "00", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36")  # define numbers in roulette game
outcomes <- sample(numbers, size=100, replace=TRUE, prob=c(1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38)) # generate 1,000 random numbers
payoff <- ifelse(outcomes=="11", 525, -15)  # assign the payoffs  (betting $15 on "11")

# Plot the cumulative payoffs
plot(1:length(payoff), cumsum(payoff), type="l", xlab="Number of spins", ylab="Net Gain ($)", main="Roulette Game", col="red")  

# function to simulate Roulette
roulette <- function(n.games){
  numbers <- c("0", "00", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36")  # define numbers in roulette game
  outcomes <- sample(numbers, size=n.games, replace=TRUE, prob=c(1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38, 1/38)) # generate 1,000 random numbers
  payoff <- ifelse(outcomes=="11", 525, -15)  # assign the payoffs  (betting $15 on "11")
  return(sum(payoff))
}

# run roulette game 100 times
roulette(100)

# Replicate the above simulation
netgain <- replicate(10000, roulette(100))

# Histogram of Net gain
hist(netgain)

# Density estimate
plot(density(netgain), xlab="Gains ($)", main="Estimated density of the net gains") 

# Summary statistics
# Calculate mean, median and std. deviation of net gains
summary(netgain)
mean(netgain)
median(netgain)
sd(netgain)

