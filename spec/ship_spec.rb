require './lib/ship'
require 'pry'

RSpec.configure do |config|
      config.formatter = :documentation
end

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end
  
    describe '#initialize' do
        
        it 'can initialize' do
            expect(@cruiser).to be_an_instance_of(Ship)
        end

        it 'has a name' do
            expect(@cruiser.name).to eq("Cruiser")
        end

        it 'has a length' do
            expect(@cruiser.length).to eq(3)
        end

        it 'has health' do
            expect(@cruiser.health).to eq(3)
        end
    end

    describe '#sunk?' do
        it 'is possible to sink' do
            expect(@cruiser.sunk?).to be false
        end
    end

    describe '#hit' do
        it 'can be hit and sunk' do
            expect(@cruiser.health).to eq(3)
            expect(@cruiser.sunk?).to be false
            @cruiser.hit
            
            expect(@cruiser.health).to eq(2)
            expect(@cruiser.sunk?).to be false
            @cruiser.hit
            
            expect(@cruiser.health).to eq(1)
            expect(@cruiser.sunk?).to be false
            @cruiser.hit
            
            expect(@cruiser.health).to eq(0)
            expect(@cruiser.sunk?).to be true
        end
    end

end

