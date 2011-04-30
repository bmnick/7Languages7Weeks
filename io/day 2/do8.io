# Setup some initial variables
input := 300
i := 0

# Generate our target input
target := Random value(1,100) floor()

# Loop while they don't give us the target number up to 10 times
while(i < 10 and input != target, 

	# Increment the counter - not using for - I can't customize the conditional
	i = i + 1;

	# Read in a number from the user
	input := File standardInput readLine("guess?: ") asNumber;

	# Print hints as necessary
	if(input < target, "go up" println);
	if(input > target, "go down" println)
)

# Print out the results
if(input == target, 
	"yay!" println, #they got it right
  "BOO!\nThe answer was: " print; target asString println # tell them the right answer
)
