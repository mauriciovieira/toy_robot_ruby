# frozen_string_literal: true

describe MauxRobot::Table do
  subject(:table) { described_class.new(x: [-1, 2], y: [3, 6]) }

  describe "#contains?" do
    it "contains a position inside boundaries" do
      position = MauxRobot::Position.new(0, 4, :north)
      expect(table.contains?(position)).to be true
    end

    it "does not contain a position outside boundaries" do
      position = MauxRobot::Position.new(3, 2, :east)
      expect(table.contains?(position)).to be false
    end
  end
end
