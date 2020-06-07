# frozen_string_literal: true

describe MauxRobot::Formatter do
  subject(:formatter) { described_class }

  describe "#from" do
    describe "valid format_types" do
      it "returns csv formatter" do
        expect(formatter.from(:csv).class).to eq(MauxRobot::Formatter::Csv)
      end

      it "returns json formatter" do
        expect(formatter.from(:json).class).to eq(MauxRobot::Formatter::Json)
      end
    end

    describe "invalid format_types" do
      it "defaults to csv formatter" do
        expect(formatter.from(:anything).class).to eq(MauxRobot::Formatter::Csv)
      end
    end
  end
end
