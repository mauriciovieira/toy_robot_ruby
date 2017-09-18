# frozen_string_literal: true

module MauxRobot

  # The main class. It executes the actions using its table and position
  class Robot
    attr_reader :position

    def initialize(table=MauxRobot::Table.new)
      @table = table
    end

    def place(x:, y:, face:)
      position = MauxRobot::Position.new(x, y, face)

      if position.valid_direction? and @table.contains?(position)
        @position = position
      end
    end

    def left
      @position&.turn_left
    end

    def right
      @position&.turn_right
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