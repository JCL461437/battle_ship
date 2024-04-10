require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class Game
    attr_reader :computer_board, :player_board

    def initialize(computer_board, player_board)
        @computer_board = computer_board
        @player_board = player_board
        @computer_sub = Ship.new("Submarine", 2)
        @computer_cruiser = Ship.new("Cruiser", 3)
    end

    def random_ships
        @computer_board.place(@computer_sub, get_placement(@computer_sub, 2))
        @computer_board.place(@computer_cruiser, get_placement(@computer_cruiser, 3))
    end

    def get_placement(ship, length)
        coords = @computer_board.cells.keys
        loop do
        ship_coords = coords.sample(length)
            if @computer_board.valid_placement?(ship, ship_coords)
                return ship_coords
            end
        end
    end










end