# frozen_string_literal: true

require 'json'

module MauxRobot::Formatter
  class Json
    def generate(position)
      JSON.generate(x: position.x, y: position.y, face: position.face.upcase.to_s)
    end
  end
end
