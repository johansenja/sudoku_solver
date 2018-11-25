require 'pry-byebug'
class Sudoku
  def initialize(grid)
    @grid = grid
    @possible_numbers = (1..9).to_a
  end

  def zeroes
    h = {}
    @grid.each_with_index { |e, i| h[i] = e if e.zero? }
    return h
  end

  def row(row_index)
    all_up_to_current_row = @grid.first(9 * (row_index + 1))
    all_up_to_current_row.pop(9)
  end

  def column(col_index)
    @grid.select.with_index do |number, index|
      number if ((index - col_index) % 9).zero?
    end
  end

  def box(box_index)
    start = (3 * (box_index % 3)) + ((27 * box_index / 3) *
            box_index / 3)
    @grid.select.with_index do |num, index|
      num if index == start || index == start + 1 || index == start + 2 ||
             index == start + 9 || index == start + 10 || index == start + 11 ||
             index == start + 18 || index == start + 19 || index == start + 20
    end
  end

  def number_can_go_in_square?(number, row_index, col_index, box_index)
    return false if row(row_index).include?(number) ||
                    column(col_index).include?(number) ||
                    box(box_index).include?(number)

    true
  end

  def fill_square(index, r, c, b)
    @possible_numbers.each do |n|
      @grid[index] = n if number_can_go_in_square?(n, r, c, b)
      return unless @grid[index].zero?
    end
  end

  def solve
    zeroes.each do |index, _value|
      r = index / 9
      c = index % 9
      b = ((index - (index % 3) - (9 * (r % 3))) / 9) + c / 3
      fill_square(index, r, c, b)
    end
  end
end
