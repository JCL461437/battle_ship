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
            expect(@board.cells.size()).to eq(16)
        end
        
    end

    describe '#validating_coordinate?' do
        it 'can validate coordinate' do
            
            expect(@board.valid_coordinate?("A1")).to be true
            expect(@board.valid_coordinate?("D4")).to be true
            expect(@board.valid_coordinate?("A5")).to be false
            expect(@board.valid_coordinate?("A22")).to be false
        end
        
    end

    describe '#validating_placement?' do
        it 'can check if number of coordinates in the array is the same as the ships length' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)
        
            expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to be false
            expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
        
        end

        it 'can check if the coordinates are consecutive' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)
        
            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
            expect(@board.valid_placement?(submarine, ["A1","C1"])).to be false
            expect(@board.valid_placement?(cruiser, ["A3","A2","A1"])).to be false
            expect(@board.valid_placement?(submarine, ["C1", "B1"])).to be false
        
        end

        xit 'can check if the coordinates are diagonal' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)
        
            expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
            expect(@board.valid_placement?(submarine, ["C2","D3"])).to be false
        
        end
        
        xit 'can decide if a placement is valid' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)
        
            expect(@board.valid_placement?(submarine, ["A1", "A2"])).to be true
            expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
        
        end

    end
    
    describe 'placing ships' do
        xit "can place ships on the board" do 
            cruiser = Ship.new("Cruiser", 3) 

            board.place(cruiser, ["A1", "A2", "A3"])

            expect(board.cells["A1"]).to eq(cell_1)
            expect(board.cells["A2"]).to eq(cell_2)
            expect(board.cells["A3"]).to eq(cell_3)

            expect(cell_1.ship).to eq(cruiser)
            expect(cell_2.ship).to eq(cruiser)
            expect(cell_3.ship).to eq(cruiser)

            expect(cell_3.ship == cell_2.ship).to be true
        end
    end
    describe 'Overlapping Ships' do
        xit "can validate ship placement" do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            board.place(cruiser, ["A1", "A2", "A3"])

            expect(board.valid_placement?(submarine, ["A1", "B1"])).to be false
        end
    end

    describe 'Rendering the board' do
        xit "can render the board state" do
            cruiser = Ship.new("Cruiser", 3)

            board.place(cruiser, ["A1", "A2", "A3"])

            expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
            expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
        end
    end
end


