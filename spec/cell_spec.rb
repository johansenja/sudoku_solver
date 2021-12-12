RSpec.describe Sudoku::Cell do
  let(:sample1) { JSON.parse File.read "./samples/1.json" }
  let(:puzzle) { Sudoku::Puzzle.new(sample1) }

  describe "#empty?" do
    it "returns true if the cell is empty" do
      expect(puzzle.grid[1].empty?).to be true
    end

    it "returns false if the cell is not empty" do
      expect(puzzle.grid[0].empty?).to be false
    end
  end
end
