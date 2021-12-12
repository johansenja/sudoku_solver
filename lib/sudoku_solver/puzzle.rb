require_relative "cell"
require_relative "row"
require_relative "column"
require_relative "box"

module Sudoku
  class Puzzle
    class InvalidPuzzleError < StandardError; end
    class UnknownBoxError < StandardError; end

    def self.box_number_by row_number:, column_number:
      x_offset = ((column_number - (column_number % BOX_SIZE)) / BOX_SIZE)
      y_offset = ((row_number - (row_number % BOX_SIZE)) / BOX_SIZE)
      (y_offset * (SIZE / BOX_SIZE)) + x_offset
    end

    attr_reader :grid, :rows, :columns, :boxes

    def initialize raw_grid
      check_validitiy!(raw_grid)
      grid = raw_grid.map.with_index { |row, i| row.map.with_index { |cell, j| Cell.new cell, self, i, j } }
      @rows = grid.map { |row| Row.new row }
      @columns = (0..(SIZE - 1)).map { |n| Column.new(grid.map { |row| row[n] })}
      @boxes = build_boxes(grid)
      @grid = grid.flatten
    end

    def complete?
      rows.all? &:complete?
    end

    def inspect
      @grid.map(&:value).each_slice(SIZE).map do |row|
        row.each_slice(BOX_SIZE).map do |group|
          group.join " "
        end.join "   "
      end.each_slice(BOX_SIZE).map do |group|
        group.join("\n")
      end.join("\n\n")
    end

    def box_by! row_number:, column_number:
      box_num = self.class.box_number_by row_number: row_number, column_number: column_number
      @boxes[box_num] or raise UnknownBoxError, "row: #{row_number}, column: #{column_number}"
    end

    private

    def check_validitiy! raw_grid
      unless raw_grid.length == 9 and raw_grid.all? { |row| row.length == 9 }
        raise InvalidPuzzleError
      end
    end

    def build_boxes(grid)
      boxes = []
      grid.each_slice(BOX_SIZE) do |outer_slice|
        cache = (0..(BOX_SIZE - 1)).to_h { |n| [n, []] }
        outer_slice.each do |row|
          row.each_slice(BOX_SIZE).with_index do |inner_slice, index|
            cache[index] += inner_slice.flatten
          end
        end
        cache.each_value { |cells| boxes.push Box.new cells }
      end
      boxes
    end
  end
end
