# frozen_string_literal: true

describe MauxRobot::Formatter::Json do
  let(:position) { MauxRobot::Position.new(1, 2, :west) }

  describe "#generate" do
    subject(:json_formatter) { described_class.new }

    it "Formats a position as JSON" do
      expect(json_formatter.generate(position)).to eq('{"x":1,"y":2,"face":"WEST"}')
    end
  end
end
