#Exercise 1
#creating data frame
student.df = data.frame(
	name = c("Sue", "Eva", "Henry", "Jan"),
	sex = c("f", "f", "m", "m"),
	years = c(21,31,29,19))

student.df

#new column with T for male teens
#my answer which is not working
if ( student.df$sex == "m" & student.df$years < 20) {
	student.df$male.teen = T
} else {
	student.df$male.teen = F
}
#answer from web which is working
student.df$male.teen = ifelse(student.df$sex == "m" & student.df$years < 20, "T", "F")
student.df

#Exercise 2
for(i in 1:3){
	for (x in 1:10){
		print(x+i-1)
	}
}

#Exercise 3
for (x in 1:6){
	print(x)
	if (x == 6){
		print("Yahtzee")
	}
}

#Exercise 4
m = 0 
while (m < 36) {
	m = m + 1 
	if (m == 7) {
		next
	}
	print(m)
}

#Exercise 5
m = 0
skip <- c(3,9,13,19,23,29)
while (m < 36) {
	m = m + 1 
	if (m %in% skip) {
		next
	}
	print(m)
}

#Exercise 6
for (river in rivers){
	if(river < 500){
		print("short river")
	} else if (river > 2000) {
		print("long river")
	} else {
		print(river)
	}
}

#Exercise 7
set.seed(23)

repetitions <- 1000 

# container of 100 numbers
urn <- c(1:100) 

# trials to get the desired number
trialsto100 <- 0 

for (i in 1:repetitions){
	num <- 0 # the sampled number 
	trials <- 0
	# we want number 55 
	while(num != 55){ 
		num <-sample(urn, 1, F) # sampling of the urn
		trials <- trials + 1 # looping the trials until we get the desired output
	}
	trialsto100 <- trialsto100 + trials # updating the number of trials
}

trialsto100/repetitions