import statistics

def mean (numbers):
	sum_of_all_numbers = sum(numbers)
	count_of_numbers = len(numbers)
	
	mean = sum_of_all_numbers/count_of_numbers
	print("Mean: %f" % mean)
		
		
def mode (numbers):
	mode = max(set(numbers), key=numbers.count)
	print("Mode: %d" % mode)


def median (numbers):
	
	#count_numbers = len(numbers)
	mediann = statistics.median(numbers)
	print("Median: %d" % mediann)
	
	'''if count_numbers % 2 == 0
		
		
	else
		median = 0.5 * (count_numbers + 1)
		print("Median: %d" % median)'''
		
	



num = input("Type a series of numbers separated by spaces: ")
numbers = list(map(int, num.split()))	
mean (numbers)
mode (numbers)
median(numbers)

input("")
