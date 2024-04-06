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
        
        it 'can ' do
            expect(@board.cells).to eq(all_cells)
        end
        
    end


end