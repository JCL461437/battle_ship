require './lib/ship'
require './lib/cell'
require 'pry'

class Board
    attr_reader :cells

    def initialize
        def initialize
            @cells = { 
              "A1" => Cell.new("A1"),
              "A2" => Cell.new("A2"),
              "A3" => Cell.new("A3"),
              "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"),
              "B2" => Cell.new("B2"),
              "B3" => Cell.new("B3"),
              "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"),
              "C2" => Cell.new("C2"),
              "C3" => Cell.new("C3"),
              "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"),
              "D2" => Cell.new("D2"),
              "D3" => Cell.new("D3"),
              "D4" => Cell.new("D4")
          }

        end

    end

    def valid_coordinate?(coordinate)
        @cells.has_key?(coordinate)
    end

    def valid_placement?(ship, coordinates)
        return false unless ship.length == coordinates.length
        # if coordinates.count == ship.length && @cells.keys == coordinates
        #     true
        # end

        return false unless consecutive_coordinates?(coordinates)
    end

    def consecutive_coordinates?(ship, coordinates)

    end
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    # def cells
    #     empty_cells = Hash.new(0)
    #     count = 0

    #     cells = empty_cells.each do |cell|
    #         cell = Cell.new(coordinate)

    #     end
    # end

    #while loop?

    #unitl loop?


end