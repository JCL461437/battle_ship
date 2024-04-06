require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.configure do |config|
      config.formatter = :documentation
end

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end
  
    describe '#initialize' do
        it 'can initialize' do
            expect(@board).to be_an_instance_of(Board)
        end
        
        it 'can collect all cells' do
            expect(@board.cells).to eq(all_cells)
        end
        
    end

    describe '#validating_coordinate?' do
        it 'can ' do
            expect(@board.cells).to eq(all_cells)

            expect(@board.valid_coordinate?("A1")).to be true
            expect(@board.valid_coordinate?("D4")).to be true
            expect(@board.valid_coordinate?("A5")).to be false
            expect(@board.valid_coordinate?("A22")).to be false
        end
        
    end


end