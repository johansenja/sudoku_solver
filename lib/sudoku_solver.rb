require_relative "sudoku_solver/puzzle"

module Sudoku
  SIZE = 9
  BOX_SIZE = 3
  ALL_NUMBERS = (1..SIZE).to_set.freeze

  class Solver
    class CannotProgress < StandardError; end
    class IncorrectPuzzleError < StandardError; end
    class MismatchingPossibleValuesError < StandardError; end

    def initialize(grid)
      @puzzle = Puzzle.new grid
    end

    def solve
      sweeps = 0
      missing_cell_count = @puzzle.grid.count &:empty?
      puts "Cells to fill: #{missing_cell_count}"
      until @puzzle.complete?
        before = missing_cell_count
        sweep_grid do
          missing_cell_count -= 1
        end
        if before == missing_cell_count
          raise CannotProgress, "Further sweeps will have no effect. Sweep count: #{sweeps}. Grid:
#{@puzzle.inspect}"
        end
        sweeps += 1
      end

      puts "Solved. Solution:
#{@puzzle.inspect}"
      @puzzle.grid.map(&:value).each_slice(SIZE).to_a
    end

    private

    def sweep_grid
      @puzzle.grid.each do |cell|
        next unless cell.empty?

        impossible_values = cell.impossible_values

        case impossible_values.length
        when SIZE
          raise IncorrectPuzzleError,
            "#{cell.inspect} is empty but cannot have any value. This could be an incorrect puzzle, or a bug."
        when SIZE - 1
          possible_values = ALL_NUMBERS - impossible_values
          if possible_values.length != 1
            raise MismatchingPossibleValuesError,
              "#{cell.inspect} has impossible_values #{impossible_values} but possible values #{possible_values}"
          end
          cell.value = possible_values.first
          puts "filled #{cell.inspect} with #{cell.value}"
          yield
        end
      end
    end
  end
end
