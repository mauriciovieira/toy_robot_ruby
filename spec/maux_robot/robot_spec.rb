# frozen_string_literal: true

describe MauxRobot::Robot do # rubocop:disable Metrics/BlockLength
  subject(:robot) { described_class.new }

  let(:null_position) { MauxRobot::NullPosition.new }

  describe '#place' do
    context 'when given a valid place' do
      it 'has a position' do
        robot.place(x: 0, y: 0, face: :north)

        expect(robot.position).not_to eq null_position
      end
    end

    context 'when given an invalid place' do
      it 'raises NotOkToGo error' do
        expect { robot.place(x: 5, y: 0, face: :south) }.to raise_error MauxRobot::NotOkToGo
      end
    end

    context 'when given an invalid direction' do
      it 'raises NotOkToGo error' do
        expect { robot.place(x: 0, y: 2, face: :south_east) }.to raise_error MauxRobot::NotOkToGo
      end
    end
  end

  describe '#left' do
    context 'when robot is not placed' do
      it 'raises RobotNotPlacedYet error' do
        expect { robot.left }.to raise_error MauxRobot::RobotNotPlacedYet
        expect(robot.position).to eq null_position
      end
    end

    context 'when robot is placed' do
      it 'rotates accordingly' do
        robot.place(x: 1, y: 2, face: :south)
        robot.left

        expect(robot.position.face).to be(:east)
      end
    end
  end

  describe '#right' do
    context 'when robot is not placed' do
      it 'raises RobotNotPlacedYet error' do
        expect { robot.right }.to raise_error MauxRobot::RobotNotPlacedYet

        expect(robot.position).to eq null_position
      end
    end

    context 'with robot placed' do
      it 'rotates accordingly' do
        robot.place(x: 3, y: 2, face: :north)
        robot.right

        expect(robot.position.face).to be(:east)
      end
    end
  end

  describe '#move' do
    context 'with robot not placed' do
      it 'raises RobotNotPlacedYet error' do
        expect { robot.right }.to raise_error MauxRobot::RobotNotPlacedYet
        expect(robot.position).to eq null_position
      end
    end

    context 'when placing on the table' do
      it 'updates its position' do
        robot.place(x: 3, y: 2, face: :north)
        robot.move

        expect(robot.position.x).to eq(3)
        expect(robot.position.y).to eq(3)
        expect(robot.position.face).to eq(:north)
      end
    end

    context 'when outside the table' do
      it 'stays where it is' do
        robot.place(x: 0, y: 0, face: :south)

        expect { robot.move }.to raise_error MauxRobot::NotOkToGo

        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(0)
        expect(robot.position.face).to eq(:south)
      end
    end
  end
end
