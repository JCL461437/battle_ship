require './lib/ship'
require './lib/cell'

RSpec.configure do |config|
      config.formatter = :documentation
end

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
  end
  
    describe '#initialize' do
        it 'can initialize' do
            expect(@cell).to be_an_instance_of(Cell)
        end
        
        it 'can return a coordinate value' do
            expect(@cell.coordinate).to eq("B4")
        end
        
    end

    describe '#ship' do
        it 'can tell if a ship is present' do
            expect(@cell.ship).to eq(nil)
        end
    end

    describe '#empty?' do
        it 'can tell if a cell is empty' do
            expect(@cell.empty?).to be true
        end
    end

    describe '#place_ship?' do
        it 'can place a ship' do
            cruiser = Ship.new("Cruiser", 3)
        
            expect(@cell.empty?).to be true

            @cell.place_ship(cruiser)

            expect(@cell.ship).to eq(cruiser)

            expect(@cell.empty?).to be false
        end
    end

    describe '#fired_upon' do
        it 'fired_upon?' do
            cruiser = Ship.new("Cruiser", 3)
        
            expect(@cell.empty?).to be true

            @cell.place_ship(cruiser)

            expect(@cell.ship).to eq(cruiser)

            expect(@cell.empty?).to be false

            expect(@cell.fired_upon?). to be false

            @cell.fire_upon

            expect(@cell.ship.health). to eq(2)

            expect(@cell.fired_upon?).to be true
        end
    end

    describe '#render' do
        it 'can render cells' do
            cell_1 = Cell.new("B4")
            cell_2 = Cell.new("C3")
            cruiser = Ship.new("Cruiser", 3)
        
            expect(cell_1.render).to eq(".")

            cell_1.fire_upon

            expect(cell_1.render).to eq("M")

            cell_2.place_ship(cruiser)

            expect(cell_2.render).to eq(".")

            expect(cell_2.render(true)).to eq("S")

            cell_2.fire_upon

            expect(cell_2.render).to eq("H")

            expect(cruiser.sunk?).to be false

            cruiser.hit

            cruiser.hit

            expect(cruiser.sunk?).to be true

            expect(cell_2.render).to eq("X")

        end
    end

end

