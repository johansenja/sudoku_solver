RSpec.describe Sudoku::Puzzle do
  let(:sample1) { JSON.parse File.read "./samples/1.json" }

  describe "#boxes" do
    it "can generate boxes properly" do
      boxes = described_class.new(sample1).boxes
      expect(boxes.first.cells.map(&:value)).to eq [
           4, nil, 6, nil, nil, nil, nil, nil, nil,
         ]
      expect(boxes[4].cells.map(&:value)).to eq [
           8, nil, nil, nil, 7, nil, 9, nil, 4,
         ]
    end
  end

  describe ".box_by!" do
    it "can find a box with the given row and column number" do
      expect(described_class.box_number_by(row_number: 0, column_number: 0)).to eq 0
      expect(described_class.box_number_by(row_number: 3, column_number: 1)).to eq 3
      expect(described_class.box_number_by(row_number: 5, column_number: 3)).to eq 4
      expect(described_class.box_number_by(row_number: 8, column_number: 8)).to eq 8
    end
  end
end
