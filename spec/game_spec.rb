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

    describe '#main_menu' do
        xit 'can start a game' do

            expect(@game.wants_to_play?).to be true
        end

        xit 'can quit a game' do
            
            expect(@game.wants_to_play?).to be false
        end
    end

    describe '#computer_place' do
        xit 'can randomly place' do
            @game.computer_place(cruiser, coordinates)

            expect(@game.computer_place).to be true
        end

        xit 'can quit a game' do
            
            expect(@game.wants_to_play?).to be false
        end

        it 'can place a Shipwichs' do

            expect(@game.computer_board.render(true).include?("S"))
        end

    end

end