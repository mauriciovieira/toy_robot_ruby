# frozen_string_literal: true

require 'maux_robot'

describe MauxRobot::CLI do
  describe '#parse' do
    context 'valid orders' do
      it '#report' do
        expect(subject.parse('REPORT')).to eq(order: :report)
      end

      it '#move' do
        expect(subject.parse('MOVE')).to eq(order: :move)
      end

      it '#left' do
        expect(subject.parse('LEFT')).to eq(order: :left)
      end

      it '#right' do
        expect(subject.parse('RIGHT')).to eq(order: :right)
      end

      it '#place' do
        expect(subject.parse('PLACE 0,3,WEST')).to eq(order: :place, arguments: { x: '0', y: '3', face: 'WEST' })
      end
    end

    context 'orders with spaces and downcase' do
      it '#report' do
        expect(subject.parse('    repoRT')).to eq(order: :report)
      end

      it '#move' do
        expect(subject.parse('move      ')).to eq(order: :move)
      end

      it '#left' do
        expect(subject.parse('   LefT ')).to eq(order: :left)
      end

      it '#right' do
        expect(subject.parse('   rigHt')).to eq(order: :right)
      end

      it '#place' do
        expect(subject.parse('PLACE 2 ,  1 ,  NOrth')).to eq(order: :place, arguments: { x: '2', y: '1', face: 'NOrth' })
      end
    end

    it 'ignores anything else' do
      expect(subject.parse('blablabla balbla')).to be_nil
    end
  end

  describe '#execute' do
    context 'commands without arguments' do
      it 'sends proper message to robot' do
        expect(subject.robot).to receive(:move)
        subject.execute(order: :move)
      end
    end

    context 'place' do
      it 'send place command along with arguments' do
        expect(subject.robot).to receive(:place).with(x: '0', y: '2', face: 'EAST')
        subject.execute(order: :place, arguments: { x: '0', y: '2', face: 'EAST' })
      end
    end
  end
end
