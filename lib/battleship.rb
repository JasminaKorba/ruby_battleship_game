require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0 
            print "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        self.win? == true || self.lose? == true
    end

    def turn
        @remaining_misses -= 1 if @board.attack(@player.get_move) == false
        @board.print
        puts "Remaining misses: #{@remaining_misses}"
    end



end
