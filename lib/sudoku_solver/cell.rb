module Sudoku
  class Cell
    attr_reader :value, :row_number, :column_number

    def initialize value, puzzle, row_number, column_number
      @value = value
      @puzzle = puzzle
      @row_number = row_number
      @column_number = column_number
    end

    def empty?
      value.nil?
    end

    def inspect
      "Cell (position: (#{column_number}, #{row_number}), value: #{value.inspect})"
    end

    def value=(val)
      @value = val
      row.refresh_cache!
      column.refresh_cache!
      box.refresh_cache!
    end

    def possible_values
      ALL_NUMBERS - impossible_values
    end

    def impossible_values
      column.present | box.present | row.present
    end

    def row
      @row ||= @puzzle.rows[@row_number]
    end

    def column
      @column ||= @puzzle.columns[@column_number]
    end

    def box
      @box ||= @puzzle.box_by! row_number: @row_number, column_number: @column_number
    end
  end
end
