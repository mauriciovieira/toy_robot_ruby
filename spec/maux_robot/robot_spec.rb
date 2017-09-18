# frozen_string_literal: true

require 'maux_robot'

describe MauxRobot::Robot do
  subject(:robot) { described_class.new }

  describe '#place' do
    context 'given a valid place' do
      it 'should have a position' do
        robot.place(x: 0, y: 0, face: :north)

        expect(robot.position).not_to be_nil
      end
    end

    context 'given an invalid place' do
      it 'should not have a position' do
        robot.place(x: 5, y: 0, face: :south)

        expect(robot.position).to be_nil
      end
    end

    context 'given an invalid direction' do
      it 'should not have a position' do
        robot.place(x: 0, y: 2, face: :south_east)

        expect(robot.position).to be_nil
      end
    end
  end

  describe '#left' do
    context 'robot not placed' do
      it 'should silently ignore' do
        robot.place(x: 0, y: 2, face: :south_east)
        robot.left

        expect(robot.position).to be_nil
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
      it 'should silently ignore' do
        robot.place(x: 0, y: 2, face: :north_west)
        robot.right

        expect(robot.position).to be_nil
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
        robot.move

        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(0)
        expect(robot.position.face).to eq(:south)
      end
    end
  end
end
