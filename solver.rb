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
    start = (3 * box_index) + ((27 * box_index / 3) *
            (box_index - (box_index % 3)) / 3)
    box = []
    3.times do
      @grid.each_with_index do |number, index|
        box << number if index == start || index == start + 1 || index == start + 2
      end
      start += 6
    end
    return box
  end

  def number_can_go_in_square?(number, square, row_index, column_index, box_index)
    return false unless square.zero?
    return false if row(row_index).include?(number) ||
                    column(column_index).include?(number) ||
                    box(box_index).include?(number)

    true
  end
end
