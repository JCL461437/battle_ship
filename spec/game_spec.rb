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
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@game).to be_an_instance_of(Game)
        end
    end

    describe '#main_menu' do
        it 'can start a game' do

            expect(@game.wants_to_play?).to be true
        end

        it 'can quit a game' do
            
            expect(@game.wants_to_play?).to be false
        end
    end

    describe '#computer_place' do
        it 'can randomly place' do
            @game.computer_place(cruiser, coordinates)

            expect(@game.computer_place).to be true
        end

        it 'can quit a game' do
            
            expect(@game.wants_to_play?).to be false
        end

        it 'can place a sub sandwich' do
            submarine = Ship.new("Submarine", 2)

            expect(@game.computer_board.cells.has_value?()).to eq(true)
        end

        it 'generates a random coordinate' do
        
            expect(/[A-D][1-4]/.match(@game.random_coord)).to be_an_instance_of(MatchData)
        end
    end

end