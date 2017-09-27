# frozen_string_literal: true

module MauxRobot::Format

  class Csv
    def generate(position)
      "#{position.x},#{position.y},#{position.face.upcase.to_s}"
    end
  end
end