require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class Game
    attr_reader 

    def initialize
    end

    def main_menu
        puts "Welcome to BATTLESHIP"
        puts "Enter [p] to play. Enter [q] to quit." 
        answer = gets 
        if answer == "p"
            
        elsif answer == "q"

        else 
            puts "Invalid input. Please select again."
        end















end