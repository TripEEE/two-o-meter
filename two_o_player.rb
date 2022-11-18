class Player
	def initialize(id)
		@id = id
		@lives = 3
	end
	def id()
		return @id
	end
	def gaveWrongAnswer()
		@lives = @lives - 1
	end
	def lives()
		return @lives
	end
	def score()
		return "P#{@id}: #{@lives}/3"
	end
end

class Question
	def initialize()
		@op1 = Random.rand(20)
		@op2 = Random.rand(20)
		@ans = @op1 + @op2
	end
	def genQuestion()
		@op1 = Random.rand(20)
		@op2 = Random.rand(20)
		return "What does #{@op1} plus #{@op2} equal?"
	end
	def getAnswer()
		@ans = @op1 + @op2
		return @ans
	end
end

class Game
	def initialize()
		@player1 = Player.new(1)
		@player2 = Player.new(2)
		@currentPlayer = @player1
		@question = Question.new
	end
	def changePlayer()
		if @currentPlayer == @player1
			@currentPlayer = @player2
		else
			@currentPlayer = @player1
		end
	end
	def gameOver()
		return @currentPlayer.lives == 0
	end
	def run()
		while true
			puts "#{@player1.score} vs #{@player2.score}"
			puts "----- NEW TURN -----"
			puts "Player #{@currentPlayer.id}: #{@question.genQuestion}"
			answer = gets.chomp.to_i
			if answer == @question.getAnswer
				puts "Player #{@currentPlayer.id}: YES! You are correct."
			else
				puts "Player #{@currentPlayer.id}: Seriously? No!"
				@currentPlayer.gaveWrongAnswer
			end
			if gameOver()
				changePlayer()
				puts "Player #{@currentPlayer.id} wins with a score of #{@currentPlayer.lives}/3"
				puts "----- GAME OVER -----"
				puts "Good bye!"
				break
			end
			changePlayer()
		end
	end
end

game = Game.new
game.run()