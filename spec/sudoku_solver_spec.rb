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

  it 'should not allow a number to go in a square if the square is filled' do
    expect(s.number_can_go_in_square?(1, 1, nil, nil, nil)).to eq false
  end

  it 'should allow a number to go in the square if it is not already in that row, box, or column' do
    expect(s.number_can_go_in_square?(8, 0, 0, 0, 0))
  end
end

describe '#row' do
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

  it 'should return any given row of the grid' do
    expect(s.row(3)).to eq [4, 0, 0, 0, 0, 0, 2, 1, 0]
  end
end

describe '#column' do
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
  it 'should return an given column of the grid' do
    expect(s.column(5)).to eq [0, 6, 5, 0, 0, 0, 0, 0, 1]
  end
end

describe '#box' do
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
  it 'should return any given box of the grid' do
    expect(s.box(3)).to eq [4, 0, 0, 0, 9, 0, 0, 5, 0]
  end
end
