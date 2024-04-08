require './lib/ship'
require './lib/cell'
require 'pry'

class Board
    attr_reader :cells

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

    def valid_coordinate?(coordinate)
        @cells.has_key?(coordinate)
    end

    def valid_placement?(ship, coordinates)
        if coordinates.all?{|coordinate|valid_coordinate?(coordinate)}
            if coordinates.none?{|coordinate|overlapping?(ship, coordinate)}
                if correct_size?(ship, coordinates)
                    if isVertical?(coordinates)
                        return true
                    elsif isHorizontal?(coordinates)
                        return true
                    else
                        return false
                    end
                else
                    return false
                end 
            else
                return false   
            end
        else 
            return false 
        end
    end

    def correct_size?(ship, coordinates)
        ship.length == coordinates.length
    end

    def isVertical?(coordinates)
        colm = coordinates[0][1,2].to_i
        
        currIndex = 1
        prevIndex = 0

        loop do
            if coordinates[currIndex][0,1].ord - coordinates[prevIndex][0,1].ord == 1
                if colm == coordinates[currIndex][1,2].to_i
                    currIndex += 1
                    prevIndex += 1
                    if currIndex == coordinates.length
                        return true
                    end
                else
                    return false
                end
            else
                return false
            end
        end
    end

    def isHorizontal?(coordinates)
        row = coordinates[0][0,1]

        currIndex = 1
        prevIndex = 0

        loop do
            if coordinates[currIndex][1,2].to_i - coordinates[prevIndex][1,2].to_i == 1
                if row == coordinates[currIndex][0,1]
                    currIndex += 1
                    prevIndex += 1
                    if currIndex == coordinates.length
                        return true
                    end
                else
                    return false
                end
            else
                return false
            end
        end
    end

    def place(ship, coordinates)
        coordinates.each do |coordinate|
            cells[coordinate].place_ship(ship)
        end
    end

    def overlapping?(ship, coordinate)
        cell = @cells[coordinate]
        return false unless cell.ship 
        cell.ship != ship
    end

    # def overlapping?
    # end
    
end