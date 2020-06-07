# frozen_string_literal: true

describe MauxRobot::Formatter::Csv do
  let(:position) { MauxRobot::Position.new(1, 2, :west) }

  describe "#generate" do
    subject(:csv_formatter) { described_class.new }

    it "Formats a position as CSV" do
      expect(csv_formatter.generate(position)).to eq("1,2,WEST")
    end
  end
end
