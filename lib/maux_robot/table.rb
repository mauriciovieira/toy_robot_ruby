# frozen_string_literal: true

module MauxRobot

  # This class represents a table according to simulation rules
  class Table
    def initialize(x: [0, 4], y: [0, 4])
      @x = x
      @y = y
    end

    def contains?(position)
      position.valid_direction? &&
        position.x.between?(@x[0], @x[1]) &&
        position.y.between?(@y[0], @y[1])
    end
  end
end
