require_relative '../solver'

S = Sudoku.new([8, 7, 6,  9, 0, 0,  0, 0, 0,
                0, 1, 0,  0, 0, 6,  0, 0, 0,
                0, 4, 0,  3, 0, 5,  8, 0, 0,

                4, 0, 0,  0, 0, 0,  2, 1, 0,
                0, 9, 0,  5, 0, 0,  0, 0, 0,
                0, 5, 0,  0, 4, 0,  3, 0, 6,

                0, 2, 9,  0, 0, 0,  0, 0, 8,
                0, 0, 4,  6, 9, 0,  1, 7, 3,
                0, 0, 0,  0, 0, 1,  0, 0, 4])

S2 = Sudoku.new([1, 5, 2,  4, 8, 9,  3, 7, 6,
                 7, 0, 9,  2, 5, 6,  0, 4, 1,
                 4, 6, 8,  3, 7, 1,  2, 9, 5,

                 3, 8, 7,  1, 2, 4,  6, 5, 9,
                 5, 9, 1,  7, 6, 3,  4, 0, 8,
                 2, 4, 6,  8, 9, 0,  7, 1, 3,

                 9, 1, 4,  0, 3, 7,  5, 8, 2,
                 0, 2, 5,  9, 4, 8,  1, 3, 7,
                 8, 7, 3,  5, 1, 2,  0, 6, 4])

describe '#zeroes' do
  it 'should return a hash of the squares to be filled, with their indices' do
    expect(S2.zeroes).to have_key(10)
  end
end

describe '#number_can_go_in_square?' do
  it 'should allow a number to go in the square unless already in that box' do
    expect(S.number_can_go_in_square?(6, 1, 0, 0)).to eq false
  end

  it 'should allow a number to go in the square if not elsewhere' do
    expect(S2.number_can_go_in_square?(5, 5, 5, 4)).to eq true
  end
end

describe '#row' do
  it 'should return any given row of the grid' do
    expect(S.row(3)).to eq [4, 0, 0, 0, 0, 0, 2, 1, 0]
  end
end

describe '#column' do
  it 'should return an given column of the grid' do
    expect(S.column(5)).to eq [0, 6, 5, 0, 0, 0, 0, 0, 1]
  end
end

describe '#box' do
  it 'should return any given box of the grid' do
    expect(S.box(3)).to eq [4, 0, 0, 0, 9, 0, 0, 5, 0]
  end
end

describe '#fill_square' do
  it 'should put the correct value into the square' do
    expect(S2.fill_square(10, 1, 1, 0))
  end
end

describe '#solve' do
  it 'should return a solved grid' do
    expect(S2.solve).to eq [1, 5, 2,  4, 8, 9,  3, 7, 6,
                            7, 3, 9,  2, 5, 6,  8, 4, 1,
                            4, 6, 8,  3, 7, 1,  2, 9, 5,

                            3, 8, 7,  1, 2, 4,  6, 5, 9,
                            5, 9, 1,  7, 6, 3,  4, 2, 8,
                            2, 4, 6,  8, 9, 5,  7, 1, 3,

                            9, 1, 4,  6, 3, 7,  5, 8, 2,
                            6, 2, 5,  9, 4, 8,  1, 3, 7,
                            8, 7, 3,  5, 1, 2,  9, 6, 4]
  end
end
