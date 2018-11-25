class Sudoku
  def initialize(grid)
    @grid = grid
    @possible_numbers = (1..9).to_a
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
            (box_index - (box_index % 3)) / 3)
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
    end
  end

  def solve
    @grid.each_with_index do |square, index|
      r = (index - (index % 9)) / 9
      c = index % 9
      b = 1
      fill_square(index, r, c, b) if square.zero?
    end
  end
end
