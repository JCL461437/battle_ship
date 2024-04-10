require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class Game
    attr_reader :computer_board, :player_board

    def initialize(computer_board, player_board)
        @computer_board = computer_board
        @player_board = player_board
    end

    def random_ships
        place_sub
    end

    def place_sub
        starting_coord = random_coord
    end

    def direction(length, starting_coord)
        r = Random.new
        directions = []
        if starting_coord[0] == "A"
            if starting_coord[1] == "1"
                directions = ["Down", "Right"]
            elsif length <= 2 && starting_coord[1] != 4
                directions = ["Down", "Right", "Left"]
            elsif starting_coord[1] == "4"
                directions = ["Down", "Left"]
            elsif starting_coord[1] == 3 && length > 2
                directions = ["Down", "Left"]
            end
        end
    end


    def random_coord
        letters = ["A", "B", "C", "D"]
        numbers = ["1", "2", "3", "4"]
        r = Random.new
        letterindex = r.rand(4)
        numberindex = r.rand(4)
        return letters[letterindex] + numbers[numberindex]
    end










end