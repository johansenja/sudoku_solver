RSpec.describe Sudoku::Row do
  let(:sample1) { JSON.parse File.read "./samples/1.json" }
  let(:puzzle) { Sudoku::Puzzle.new(sample1) }

  describe "#present" do
    it "returns all the numbers which it contains" do
      expect(puzzle.rows[0].present).to match_array [
                                                      4, 6, 5, 2, 8, 9,
                                                    ]
      expect(puzzle.rows[5].present).to match_array [
                                                      3, 2, 9, 4, 6,
                                                    ]
    end
  end

  describe "#missing" do
    it "returns all the numbers which it doesn't contain" do
      expect(puzzle.rows[1].missing).to match_array [
                                                      1, 2, 5, 6, 7, 8, 9,
                                                    ]
      expect(puzzle.rows[3].missing).to match_array [
                                                      2, 3, 4, 5, 7, 9,
                                                    ]
    end
  end
end
