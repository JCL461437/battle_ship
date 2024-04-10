require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Game do
    before(:each) do
        @computer_board = Board.new
        @player_board = Board.new
        @game = Game.new(@computer_board, @player_board)
        @game.random_ships
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@game).to be_an_instance_of(Game)
        end
    end

    describe '#computer_place' do

        it 'can place a Shipwiches' do

            expect(@game.computer_board.render(true).include? "S")
            
        end

    end

    describe 'player input test test' do

        it 'can place ship' do 
            @game.get_players_placements
            
            puts @game.player_board.render(true)
            expect(@game.player_board.render(true).include? "S")

        end
    end
end