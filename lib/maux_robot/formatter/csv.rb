# frozen_string_literal: true

module MauxRobot
  module Formatter
    class Csv
      def generate(position)
        "#{position.x},#{position.y},#{position.face.upcase}"
      end
    end
  end
end
