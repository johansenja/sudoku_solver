require_relative '../solver'

describe '#number_can_go_in_square?' do
  let(:s) do
    Sudoku.new([8, 7, 6,  9, 0, 0,  0, 0, 0,
                0, 1, 0,  0, 0, 6,  0, 0, 0,
                0, 4, 0,  3, 0, 5,  8, 0, 0,

                4, 0, 0,  0, 0, 0,  2, 1, 0,
                0, 9, 0,  5, 0, 0,  0, 0, 0,
                0, 5, 0,  0, 4, 0,  3, 0, 6,

                0, 2, 9,  0, 0, 0,  0, 0, 8,
                0, 0, 4,  6, 9, 0,  1, 7, 3,
                0, 0, 0,  0, 0, 1,  0, 0, 4])
  end

  it 'determines whether a number is allowed to go in a square or not' do
    expect(number_can_go_in_square?(1)).to eq false
  end
end
