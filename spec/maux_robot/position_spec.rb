# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength:
describe MauxRobot::Position do
  describe '#initialize' do
    context 'when text input is given' do
      it 'normalizes arguments' do
        position = described_class.new('0', '1', 'SOUTH')

        expect(position.x).to eq(0)
        expect(position.y).to eq(1)
        expect(position.face).to eq(:south)
      end
    end
  end

  describe '#valid_direction?' do
    context 'when a possible diretion is given' do
      it 'is valid' do
        position = described_class.new(5, 0, :south)

        expect(position.valid_direction?).to eq(true)
      end
    end

    context 'when a not possible direction is given' do
      it 'is not valid ' do
        position = described_class.new(1, 1, :south_west)

        expect(position.valid_direction?).to eq(false)
      end
    end
  end

  describe 'rotation' do
    let(:position) { described_class.new(2, 2, :north) }

    describe '#left' do
      it 'rotates counter-clockwise' do
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

    describe '#right' do
      it 'rotates clockwise' do
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

  describe '#forward_position' do # rubocop:disable Metrics/BlockLength
    context 'when facing north' do
      let(:position) { described_class.new(5, 0, :north) }

      it 'returns a new position 1 step upwards' do
        new_position = position.forward_position
        expect(position.x).to eq(5)
        expect(position.y).to eq(0)
        expect(new_position.x).to eq(5)
        expect(new_position.y).to eq(1)
      end
    end

    context 'when facing west' do
      let(:position) { described_class.new(2, 1, :west) }

      it 'returns a new position 1 step leftwards' do
        new_position = position.forward_position
        expect(position.x).to eq(2)
        expect(position.y).to eq(1)
        expect(new_position.x).to eq(1)
        expect(new_position.y).to eq(1)
      end
    end

    context 'when facing south' do
      let(:position) { described_class.new(1, 3, :south) }

      it 'returns a new position 1 step downwards' do
        new_position = position.forward_position
        expect(position.x).to eq(1)
        expect(position.y).to eq(3)
        expect(new_position.x).to eq(1)
        expect(new_position.y).to eq(2)
      end
    end

    context 'when facing east' do
      let(:position) { described_class.new(2, 0, :east) }

      it 'returns a new position 1 step rightwards' do
        new_position = position.forward_position
        expect(position.x).to eq(2)
        expect(position.y).to eq(0)
        expect(new_position.x).to eq(3)
        expect(new_position.y).to eq(0)
      end
    end
  end

  describe '#report' do
    context 'when x, y and face are defined' do
      let(:position) { described_class.new(5, 0, :north) }

      it 'prints X,Y,FACE' do
        expect { position.report }.to output("5,0,NORTH\n").to_stdout
      end
    end

    context 'when only face is defined' do
      let(:position) { described_class.new(nil, nil, 'SOUTH') }

      it 'prints 0,0,FACE' do
        expect { position.report }.to output("0,0,SOUTH\n").to_stdout
      end
    end

    context 'when face is not defined' do
      let(:position) { described_class.new(5, 0, nil) }

      it 'prints X,Y,INVALID' do
        expect { position.report }.to output("5,0,INVALID\n").to_stdout
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength:
