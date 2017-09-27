# frozen_string_literal: true

describe MauxRobot::Formatter::Json do
  let (:position) {MauxRobot::Position.new(1,2,:west)}

  context '#generate' do
    it "Formats a position as JSON" do
      expect(subject.generate(position)).to eq('{"x":1,"y":2,"face":"WEST"}')
    end
  end
end