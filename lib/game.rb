require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class Game
    attr_reader :computer_board, :player_board

    def initialize
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
                if @player_board.cells[shot_attempt].empty? == true 
                    puts "My shot on #{shot_attempt} was a miss."
                elsif @player_board.cells[shot_attempt].empty? == false
                    puts "My shot on #{shot_attempt} was a hit."
                elsif @player_board.cells[shot_attempt].empty? == false && ship.health == 0 
                    puts "My shot on #{shot_attempt} sunk your ship!"
                end
                return @player_board.cells[shot_attempt].fire_upon
            end
        end
    end

    def player_shot
        puts "Enter a coordinate for your shot: "
        shot_attempt = gets.chomp
        # binding.pry
        loop do
            if @computer_board.cells[shot_attempt].fired_upon? == true
                puts "You have already fired on that cell. Please choose a different coordinate."
                shot_attempt = gets.chomp
            elsif @computer_board.cells[shot_attempt].fired_upon? == false
                if @computer_board.cells[shot_attempt].empty? == true
                    puts "Your shot on #{shot_attempt} was a miss."
                elsif @computer_board.cells[shot_attempt].empty? == false
                    puts "Your shot on #{shot_attempt} was a hit."
                elsif @computer_board.cells[shot_attempt].empty? == false && ship.health == 0
                    puts "Your shot on #{shot_attempt} sunk my ship!"
                end
                return @computer_board.cells[shot_attempt].fire_upon
            # elsif @computer_board.cells[shot_attempt].fired_upon? == true
            #     puts "You have already fired on that cell. Please choose a different coordinate."
            #     player_shot
            else
                puts "Those are invalid coordinates. Please Try Again."
            end
        end
    end

    def take_turn

        #place random computers (is in runner file)
        #player ships are place (is in runner file)
        
        loop do
            #show computer board
            puts "====================="
            puts "   Computer Board    "
            puts "====================="
            puts @computer_board.render
            puts "====================="
            #show player board
            puts "====================="
            puts "    Player Board     "
            puts "====================="
            puts @player_board.render(true)
            puts "====================="
            #prompt player for shot coordinates
            self.player_shot
            self.random_shots
            #print player shot result (hit or miss)
            #print computer shot result (hit or miss)

            #check for victory condition. 
            if self.win_con? 
                break
            end
        
            #if met, end game, else run loop again
        end
        main_menu
    end

    def win_con?
        if @player_cruiser.health == 0 && @player_sub.health == 0
            puts "I won!"
            return true
        elsif @computer_cruiser.health == 0 && @computer_sub.health == 0
            puts "You won!"
            return true
        else
            return false
        end
    end 

    def starts
        @computer_board = Board.new
        @player_board = Board.new
        @computer_sub = Ship.new("Submarine", 2)
        @computer_cruiser = Ship.new("Cruiser", 3)
        @player_sub = Ship.new("Submarine", 2)
        @player_cruiser = Ship.new("Cruiser", 3)
        random_ships
        get_players_placements
        take_turn
    end

    def main_menu
        puts "Welcome to BATTLESHIP"
        puts "Enter [p] to play and [q] to quit."
        answer = gets.chomp.downcase
        if answer == "p"
            starts
        elsif answer == "q"
            puts "Bye! Hope to play again soon!"
            exit
        end
    end

end