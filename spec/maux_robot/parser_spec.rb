# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
describe MauxRobot::Parser do
  subject(:parser) { described_class.new }

  describe '#parse' do
    context 'with valid orders' do
      it '#report' do
        expect(parser.parse('REPORT')).to eq(order: :report)
      end

      it '#report csv' do
        expect(parser.parse('REPORT CSV')).to eq(order: :report, arguments: { format_type: :csv })
      end

      it '#report json' do
        expect(parser.parse('REPORT JSON')).to eq(order: :report, arguments: { format_type: :json })
      end

      it '#move' do
        expect(parser.parse('MOVE')).to eq(order: :move)
      end

      it '#left' do
        expect(parser.parse('LEFT')).to eq(order: :left)
      end

      it '#right' do
        expect(parser.parse('RIGHT')).to eq(order: :right)
      end

      it '#verbose' do
        expect(parser.parse('VERBOSE')).to eq(order: :verbose)
      end

      it '#place' do
        expect(parser.parse('PLACE 0,3,WEST')).to eq(order: :place, arguments: { x: '0', y: '3', face: 'WEST' })
      end
    end

    context 'with orders with spaces and downcase' do
      it '#report' do
        expect(parser.parse('    repoRT')).to eq(order: :report)
      end

      it '#move' do
        expect(parser.parse('move      ')).to eq(order: :move)
      end

      it '#left' do
        expect(parser.parse('   LefT ')).to eq(order: :left)
      end

      it '#right' do
        expect(parser.parse('   rigHt')).to eq(order: :right)
      end

      it '#place' do
        expect(parser.parse('PLACE 2 ,  1 ,  NOrth')).to eq(
          order: :place, arguments: { x: '2', y: '1', face: 'NOrth' }
        )
      end
    end

    context 'with invalid orders' do
      it 'ignores anything else' do
        expect(parser.parse('blablabla balbla')).to be_nil
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
