# frozen_string_literal: true

require 'maux_robot'

module MauxRobot
  # This class represents the Robot position on the table
  class Position
    attr_reader :x, :y, :face

    POSSIBLE_DIRECTIONS = %i[north west south east].freeze
    POSSIBLE_MOVEMENTS = {
      north: { x: 0, y:  1 },
      west: { x: -1, y:  0 },
      south: { x: 0, y: -1 },
      east: { x: 1, y: 0 }
    }.freeze

    def initialize(x, y, face)
      @x = x.to_i
      @y = y.to_i
      @face = face&.downcase&.to_sym || :invalid
    end

    def valid_direction?
      POSSIBLE_DIRECTIONS.include?(@face)
    end

    def left
      return self unless valid_direction?

      next_direction_index = (POSSIBLE_DIRECTIONS.index(@face) + 1) % 4
      @face = POSSIBLE_DIRECTIONS[next_direction_index]
    end

    def right
      return self unless valid_direction?

      next_direction_index = (POSSIBLE_DIRECTIONS.index(@face) - 1)
      @face = POSSIBLE_DIRECTIONS[next_direction_index]
    end

    def forward_position
      return self unless valid_direction?

      x = @x + POSSIBLE_MOVEMENTS[@face][:x]
      y = @y + POSSIBLE_MOVEMENTS[@face][:y]
      Position.new(x, y, @face)
    end

    def report(format_type = :csv)
      formatter = MauxRobot::Formatter.from(format_type)
      puts formatter.generate(self)
    end

    def ==(other)
      other.x == x && other.y == y && other.face == face
    end
  end

  class NullPosition < Position
    def initialize
      super(nil, nil, nil)
    end
  end
end
