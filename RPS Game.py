class rpc:

	def c (self) :
		import random ;
		comp = random.randrange (1,3) ;
		if comp == 1 :
			comp = "Rock"
			print ("The computer chose: %s" % comp)
			return comp			
		elif comp == 2:
			comp = "Paper"
			print ("The computer chose: %s" % comp)
			return comp
		elif comp == 3:
			comp = "Scissors"
			print ("The computer chose: %s" % comp)
			return comp
		
	
	def p (self) :
		
		choice = input("Choose (1)Rock, (2)Paper, or (3) Scissors: ")
	
		if choice == "1" :
			player = "Rock"
			print("You chose: %s" % player)
			return player			
		elif choice == "2":
			player = "Paper"
			print("You chose: %s" % player)
			return player			
		elif choice == "3":
			player = "Scissors"
			print("You chose: %s" % player)
			return player	
		else :
			print("That ain't an option nigga")
		
	
	def duel (self, player, comp):
	
		if player == "Rock" and comp == "Paper" :
			print("You lose....")
		elif player == "Paper" and comp == "Scissors" :
			print("You lose....")	
		elif player == "Scissors" and comp == "Rock" :
			print("You lose....")
		elif player == "Rock" and comp == "Scissors" :
			print("You Win!")
		elif player == "Paper" and comp == "Rock" :
			print("You Win!")	
		elif player == "Scissors" and comp == "Paper" :
			print("You Win!")
		elif player == comp :
			print("Tied!")
				
			
	
def game ():
	player = rpc().p()
	comp = rpc().c()
	rpc().duel(player, comp)
	
def main ():
	game()
	while True:
		response = input("Would you like to play again? y/n: ")
		if response == "y":
			game()
		else:
			print("See yeah!")
			break
	
print("Welcome to Rock, Paper, Scissors \nlet's see if you can beat the computer")
main()



	


	
