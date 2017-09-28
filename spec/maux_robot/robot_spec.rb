# frozen_string_literal: true

describe MauxRobot::Robot do
  subject(:robot) { described_class.new }
  let(:null_position) { MauxRobot::NullPosition.new }

  describe '#place' do
    context 'given a valid place' do
      it 'should have a position' do
        robot.place(x: 0, y: 0, face: :north)

        expect(robot.position).not_to eq null_position
      end
    end

    context 'given an invalid place' do
      it 'should raise NotOkToGo error' do
        expect { robot.place(x: 5, y: 0, face: :south) }.to raise_error MauxRobot::NotOkToGo
      end
    end

    context 'given an invalid direction' do
      it 'should raise NotOkToGo error' do
        expect { robot.place(x: 0, y: 2, face: :south_east) }.to raise_error MauxRobot::NotOkToGo
      end
    end
  end

  describe '#left' do
    context 'robot not placed' do
      it 'should raise RobotNotPlacedYet error' do
        expect { robot.left }.to raise_error MauxRobot::RobotNotPlacedYet
        expect(robot.position).to eq null_position
      end
    end

    context 'robot placed' do
      it 'should rotate accordingly' do
        robot.place(x: 1, y: 2, face: :south)
        robot.left

        expect(robot.position.face).to be(:east)
      end
    end
  end

  describe '#right' do
    context 'robot not placed' do
      it 'should raise RobotNotPlacedYet error' do
        expect { robot.right }.to raise_error MauxRobot::RobotNotPlacedYet

        expect(robot.position).to eq null_position
      end
    end

    context 'robot placed' do
      it 'should rotate accordingly' do
        robot.place(x: 3, y: 2, face: :north)
        robot.right

        expect(robot.position.face).to be(:east)
      end
    end
  end

  describe '#move' do
    context 'robot not placed' do
      it 'should raise RobotNotPlacedYet error' do
        expect { robot.right }.to raise_error MauxRobot::RobotNotPlacedYet
        expect(robot.position).to eq null_position
      end
    end

    context 'to a place on the table' do
      it 'should update its position' do
        robot.place(x: 3, y: 2, face: :north)
        robot.move

        expect(robot.position.x).to eq(3)
        expect(robot.position.y).to eq(3)
        expect(robot.position.face).to eq(:north)
      end
    end

    context 'to outside the table' do
      it 'should stay where it is' do
        robot.place(x: 0, y: 0, face: :south)

        expect { robot.move }.to raise_error MauxRobot::NotOkToGo

        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(0)
        expect(robot.position.face).to eq(:south)
      end
    end
  end
end
