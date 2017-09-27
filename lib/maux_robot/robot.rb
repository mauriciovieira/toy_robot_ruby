# frozen_string_literal: true

require 'forwardable'

module MauxRobot

  # The main class. It executes the actions using its table and position
  class Robot
    attr_reader :position

    extend Forwardable
    def_delegators :@position, :left, :right

    def initialize(table=MauxRobot::Table.new)
      @table = table
      @position = MauxRobot::NullPosition.new
    end

    def place(x:, y:, face:)
      position = MauxRobot::Position.new(x, y, face)

      if position.valid_direction? && @table.contains?(position)
        @position = position
      end
    end

    def move
      next_position = @position.forward_position

      if @table.contains?(next_position)
        @position = next_position
      end
    end

    def report
      puts @position if @position
    end
  end
end