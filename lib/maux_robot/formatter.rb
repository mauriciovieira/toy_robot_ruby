module MauxRobot

  module Formatter
    def self.from(format_type)
      case format_type
      when :json
        Formatter::Json.new
      else
        Formatter::Csv.new
      end
    end
  end
end