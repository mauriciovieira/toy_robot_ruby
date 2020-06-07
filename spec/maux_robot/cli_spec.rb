# frozen_string_literal: true

require "maux_robot"

describe MauxRobot::CLI do
  subject(:cli) { described_class.new }

  describe "#execute" do
    let(:position) { MauxRobot::Position.new(0, 2, :east) }

    context "when input is parsed without arguments" do
      it "sends proper message to robot" do
        allow(cli.robot).to receive(:move).and_return(position)
        expect(cli.execute(order: :move)).to eq(position)
      end
    end

    context "when place is parsed command with arguments" do
      it "sends proper message to robot" do
        expect(cli.execute(order: :place, arguments: {x: "0", y: "2", face: "EAST"})).to eq(position)
      end
    end
  end
end
