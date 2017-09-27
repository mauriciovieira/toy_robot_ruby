# frozen_string_literal: true

describe MauxRobot::Position do
  describe '#initialize' do
    context 'given text input' do
      it 'should normalize arguments' do
        position = MauxRobot::Position.new('0', '1', 'SOUTH')

        expect(position.x).to eq(0)
        expect(position.y).to eq(1)
        expect(position.face).to eq(:south)
      end
    end
  end

  describe '#valid_direction?' do
    context 'given a possible diretion' do
      it 'should be valid' do
        position = MauxRobot::Position.new(5, 0, :south)

        expect(position.valid_direction?).to eq(true)
      end
    end

    context 'given a not possible direction' do
      it 'should not be valid ' do
        position = MauxRobot::Position.new(1, 1, :south_west)

        expect(position.valid_direction?).to eq(false)
      end
    end
  end

  describe 'rotation' do
    let(:position) { MauxRobot::Position.new(2, 2, :north) }

    context '#left' do
      it 'should rotate counter-clockwise' do
        position.left
        expect(position.face).to eq(:west)

        position.left
        expect(position.face).to eq(:south)

        position.left
        expect(position.face).to eq(:east)

        position.left
        expect(position.face).to eq(:north)
      end
    end

    context '#right' do
      it 'should rotate clockwise' do
        position.right
        expect(position.face).to eq(:east)

        position.right
        expect(position.face).to eq(:south)

        position.right
        expect(position.face).to eq(:west)

        position.right
        expect(position.face).to eq(:north)
      end
    end
  end

  describe '#forward_position' do
    context 'facing north' do
      let(:position) { MauxRobot::Position.new(5, 0, :north) }

      it 'should return a new position 1 step upwards' do
        new_position = position.forward_position
        expect(position.x).to eq(5)
        expect(position.y).to eq(0)
        expect(new_position.x).to eq(5)
        expect(new_position.y).to eq(1)
      end
    end

    context 'facing west' do
      let(:position) { MauxRobot::Position.new(2, 1, :west) }

      it 'should return a new position 1 step leftwards' do
        new_position = position.forward_position
        expect(position.x).to eq(2)
        expect(position.y).to eq(1)
        expect(new_position.x).to eq(1)
        expect(new_position.y).to eq(1)
      end
    end

    context 'facing south' do
      let(:position) { MauxRobot::Position.new(1, 3, :south) }

      it 'should return a new position 1 step downwards' do
        new_position = position.forward_position
        expect(position.x).to eq(1)
        expect(position.y).to eq(3)
        expect(new_position.x).to eq(1)
        expect(new_position.y).to eq(2)
      end
    end

    context 'facing east' do
      let(:position) { MauxRobot::Position.new(2, 0, :east) }

      it 'should return a new position 1 step rightwards' do
        new_position = position.forward_position
        expect(position.x).to eq(2)
        expect(position.y).to eq(0)
        expect(new_position.x).to eq(3)
        expect(new_position.y).to eq(0)
      end
    end
  end

  describe '#to_s' do
    context 'if x, y and face are defined' do
      let(:position) { MauxRobot::Position.new(5, 0, :north) }
      it 'returns X,Y,FACE' do
        expect(position.to_s).to eq('5,0,NORTH')
      end
    end

    context 'if only face is defined' do
      let(:position) { MauxRobot::Position.new(nil, nil, 'SOUTH') }
      it 'returns 0,0,FACE' do
        expect(position.to_s).to eq('0,0,SOUTH')
      end
    end

    context 'if face is not defined' do
      let(:position) { MauxRobot::Position.new(5, 0, nil) }
      it 'returns X,Y,INVALID' do
        expect(position.to_s).to eq('5,0,INVALID')
      end
    end
  end
end
