RSpec.describe Sudoku::Solver do
  let(:sample1) { JSON.parse File.read "./samples/1.json" }
  let(:sample1_solution) { JSON.parse File.read "./samples/1_solution.json" }
  let(:sample2) { JSON.parse File.read "./samples/2.json" }
  let(:sample2_solution) { JSON.parse File.read "./samples/2_solution.json" }

  it "solves a sudoku" do
    expect(described_class.new(sample1).solve).to eq sample1_solution
  end

  it "solves a very easy sudoku" do
    expect(described_class.new(sample2).solve).to eq sample2_solution
  end
end
