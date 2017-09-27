# frozen_string_literal: true

describe MauxRobot::Formatter::Csv do
  let (:position) {MauxRobot::Position.new(1,2,:west)}

  context '#generate' do
    it "Formats a position as CSV" do
      expect(subject.generate(position)).to eq('1,2,WEST')
    end
  end
end