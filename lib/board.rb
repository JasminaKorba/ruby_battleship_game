class Board

    attr_reader :size 

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count { |target| target == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'You sunk my battleship!'
            return true
        else
            self[position] = :X 
            return false
        end
    end

    def place_random_ships
        available_space = 0.25 * self.size

        while available_space > self.num_ships
            random_row = rand(0...@grid.length)
            random_col = rand(0...@grid.length)
            position = [ random_row, random_col]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S 
                    :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
