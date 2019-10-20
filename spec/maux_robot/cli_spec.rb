# frozen_string_literal: true

require 'maux_robot'

describe MauxRobot::CLI do
  describe '#execute' do
    context 'parsed input without arguments' do
      it 'should send proper message to robot' do
        expect(subject.robot).to receive(:move)
        subject.execute(order: :move)
      end
    end

    context 'parsed place command with arguments' do
      it 'should send proper message to robot' do
        expect(subject.robot).to receive(:place).with(x: '0', y: '2', face: 'EAST')
        subject.execute(order: :place, arguments: { x: '0', y: '2', face: 'EAST' })
      end
    end
  end
end
