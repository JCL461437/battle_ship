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
        @player_sub = Ship.new("Submarine", 2)
        @player_cruiser = Ship.new("Cruiser", 3)
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

    def get_players_placements
        puts "Please input your Cruiser's 3 Coordinates. Please use capital letters"
        loop do
            coords = gets.split
                if @player_board.valid_placement?(@player_cruiser, coords)
                    @player_board.place(@player_cruiser, coords)
                    puts @player_board.render(true)
                    break
                else
                    puts "Those are invalid coordinates. Please Try Again."
                end
        end
        puts "Now enter the Submarine's 2 Coordinates."
        loop do
            coords = gets.split
            if @player_board.valid_placement?(@player_sub, coords)
                @player_board.place(@player_sub, coords)
                puts @player_board.render(true)
                break
            else
                puts "Those are invalid coordinates. Please Try Again."
            end
        end
    end

    def random_shots
        coords = @player_board.cells.keys
        loop do
            shot_attempt = coords.sample
            if @player_board.cells[shot_attempt].fired_upon? == false
                return @player_board.cells[shot_attempt].fire_upon
            end
        end
    end

    def player_shot(shot_attempt = gets.chomp)
        puts "Enter a coordinate for your shot: "
        # shot_attempt = gets.chomp
        loop do
            if @computer_board.cells[shot_attempt].fired_upon? == false
                return @computer_board.cells[shot_attempt].fire_upon
            elsif @computer_board.cells[shot_attempt].fired_upon? == true
                puts "You have already fired on that cell. Please choose a different coordinate."
            else
                puts "Those are invalid coordinates. Please Try Again."
            end
        end
    end

    def results
        computer_results(last_computer_shot)
        player_results(last_player_shot)
    end

    def player_results(last_player_shot)

        if @computer_board.cells[last_player_shot].empty? == true 
            puts "Your shot on #{last_player_shot} was a miss."
        elsif @computer_board.cells[last_player_shot].empty? == false #try empty? == false if fired_upon? does not work
            puts "Your shot on #{last_player_shot} was a hit."
        elsif @computer_board.cells[last_player_shot].empty? == false && ship.health == 0 #add specific ship in parameter?
            puts "Your shot on #{last_player_shot} sunk my ship!"
        end
    end

    def computer_results(last_computer_shot)

        if @player_board.cells[last_computer_shot].empty? == true 
            puts "My shot on #{last_computer_shot} was a miss."
        elsif @computer_board.cells[last_computer_shot].empty? == false
            puts "My shot on #{last_computer_shot} was a hit."
        elsif @computer_board.cells[last_computer_shot].empty? == false && ship.health == 0 
            puts "My shot on #{last_computer_shot} sunk your ship!"
        end
    end

end