# frozen_string_literal: true

require 'forwardable'

module MauxRobot

  # Error to notify that the robot was not placed yet
  class RobotNotPlacedYet < StandardError
    def initialize
      super('The robot was not placed yet!')
    end
  end

  # Error to notify that the position is/would be outside the table
  class NotOkToGo < StandardError
    def initialize(position)
      super("It's not ok to go to #{position.x},#{position.y}")
    end
  end

  # The main class. It executes the actions using its table and position
  class Robot
    attr_reader :position, :talkative

    def initialize(table=MauxRobot::Table.new)
      @table = table
      @position = MauxRobot::NullPosition.new
      @talkative = false
    end

    def place(x:, y:, face:)
      position = MauxRobot::Position.new(x, y, face)

      ok_to_go?(position) do
        @position = position
      end
    end

    def move
      robot_placed? do
        next_position = @position.forward_position

        ok_to_go?(next_position) do
          @position = next_position
        end
      end
    end

    def left
      robot_placed? do
        @position.left
      end
    end

    def right
      robot_placed? do
        @position.right
      end
    end

    def report(format_type=nil)
      robot_placed? do
        @position.report(format_type)
      end
    end

    def verbose
      @talkative = !@talkative
    end

    private

    def ok_to_go?(position)
      if @table.contains?(position)
        yield
      else
        raise NotOkToGo.new(position)
      end
    end

    def robot_placed?
      unless @position.class == MauxRobot::NullPosition
         yield
      else
        raise RobotNotPlacedYet
      end
    end
  end
end