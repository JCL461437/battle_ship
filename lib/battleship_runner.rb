require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

computer_board = Board.new
player_board = Board.new
game = Game.new(computer_board, player_board)
game.random_ships

game.get_players_placements