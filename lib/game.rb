require_relative "player"
class Game
  WINNING_COMBINATIONS =[[0,1,2], [3,4,5], [6,7,8],[0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]] 
  def initialize(nameX, nameY)
    @positions= (1..9).to_a
    @playerX =Player.new(nameX,'X')
    @playerY =Player.new(nameY,'Y')
  end

  def play
    9.times do |ply|
      if ply.even?
        player = @playerX
      else
        player = @playerY
      end
      turn(player)
      if won?(player)
        puts self
        puts "Congratulations! #{player.name} has won the game with 3 #{player.marker}'s in a row!"
        return
      end
    end
    puts self
    puts "Game over! It is a stalemate"



  end

  def won?(player)
    WINNING_COMBINATIONS.any? do |line|
      line.all? {|i| @positions[i] == player.marker }
    end
  end

  def turn(player)
    puts self
    puts "#{player.name}, you have the #{player.marker}'s , select your position from the available options"
    input = get_selection_from_user
    puts
    @positions[input] = player.marker
  end
  
  def to_s
    "\n#{@positions[0]} | #{@positions[1]} | #{@positions[2]}"\
    "\n-----------"\
    "\n#{@positions[3]} | #{@positions[4]} | #{@positions[5]}"\
    "\n-----------"\
    "\n#{@positions[6]} | #{@positions[7]} | #{@positions[8]}\n\n"\
  end

  def get_selection_from_user
    loop do
      begin
        input = gets.chomp.to_i - 1
        if @positions[input].is_a? Numeric
          return input unless input.negative?
        end
        puts "Invalid selection. Choose from the available options"
      rescue
        puts "Invalid input, try again"
      end
    end
  end
      




  
end

