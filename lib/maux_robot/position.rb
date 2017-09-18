# frozen_string_literal: true

require 'maux_robot'

module MauxRobot

  # This class represents the Robot position on the table
  class Position
    attr_reader :x, :y, :face

    POSSIBLE_DIRECTIONS = [:north, :west, :south, :east]
    POSSIBLE_MOVEMENTS = {
      north: { x:  0, y:  1 },
      west:  { x: -1, y:  0 },
      south: { x:  0, y: -1 },
      east:  { x:  1, y:  0 },
    }

    def initialize(x, y, face)
      @x = x.to_i
      @y = y.to_i
      @face = face&.downcase&.to_sym || :invalid
    end

    def valid_direction?
      POSSIBLE_DIRECTIONS.include?(@face)
    end

    def turn_left
      next_direction_index = ( POSSIBLE_DIRECTIONS.index(@face) + 1 ) % 4
      @face = POSSIBLE_DIRECTIONS[next_direction_index]
    end

    def turn_right
      next_direction_index = ( POSSIBLE_DIRECTIONS.index(@face) - 1 )
      @face = POSSIBLE_DIRECTIONS[next_direction_index]
    end

    def forward_position
      x = @x + POSSIBLE_MOVEMENTS[@face][:x]
      y = @y + POSSIBLE_MOVEMENTS[@face][:y]
      Position.new(x, y, @face)
    end

    def to_s
      "#{@x},#{@y},#{@face.upcase.to_s}"
    end
  end
end