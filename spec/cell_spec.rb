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
    end
end